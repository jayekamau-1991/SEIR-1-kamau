# SEIR-1 Study Notes
## Systems Engineering & Identity Responsibility

> "Infrastructure decides what can exist. Identity decides who is trusted."

---

## About This Repository

Personal study notes, artifacts, and deliverables for the SEIR-1 program — an 18-month applied program focused on cloud infrastructure, identity, and federated trust using **Google Cloud Platform** and **Microsoft Entra ID**.

---

## Program Stack

| Layer | Technology | Purpose |
|---|---|---|
| Resource Plane | Google Cloud Platform (GCP) | Infrastructure — VMs, networking, storage |
| Trust Plane | Microsoft Entra ID | Identity — authentication, groups, federation |
| Infrastructure as Code | Terraform | Reproducible deployments |
| Identity Automation | PowerShell | Identity queries and automation |
| Evidence & Logging | Python | Log analysis and validation |

---

## Weekly Progress

| Week | Topic | Notes | Artifact | Status |
|---|---|---|---|---|
| Week 1 | What Identity Actually Controls | `SEIR1_Week1_Notes.txt` | `SEIR1_Week1_Artifact.md` | ✅ Complete |
| Week 2 | Cloud as a Trust Boundary | `SEIR1_Week2_Notes.txt` | `SEIR1_Week2_Artifact.md` | ✅ Complete |
| Week 3 | GCP Project & IAM Fundamentals | `SEIR1_Week3_Notes.txt` | `SEIR1_Week3_IAM_Artifact.md` | ✅ Complete |
| Week 4 | Compute & Networking | `SEIR1_Week4_Notes.txt` | `SEIR1_Week4_Network_Diagram.png` | ✅ Complete |
| Week 5 | GCP Logging & Evidence | — | — | ⬜ Pending |
| Week 6 | Azure AD / Entra ID Core Concepts | — | — | ⬜ Pending |
| Week 7 | Federation & SSO | — | — | ⬜ Pending |
| Week 8 | PowerShell for Identity | — | — | ⬜ Pending |
| Week 9 | Workforce Identity Federation | — | — | ⬜ Pending |
| Week 10 | Controlled Access to GCP via Azure AD | — | — | ⬜ Pending |
| Week 11 | Identity Failure & Recovery | — | — | ⬜ Pending |
| Week 12 | Python for Evidence | — | — | ⬜ Pending |
| Week 13 | PowerShell + Python Together | — | — | ⬜ Pending |
| Week 14 | Pre-Lab Discipline | — | — | ⬜ Pending |
| Week 15 | Mock Lab | — | — | ⬜ Pending |
| Week 16 | Lab 1 Readiness Review | — | — | ⬜ Pending |

---

## Lab Deliverables

| Lab | Description | Status |
|---|---|---|
| Lab 1 | Manual GCP VM — nginx, ops panel, gate script | ✅ Complete |
| Lab 2 | Terraform GCP VM deployment | ✅ Complete |
| Lab 3 | TBD | ✅ Complete |
| Lab 4 | Multi-cloud VPN — AWS Tokyo to GCP Iowa with BGP | ✅ Complete |
| Lab 5 | GCP + Docker + Jenkins | 🔄 In progress |

---

## Core Program Mantras

> "Infrastructure decides what can exist. Identity decides who is trusted."

> "Identity changes are slow, deliberate, and high-impact."

> "If it's not logged, it didn't happen."

> "Shift left — chase failure to learn."

> "AI is a bounded assistant. Never the decision maker."

> "Projects are blast radius boundaries. Treat them that way."

> "Service accounts are for machines. Not for humans."

> "Least privilege is not a suggestion. It is the standard."

---

## Tools Used

* **GCP Console** — cloud.google.com
* **gcloud CLI** — command line interface for GCP
* **Terraform** — infrastructure as code
* **Docker** — local lab environment
* **Jenkins** — CI/CD pipelines
* **VS Code** — primary editor
* **GitHub** — version control and evidence repository
* **draw.io** — architecture and trust diagrams
* **NotebookLM** — study and review

---

## GCP Project

| Property | Value |
|---|---|
| Project ID | `dusty-warrior-project` |
| Region | `us-central1` |
| Zone | `us-central1-a` |
| gcloud config | `class75` |
| Service Account | `terraform-service` |

---

*SEIR-1 | 18-Month Applied Program | GCP Infrastructure + Microsoft Entra ID*
