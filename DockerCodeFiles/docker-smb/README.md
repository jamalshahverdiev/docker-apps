#### Clone repository and to the `deploy-smb` folder:
```
$ git clone https://progit.tk/devops/dockercodes.git && cd dockercodes/deploy-smb
```

#### Copy `ca.crt` file from `nginx/certs` folder to your desktop and import this to your Web browser to the `Trusted Root Certificates` folder.
### Note: 
#### Before start we must install `ansible`, `docker`, `java`, `maven` and `git` to our local server.
#### If you want create new Linux with vagrant, just use the following link:
- [Vagrant Docker Environment](https://progit.tk/vagrantfiles/vagrant-docker.git)

#### If you used the previous link to install all packages, then don't forget to add the following line to the `C:\Windows\System32\drivers\etc\hosts` file:
```bash
10.160.114.41 smbapp.loc smbcore.loc notify.smbapp.loc apidoc.smbcore.loc hrmdoc.smbcore.loc
```

#### Execute deploy everything with ansible (Input password which decrypt variables to deploy):
```bash
$ ansible-playbook deploy-docker-smb.yml --ask-vault-pass --extra-vars "envname=docker" 
```

#### Or write out password to the `./vaultpass.txt` file. Then uncomment `vault_password_file = ./vaultpass.txt` file in the `ansible.cfg` file and execute the following line:
```bash
$ ansible-playbook deploy-docker-smb.yml --extra-vars "envname=docker"
```

#### Deploy with tag
```bash
$ ansible-playbook deploy-docker-smb.yml --extra-vars "envname=docker" --tags prepareDockerComposeTasksEnv
```

- [Docker Symfony](https://github.com/eko/docker-symfony.git)
