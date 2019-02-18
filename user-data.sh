 #!/bin/bash
 
    sudo mkdir /apps
    echo "step 1 -- update" >> /tmp/post_install.log
    sudo apt-get -y update
    echo "step 2 -- update" >> /tmp/post_install.log
    sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    echo "step 3 -- update" >> /tmp/post_install.log
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    echo "step 4 -- update" >> /tmp/post_install.log
    sudo apt-key fingerprint 0EBFCD88
    echo "step 5 -- update" >> /tmp/post_install.log
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
    echo "step 6 -- update" >> /tmp/post_install.log
    sudo apt-get update
    echo "step 7 -- update" >> /tmp/post_install.log
    sudo apt-get -y install docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker ubuntu
    sudo apt-get -y install docker-compose
    cd /apps
    sudo git clone https://github.com/maur1th/simple-php-app 
    cd simple-php-app
    sed -i -bck 's/8080:80/80:80/g' docker-compose.yml
    #cat <<EOF >docker-compose.yml
    #---
    #version: "2"
    #services:
    #    app:
    #        build: .
    #        environment:
    #            DBHOST: db:3306
    #            DATABASE: training42
    #            DBUSER: duoquadra
    #            DBPASSWORD: crimson42
    #    ports:
    #        - 80:80
    #volumes:
    #mariadb: {}
    #...
    #EOF
    sudo docker-compose up -d

