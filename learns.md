## Here I put down things I learned while taking this course

- When using tags to specify things like "name" use "name" in in higher case like `Name` 
- When using a default attribute attribute of a resource like descriptions, or name. Use them in lower case like `name`, `description`

- To generate key pair from cli `ssh-keygen -t ed25519`.
Copy the path, and past on the input and then rename to what you want, in my case 
`C:\Users\Caleb/.ssh/mtckey`

- To check the ssh `ls ~/.ssh`

- File Functions is a function on terraform that is used to retrieve files on the local machine as used in this project at main.tf line 88 on the aws_key_pair resource section.
in my case this is how I utilized the File function `public_key = file("~/.ssh/mtckey.pub")` 

**User Data**
- We utilized user data to bootstarp the instance and install docker engine.

**SSH into you ec2 instance in the cloud**
Here is the syntax we used `ssh -i ~/.ssh/<your-keypair-name> @<your-instance name>@<instance-public-ip>` so in my case ==> `ssh -i  ~\.ssh\mtckey ubuntu@3.87.200.185`

**terraform apply -replace**
- This is used to replace an already existing resource when adding or making breaking changes to a resource.

- so first off list the resources with `terraform state list`, grab the resource you want to replace and then  `terraform apply -replace <resource-name>`. So in my case ==> `terraform apply -replace aws_instance.dev_node`

**Variables**
