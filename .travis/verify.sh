  
#!/bin/bash
set -o errexit

verify_syntax(){
    ansible-lint travisbook.yml || true
}

verify_lsws(){
    curl -sIk http://localhost:7080/ | grep -i LiteSpeed
    if [ ${?} = 0 ]; then
        echo '[O]  https://localhost:7080/'
    else
        echo '[X]  https://localhost:7080/'
        exit 1
    fi          
} 

verify_wordpress(){
    curl -siL http://localhost/ | grep -i WordPress
    if [ ${?} = 0 ]; then
        echo '[O]  https://localhost/'
    else
        echo '[X]  https://localhost/'
        exit 1
    fi
}

main(){
    verify_syntax
    verify_lsws
    verify_wordpress
}