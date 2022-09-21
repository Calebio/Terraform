## Here I put down things I learned while taking this course

- When using tags to specify things like "name" use "name" in in higher case like `Name` 
- When using a default attribute attribute of a resource like descriptions, or name. Use them in lower case like `name`, `description`

- To generate key pair from cli `ssh-keygen -t ed25519`.
Copy the path, and past on the input and then rename to what you want, in my case 
`C:\Users\Caleb/.ssh/mtckey`

- To check the ssh `ls ~/.ssh`

- File Functions is a function on terraform that is used to retrieve files on the local machine as used in this project at main.tf line 88 on the aws_key_pair resource section.
in my case this is how I utilized the File function `public_key = file("~/.ssh/mtckey.pub")` 
