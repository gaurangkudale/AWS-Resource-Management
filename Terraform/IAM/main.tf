provider "aws" {
  alias  = "ap_south_1"
  region = "ap-south-1"  # Specify your preferred AWS region
}

# Create IAM user
resource "aws_iam_user" "console_user" {
  provider = aws.ap_south_1
  name     = "test"
  force_destroy = true  # Allows the user to be deleted even if they have resources
}

# Create IAM policy for EC2 full access
resource "aws_iam_policy_attachment" "ec2_full_access" {
  provider  = aws.ap_south_1
  name      = "ec2_full_access"  # Adding the required name argument
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  users      = [aws_iam_user.console_user.name]
}

# Create IAM policy for console access
resource "aws_iam_user_policy" "console_access_policy" {
  provider = aws.ap_south_1
  name     = "console_access_policy"
  user     = aws_iam_user.console_user.name

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "iam:ChangePassword"
        ],
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": [
          "ec2:*"
        ],
        "Resource": "*"
      }
    ]
  })
}

# Create login profile for the user to allow console access
resource "aws_iam_user_login_profile" "console_user_login_profile" {
  provider = aws.ap_south_1
  user     = aws_iam_user.console_user.name
  depends_on = [aws_iam_user.console_user]
}

# Create access key for the IAM user
resource "aws_iam_access_key" "console_user_access_key" {
  provider = aws.ap_south_1
  user     = aws_iam_user.console_user.name
  depends_on = [aws_iam_user.console_user]
}

# Output the access key and secret key to the console
output "access_key_id" {
  value = aws_iam_access_key.console_user_access_key.id
}

output "secret_access_key" {
  value = aws_iam_access_key.console_user_access_key.secret
  sensitive = true  # This marks the output as sensitive, so it will be redacted in some contexts
}
