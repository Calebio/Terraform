# Terraform
**This is a single availability zone AWS Cloud Architecture I build as a developement environment with a developement EC2 instance and Docker pre-installed by using a bash scripting to install both Docker and Terraform in my Development Server.** <br/>
**This makes it easy for developers to seamlessly ssh into an EC2 instance in the Development server created on AWS with vscode.**
- **On the /learns.md page, that's where I write down everything new I have learned and possible the errors you might encounter will running this project and how I solved them. I hope this is useful for you.**

## Steps to run the project
- If you haven't already set up your github use these piece of code to set up <br/>
```
git config --global user.name "yourName"
git config --global user.email "yourEmail"
```
- you can clone the project with the code `git clone https://github.com/Calebio/Terraform.git`
- change directory to the terraform page `cd Terraform`
- Then run your `terraform init`
- You can use `terraform plan` to see all the resources that will be created.
- If you check the `user.tpl` file you will find all the files that will be pre-installed with the development server
- You can use `terraform apply -auto-approve` to deploy the resources to AWS. You can also check in the console to confirm everything deployed
- To destroy the resources use `terraform destory -auto-approve`

![This is an image](https://github.com/Calebio/Terraform/blob/main/Dev-Archi.png)

