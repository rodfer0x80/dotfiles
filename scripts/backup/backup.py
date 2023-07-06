#!/usr/bin/python3


from datetime import date
import sys
import os 


if __name__ == "__main__":
    if len(sys.argv) < 2 or len(sys.argv) > 3:
        sys.stderr.write("Usage: ./backup.py <device> <Y/n-delete_local_copies(default=n)>\n")
        exit(1)
        
    if len(sys.argv) == 3:
        if sys.argv[2] == "Y" or sys.argv[2] == "y" or sys.argv[2] == "yes" or sys.argv[2] == "Yes":
            del_local_copies = True
    device = sys.argv[1]

    pwd = "/".join([n for n in __file__.split('/')[:-1]])+"/"
    backup_file_path = f"{pwd}backup.txt"

    _dirs = list() 
    with open(backup_file_path, 'r') as fp:
        _dirs = fp.read().splitlines()
    dirs = " ".join([_dir for _dir in _dirs])
    
    sys.stdout.write("[*] Starting backup process...\n")
    
    date = date.today()
    date = date.strftime("%d-%m-%Y")
    
    sys.stdout.write("[*] Compressing into tarball...\n")
    os.system(f"tar -cf backup-{date}.tar.gz {dirs}")
    
    sys.stdout.write("[*] Generating SHA1 checksum...\n")
    os.system(f"shasum -a 1 backup-{date}.tar.gz | cat > backup-{date}.sha1")
    
    sys.stdout.write(f"[*] Copying into device {device}...\n")
    os.system(f"sudo cp -r backup-{date}.tar.gz {device}")
    os.system(f"sudo cp -r backup-{date}.sha1 {device}")
    
    os.system(f"mv backup-{date}.tar.gz ~/rubbish")
    os.system(f"mv backup-{date}.sha1 ~/rubbish")
    sys.stdout.write("[*] Done!\n")
    exit(0)
