Continuous Delivery
===================

Ansible Playbooks and Docker files used for continuous delivery

## Notes

    #include https://get.docker.io

    export ANSIBLE_HOSTS=~/ansible_hosts

    ansible-playbook -i hosts jenkins.yml -vv
    ansible-playbook -i hosts shutdown.yml -vv

    ansible all -m ping -vvvv
    ansible all -a "echo \"Hello\""
