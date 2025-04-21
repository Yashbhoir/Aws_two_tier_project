![image](https://github.com/user-attachments/assets/6f21c888-f26f-4138-8853-2319f9cf2bba)
**Architecture Overview**

This project implements a two-tier architecture 



**Frontend Tier**

Web servers are deployed in an Auto Scaling Group for high availability
Application Load Balancer to distribute traffic
Public subnets across multiple Availability Zones

**Backend Tier**

Database servers in private subnets
RDS MySQL/Aurora for database services
Protected by security groups with restricted access

**Network & Security**

VPC with public and private subnets
NAT Gateways for outbound connectivity from private subnets
Security Groups for fine-grained access control
Internet Gateway for public access

**Repository Structure**

![image](https://github.com/user-attachments/assets/2b592957-f163-4d8b-a073-bfec214b852c)


**AWS Account**

AWS CLI configured with appropriate permissions
Terraform v1.0.0+
Git
Basic understanding of AWS services

**Deployment Instructions**

Note - add your access key and secret key in the Terraform.tf file before proceeding to further steps

1. Clone the Repository
   git clone https://github.com/Yashbhoir/Aws_two_tier_project.git
2. cd Aws_two_tier_project
3. Initialize Terraform
   cd terraform
   terraform init
4. Customize Configuration
   Review and modify the variables.tf file to adjust:

   VPC CIDR block
   Subnet configurations
   Instance types
   Database settings
   Region preferences

5. Deploy the Infrastructure
   terraform plan
   terraform apply 
6. Access Your Application
   Once deployment is complete, the application load balancer DNS will be displayed in the AWS GUI. Use this URL to access the web application.
   Security Considerations
   This architecture implements several security best practices:

   Web tier separated from database tier
   Database instances in private subnets
   Security groups limiting access between tiers
   Encrypted data in transit and at rest
   IAM roles with minimal required permissions

**Cost Optimization**

To optimize costs:

Use spot instances where appropriate
Implement Auto Scaling for demand-based scaling
Consider RDS reserved instances for long-term deployments
Enable detailed billing alerts and monitoring

**Cleanup**

To avoid incurring charges, destroy the infrastructure when not in use:
terraform destroy

**Contributing**

Contributions are welcome! Please feel free to submit a Pull Request.
