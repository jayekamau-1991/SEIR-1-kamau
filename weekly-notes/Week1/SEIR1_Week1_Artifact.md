# SEIR-1 Week 1 Artifact — What Identity Controls
## What Identity Actually Controls in a Cloud System

---

## 1. Authentication, Authorization, and Trust

**Authentication** is about proving who you are. You present your credentials and the system confirms your identity. Authentication alone does not give you access.

**Authorization** is about what actions you are permitted to perform on what resources. It happens after authentication. You can be authenticated and still be denied.

**Trust** is a configured relationship between two systems. One system agrees to accept identity claims from another. In SEIR-1, GCP trusts Microsoft Entra ID to verify users. Trust is not automatic. It must be configured deliberately and can break.

---

## 2. Why a Lockout Is an Outage

A server outage has a known recovery path — restart it, roll it back, redeploy. The tools to fix it are still accessible.

An identity outage can block the recovery path itself. If the admin account is locked out, the person who needs to fix the problem cannot get in to fix it. The infrastructure is still running but no one authorized can touch it.

That is an outage. Work stops. Not because the servers are down — but because no one can reach them.

---

## 3. Why Access Recovery Is Harder Than Deployment Rollback

Deployment rollback restores files automatically. The system does not care — it just runs the previous version.

Identity recovery requires a trusted account to still be accessible and a human to execute the recovery steps in the correct order. If the trusted account is also affected, the recovery chain is broken. You cannot proceed without escalating further. One wrong step can expand the lockout instead of fixing it.

Code does not fight back. Identity recovery depends on a chain of trusted humans and accounts remaining intact.

---

## Key Takeaways

> "Infrastructure decides what can exist. Identity decides who is trusted."

> "Identity changes are slow, deliberate, and high-impact."

> "If it's not logged, it didn't happen."

---

*SEIR-1 Week 1 Artifact | What Identity Actually Controls*
