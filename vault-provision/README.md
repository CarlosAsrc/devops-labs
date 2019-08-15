# Vault
Vault provision with Dockerfile, Ansible Playbook and Jenkins pipeline.

## Docker
- Build the image using `docker build -t vault .`
- Run the container using `docker run --name=vault vault`
- The vault server will be started.

## Ansible and Jenskins
### Jenkins configuration
#### Plugin installation
- Go to Jenkins plugins and install `Ansible` plugin.

#### Credentials configuration
- git_credentials: A "User with password" credentials configuration with the user and password of the git account.
- vault_password: A "Secret text" credentials with the vault password given when the ansible-vaulted as created.
- system_credentials: Your system credentials, required to run `ansiblePlaybook` of Ansible plugin.

#### Encrypted file configuration
- Create a encrypted file in Jenkins directory with `ansible-vault create /var/lib/jenkins/secrets.yml`.
- Choose the vault password.
- Edit the file opened with the `ansible_become_pass: "<system_credentials>"`
- Configure Jenkins as owner of Jenkins path and vault path with `chown -R jenkins /var/lib/jenkins/ /usr/local/bin/`.

#### Pipeline configuration
- Create a job of type pipeline.
- Use the Jenkinsfile content as pipeline script.
