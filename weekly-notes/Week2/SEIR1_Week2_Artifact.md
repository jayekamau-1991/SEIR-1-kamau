# SEIR-1 Week 2 Artifact — Trust Diagram
## Cloud as a Trust Boundary

---

## The Core Flow

```
┌─────────────┐         ┌──────────────────────┐         ┌─────────────────┐
│    USER     │         │  MICROSOFT ENTRA ID  │         │      GCP        │
│             │         │   (Trust Plane)      │         │ (Resource Plane)│
│  Attempts   │────────>│                      │         │                 │
│  to access  │ Step 1  │  1. Who are you?     │         │                 │
│  GCP        │         │  2. Are you trusted? │         │                 │
│             │         │  3. Check MFA,       │         │                 │
│             │         │     policies,        │         │                 │
│             │         │     credentials      │         │                 │
│             │<────────│                      │         │                 │
│             │ Step 2  │  Issues TOKEN        │         │                 │
│             │  Token  │  (proof of identity) │         │                 │
│             │ issued  └──────────────────────┘         │                 │
│             │                                          │                 │
│             │─────────────────────────────────────────>│                 │
│             │ Step 3 — Presents token to GCP           │                 │
│             │         [crosses trust boundary]         │  IAM Policy     │
│             │                                          │  Check:         │
│             │                                          │  Is this        │
│             │                                          │  identity       │
│             │                                          │  permitted to   │
│             │                                          │  do this        │
│             │                                          │  action?        │
│             │<─────────────────────────────────────────│                 │
│             │ Step 4 — Access GRANTED or DENIED        │                 │
└─────────────┘                                          └─────────────────┘
```

---

## What Each Part Does

### User
- Attempts to access a GCP resource
- Cannot authenticate directly with GCP
- Must go through Entra ID first

### Microsoft Entra ID (Trust Plane)
- The identity authority for the organization
- Authenticates the user — proves who they are
- Issues a token after successful authentication
- Does NOT run infrastructure
- DOES decide who is trusted

### Token
- A digital credential issued by Entra ID after authentication
- Presented to GCP as proof of identity
- Has an expiry — when it expires, access is denied until re-authentication
- Carries the user across the trust boundary

### GCP (Resource Plane)
- Hosts the actual infrastructure
- Does NOT authenticate users
- DOES check authorization via IAM policies
- Grants or denies access based on IAM policy and token claims

### Federation
- The configured trust agreement between Entra ID and GCP
- Allows GCP to accept identity claims from Entra ID
- If federation breaks, all federated users lose access regardless of valid credentials

---

## The Trust Boundary

```
─────────────────────────────────────────────────────────────────
  TRUST PLANE                    │           RESOURCE PLANE
  Microsoft Entra ID             │           Google Cloud Platform
                                 │
  Manages users, groups,         │           Manages infrastructure,
  authentication, tokens         │           compute, storage, networks
                                 │
  Controls WHO is trusted        │           Controls WHAT can be done
                                 │
─────────────────────────────────────────────────────────────────
                         TRUST BOUNDARY
              Every crossing must be verified.
              Trust is not assumed. It is configured.
```

---

## What Can Go Wrong

| Failure | Cause | Result |
|---|---|---|
| Authentication fails | Wrong credentials, MFA blocked | User cannot get token |
| Token expires | Session timeout | Access denied until re-auth |
| Federation breaks | Certificate expires, config changes | All federated users lose access |
| IAM policy missing | Role not assigned | Authenticated but not authorized |
| Wrong project | User has access to Project A not B | Access denied in correct project |

---

## Oral Explanation

A user tries to access GCP but must first go through Entra ID to confirm who they are. Entra ID checks their credentials, MFA, and policies. If everything passes, a token is issued as proof of identity. The user takes that token and crosses the trust boundary to present it to GCP. GCP checks its IAM policy to determine what permitted actions the identity has. Based on that check the user is either granted access or denied access to perform the action.

---

## Key Takeaways

> "GCP decides what can be done. Entra ID decides who can do it."

> "Federation is a bridge. Bridges can collapse."

> "A token is not permanent. Treat it like a visitor badge, not a key."

> "Trust is not inherited. It must be configured and verified."

---

*SEIR-1 Week 2 Artifact | Cloud as a Trust Boundary*
