# Bsides 2020 Notes
This page contains my raw notes used to build the demo. 
![Demo Design](bsides/2020/Bsides2020.jpg)

## Pre-Requisites
The toolset below was used to prepare and build the demo.

### Visual Studio Code
1. https://code.visualstudio.com/download
2. Install
3. Open Folder > Navigate to your GitHub folder
4. Download and install Git as needed selecting VS Code as Git's default editor

### Packer
1. Download windows packer https://www.packer.io/downloads
2. Extract to C:\WINDOWS\system32
3. Leverage template from https://learn.hashicorp.com/tutorials/packer/getting-started-build-image
  3. AWS > EC2 > Launch > Grab latest U18 AMI ID
4. Use CLI describe-images to locate the source name e.g. ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-<date>
5. Update the .json source_ami_filter.filters.name
6. Replace the date with -* on the end to ensure the latest image is used
7. Instance_type: t4g.nano 

#### Useful commands
```shell
$ packer validate aws-u18-dockvpn.json
$ packer build -var 'aws_access_key=$(aws_access)' -var 'aws_secret_key=$(aws_secret)' -var 'azdo_build=$(Build.BuildNumber)' aws-u18-dockvpn.json
$ aws ec2 describe-images --image-ids ami-0ea142bd244023692
```

### Docker Desktop
1. https://hub.docker.com/editions/community/docker-ce-desktop-windows
2. Download and install
3. Reboot
4. Requires Kernel update - https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel
5. Reboot


#### Useful commands
```shell
$ docker run --name bsides -v /home/ubuntu/index.html:/usr/share/nginx/html/index.html:rw -p 80:80 -d nginx
$ docker images
$ docker ps
$ docker top
$ docker image build --tag rickpayne929/vmac .
$ docker container ls
$ docker container stop 7d21b13c3175
$ docker container rm 7d21b13c3175
```

### AWS CLI v2
1. https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html 

#### Useful commands


### Putty



## Tooling


### Azure DevOps - Sign in & Create First Project

### Azure DevOps - First Pipeline


### AWS - Create Auto Scaling Group


### AWS - Create Launch Tempalte


### AWS - ASG Instance Refresh

### AWS - ASG User Data

### GitHub - Branch Protection



### Packer - AWS .json

