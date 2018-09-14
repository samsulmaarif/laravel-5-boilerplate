ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook ansible/deploy-dev.yml -i ansible/inventory/$1 --extra-vars "release=`git rev-parse HEAD | cut -c1-8` app=../../ project_name=laraplate"
