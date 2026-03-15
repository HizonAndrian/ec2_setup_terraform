Steps

Create repo in github

Initialize git locally

Create a workspace in Terraform cloud

How to get the AMI
 - Go to EC2 in AWS console
 - Click on AMI Catalog in the left sidebar
 - Search for Amazon Linux in the search bar
 - Select the latest Amazon Linux 2023 AMI and copy the AMI ID
 - Use CLI to get the rest of AMI info needed to filder it.
 - COMMAND: aws ec2 describe-images --image-ids <AMI-id from AMI Catalog search>