# SEIR-1 Week 3 Artifact — IAM Role Mapping
## GCP Project & IAM Fundamentals

---

## 1. Current Role and Why It Is Risky

`terraform-service` currently has the **Owner** role on project `dusty-warrior-project`.

This allows me to:
- Set up infrastructure
- Control access
- Use resources
- Monitor the project
- Manage billing

This is risky because if the JSON key is compromised, an attacker has full control of the project including:
- Deleting all resources
- Modifying IAM to lock me out
- Running up charges on my billing account
- Creating backdoor accounts

---

## 2. What Roles It Should Have Instead (Least Privilege)

Terraform only needs to do three things:
- Create and manage virtual machines
- Manage storage buckets
- Maintain container images

Instead of Owner, `terraform-service` should only have:

| Role | Why It Is Needed |
|---|---|
| Compute Admin | Create and manage VMs and firewall rules |
| Storage Admin | Manage storage buckets |
| Artifact Registry Administrator | Maintain container images |

These roles give Terraform exactly what it needs and nothing more. This is **least privilege**.

---

## 3. Blast Radius Boundary

`dusty-warrior-project` is a blast radius boundary.

Any mistakes or compromises inside this project stay contained to this project only. They cannot affect other GCP projects.

This is why Production, Staging, and Development should always be in **separate projects** — so that any mistake or compromise in one cannot reach the others.

---

## 4. Why Humans Should Not Use Service Accounts

Service accounts are designed for machines and automation — not humans.

A human logging in with a service account:
- Bypasses normal authentication controls like MFA and conditional access policies
- Makes it impossible to tell which human used the account or when if the key is shared
- Creates an unauditable identity

Humans must authenticate through their own identity so every action is **auditable and attributed to the individual human**.

---

## Key Takeaways

> "Service accounts are for machines. Not for humans."

> "Least privilege is not a suggestion. It is the standard."

> "Projects are blast radius boundaries. Treat them that way."

---

*SEIR-1 Week 3 Artifact | GCP Project & IAM Fundamentals*
