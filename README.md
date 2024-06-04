# AWS-Resource-Management
AWS Resource Management Via Terraform

# Terraform Script for AWS EC2 Instance

This Terraform script creates an EC2 instance in the AWS Mumbai region (ap-south-1) with specific configurations. The default password for the Ubuntu user is set to `Test@123`.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS IAM account with necessary permissions with Access and Secret access keys.
- AWS CLI configured with your credentials.

## Configure AWS CLI

1. **Install AWS CLI**: If you haven't installed AWS CLI yet, you can install it by following the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

2. **Configure AWS CLI with your credentials**: Use the following command and follow the prompts to configure your AWS CLI with your access key and secret key.

    ```sh
    aws configure
    ```

    You will be prompted to enter the following details:
    - AWS Access Key ID: `YOUR_ACCESS_KEY`
    - AWS Secret Access Key: `YOUR_SECRET_KEY`
    - Default region name: `ap-south-1`
    - Default output format: `json`

    Replace `YOUR_ACCESS_KEY` and `YOUR_SECRET_KEY` with your actual AWS access key and secret key.

## Usage

1. **Initialize Terraform**: This command initializes various local settings and data that Terraform needs to run.

    ```sh
    terraform init
    ```

2. **Plan the deployment**: This command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

    ```sh
    terraform plan
    ```

3. **Apply the deployment**: This command applies the changes required to reach the desired state of the configuration.

    ```sh
    terraform apply
    ```

4. **Retrieve the public DNS of the EC2 instance**: Use the following command to get the public DNS of the created EC2 instance.

    ```sh
    terraform show | grep public_dns
    ```
