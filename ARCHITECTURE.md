# Architecture — IAM Least-Privilege Security Implementation

An IAM security model built on least privilege: users are grouped, permissions are attached to groups and roles, and MFA is enforced.

```mermaid
flowchart TB
    U[IAM Users] -->|member of| G[IAM Groups]
    G -->|attached| P[Scoped Policies - least privilege]
    U -->|assume| R[IAM Roles]
    R -->|attached| P
    U -->|must pass| MFA[MFA Enforcement]
    P --> AWS[(AWS Resources - EC2, S3)]
```

## How it works

- IAM users are organized into groups instead of receiving permissions directly.
- Scoped policies grant only the minimum permissions required for each job function.
- IAM roles allow temporary, assumable access without long-lived credentials.
- MFA is enforced so that access to sensitive actions requires a second factor.
