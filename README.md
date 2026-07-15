# IAM Security Implementation with Least Privilege Access Control

This project demonstrates AWS IAM security fundamentals using users, groups, roles, policies, MFA, and least privilege access design.

## Skills Covered

- IAM users and groups
- IAM roles
- Customer managed policies
- MFA enforcement
- Least privilege access
- Security review checklist

## Project Structure

```text
policies/             Sample least privilege IAM policies
terraform/            IAM starter configuration
docs/                 Review checklist
```

## Implementation Steps

1. Create IAM groups by job function.
2. Attach minimum required policies.
3. Enforce MFA for console users.
4. Use roles instead of long-lived access keys for AWS services.
5. Review unused permissions with IAM Access Analyzer.

## Deploy

```bash
cd terraform
terraform init
terraform plan
terraform apply
```
