#!/bin/bash

# Check if the working directory is provided as an argument
if [[ -z "$1" ]]; then
    echo "Usage: $0 <chroot-directory> <binary1> <binary2> ... <binaryN>"
    exit 1
fi

# Set the chroot directory from the first argument
CHROOT_DIR="$1"
shift  # Shift the arguments so that $@ now contains the list of binaries

# Function to copy a binary and its dependencies
copy_binary_and_dependencies() {
    local binary="$1"
    local chroot_dir="$2"

    # Create the necessary directories in the chroot environment
    mkdir -p "$chroot_dir$(dirname "$binary")"

    # Copy the binary
    cp "$binary" "$chroot_dir$binary"

    # Find and copy all dependencies
    local deps=$(ldd "$binary" | awk '{ if (match($3, "/")) { print $3 } }')
    for dep in $deps; do
        mkdir -p "$chroot_dir$(dirname "$dep")"
        cp "$dep" "$chroot_dir$dep"
    done

    # Copy the dynamic linker
    local ld=$(ldd "$binary" | grep 'ld-linux' | awk '{ print $1 }')
    if [[ -n "$ld" ]]; then
        mkdir -p "$chroot_dir$(dirname "$ld")"
        cp "$ld" "$chroot_dir$ld"
    fi
}

# Function to setup the chroot environment
setup_chroot() {
    local chroot_dir="$1"
    shift  # Shift the arguments so that $@ now contains the list of binaries

    # Create the chroot directory
    mkdir -p "$chroot_dir"

    # Copy necessary binaries and their dependencies
    for binary in "$@"; do
        if [[ -n "$binary" && "$binary" != \#* ]]; then
            copy_binary_and_dependencies "$binary" "$chroot_dir"
        fi
    done

    # Create necessary device files
    mkdir -p "$chroot_dir/dev"
    mknod -m 666 "$chroot_dir/dev/null" c 1 3
    mknod -m 666 "$chroot_dir/dev/tty" c 5 0
    mknod -m 666 "$chroot_dir/dev/zero" c 1 5
    mknod -m 666 "$chroot_dir/dev/random" c 1 8
}

# Main function to setup the chroot environment
main() {
    local chroot_dir="$1"
    shift  # Shift the arguments so that $@ now contains the list of binaries

    # Setup the chroot environment
    setup_chroot "$chroot_dir" "$@"
}

# Execute the main function with the provided arguments
main "$CHROOT_DIR" "$@"

# sudo ./chrootenv.sh /opt/chroot /bin/ls /bin/bash /usr/bin/convert
