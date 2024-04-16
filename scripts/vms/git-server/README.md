# git-server
## host a private git server
within Docker and with the simplicity of bash scripting for the following tasks:
* init server - spin up server
* test server - test connection
* debug server - pop a shell on the docker container
* make new repository (locally but setting up everything in the server accordingly)
* clone repository from server
## instructions
* git clone https://github.com/trevalkov/git_server && cd git_server
* docker pull jkarlos/git-server-docker
* ./init-server.sh
* ./test-server.sh
* use make-repo.sh and clone-repo.sh accordingly
* get-server-ipv4.sh is used to get docker vboxnet0
## image source and setup
* https://github.com/jkarlosb/git-server-docker
* https://registry.hub.docker.com/r/jkarlos/git-server-docker
