# ansible-lomp-wp

```
ansible-playbook -l example.com playbook.yml
```
# Ansible Playbook for setting up OpenLiteSpeed WordPress

## How to use
1. Install ansible on center server
```
apt update && apt install ansible -y
```
2. Add SSH key to the client server so center server can ssh in without password
3. Download the git repo
```
git clone https://github.com/Code-Egg/ansible-lomp-wp.git
```
4. Update `example.com` from inventory to your client server's domain/IP
```
cd ansible-lomp-wp; vi inventory
```
5. Update SQL, Domain, Port from vars/default.yml
```
vi vars/default.yml
```
6. Run ansible playbook
```
ansible-playbook playbook.yml
```