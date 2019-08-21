# DevOps Tools Introduction

### Desenvolvedores:
 - [Carlos Rodrigues](http://github.com/CarlosAsrc)
 - [Dione Adam](http://github.com/@DioneAdam)


### Apresentação

link da apresentação: https://youtu.be/BBCdobTH2BU

## CONFIGURAÇÕES INICIAIS

 - INSTALL JENKINS

		sudo apt-get update
		sudo apt-get -y upgrade
		wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
		echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a  /etc/apt/sources.list > /dev/null
		sudo apt-get update
		sudo apt-get install -y jenkins

	- get initial admin password with 
			
		sudo cat /var/lib/jenkins/secrets/initialAdminPassword

 - INSTALL JFROG ARTIFACTORY SERVICE

		wget https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-6.10.2.zip -O artifactory.zip
		unzip artifactory.zip
		sudo mv artifactory-oss-6.10.2 /opt/artifactory
		sudo /opt/artifactory/bin/installService.sh
		sudo service artifactory start

 - INSTALL PACKER

		sudo apt install -y packer

## JOBS

 - JOB1
	- Configurar clone do repositório.
	- Configurar Artifactory Plugin para o Jenkis
	- No JOB1, configurar o artifactory com o server http://localhost:8081/artifactory
	- No build, adicionar um passo com a opção "Invoke Gradle Script", e adicionar em "Tasks" as tasks "clean test build artifactoryPublish"

 - JOB2
	- Configurar clone do repositório.
	- Comandos shell na configuração do job:
		```
		cd carlos-rodrigues/Tema-final-1/Project
		rm -f Project-unspecified.war
		wget http://localhost:8081/artifactory/gradle-release-local/Project/unspecified/Project-unspecified.war
		packer build template.json
		docker push carlosasrc/tema-final-1:latest
		```


 - JOB3
	- Configurar clone do repositório.
	- Comando shell na configuração do job:
		docker run -p 8082:8080 carlosasrc/tema-final-1:latest

 - Para rodar todos os jobs em um pipeline, pode ser utilizado um pipeline script:

		node{
			stage('JOB1'){
				build "Job1"
			}
			stage('JOB2'){
				build "Job2"
			}
			stage('JOB3'){
				build "Job3"
			}
		}
		

