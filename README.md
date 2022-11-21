# Terraform
**This is a single availability zone AWS Cloud Architecture I build as a developement environment with a developement EC2 instance and Docker pre-installed by using a bash scripting to install both Docker and Terraform in my Development Server.** <br/>
**This makes it easy for developers to seamlessly ssh into an EC2 instance in the Development server created on AWS with vscode.**
- **On the /learns.md page, that's where I write down everything new I have learned and possible the errors you might encounter will running this project and how I solved them. I hope this is useful for you.**

## Prerequisite for this project.
- Docker. this project pre-installs docker so after spinning up the server check the server to see the version of docker that is installed
- Terraform. this project pre-installs terraform so after spinning up the server check the server to see the version of terraform that is installed


## Steps to run the project

- If you are yet to set up your aws account to work with vscode, [use this documentation](https://docs.aws.amazon.com/toolkit-for-vscode/latest/userguide/welcome.html) to set up your AWS account and integrate with vscode.
- you can clone the project with the code `git clone https://github.com/Calebio/Terraform.git`
- change directory to the terraform page `cd Terraform`
- Then run your `terraform init`
- You can use `terraform plan` to see all the resources that will be created.
- If you check the `user.tpl` file you will find all the files that will be pre-installed with the development server
- You can use `terraform apply -auto-approve` to deploy the resources to AWS. You can also check in the console to confirm everything deployed
- To login to the server with ssh go the remote explorer on your vscode and click in the dropdown, select ssh-targets and you will see the ip address of the new development server. Just click connect to access it.
- To destroy the resources use `terraform destory -auto-approve`

![This is an image](https://github.com/Calebio/Terraform/blob/main/Dev-Archi.png)

