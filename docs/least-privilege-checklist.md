# Least Privilege Checklist

- Prefer IAM roles for AWS services.
- Avoid `Action: "*"` unless there is a documented exception.
- Avoid `Resource: "*"` when the service supports resource-level permissions.
- Require MFA for console users.
- Rotate and remove unused access keys.
- Use IAM Access Analyzer to identify broad access.
- Split permissions by job role instead of attaching admin policies.
- Review CloudTrail events for unusual API activity.
