install_docker(){
    curl -sSL https://get.docker.io/ | sh
}

install_images(){
    docker run -d --name ttrssdb nornagon/postgres
    docker run -d --link ttrssdb:db -p 80:80 clue/ttrss
}

auto_start(){
    echo -e "\nservice docker start">>/etc/rc.local
    echo -e "\ndocker start 5e2b24170f48">>/etc/rc.local
    echo -e "\ndocker start bfb852637256">>/etc/rc.local
    chmod +x /etc/rc.d/rc.local
}

config_sys(){
    auto_start
}

main(){
    install_docker
    install_images
    config_sys
}