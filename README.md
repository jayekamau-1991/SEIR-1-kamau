# SEIR-1 Lab Submissions
## Systems Engineering & Identity Responsibility

---

## Badges

![Program](https://img.shields.io/badge/Program-SEIR--1-purple)
![Lab 1](https://img.shields.io/badge/Lab%201-PASS-brightgreen)
![Lab 2](https://img.shields.io/badge/Lab%202-PASS-brightgreen)
![GCP](https://img.shields.io/badge/Platform-Google%20Cloud-blue)
![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?logo=terraform)
![Nginx](https://img.shields.io/badge/Web%20Server-Nginx-009639?logo=nginx)
![Identity](https://img.shields.io/badge/Identity-Entra%20ID-0078D4)

---

## Overview

This repository contains all notes, artifacts, and lab submissions for the SEIR-I program — an 18-month applied program focused on cloud infrastructure, identity, and federated trust.

> "Infrastructure decides what can exist. Identity decides who is trusted."

---

## Program Stack

| Layer | Technology | Purpose |
|---|---|---|
| Resource Plane | Google Cloud Platform (GCP) | Infrastructure — VMs, networking, storage |
| Trust Plane | Microsoft Entra ID | Identity — authentication, groups, federation |
| Infrastructure as Code | Terraform | Reproducible deployments |
| Web Server | Nginx | Serves the SEIR-I Ops Panel |

---

## Repository Structure

---

## Weekly Notes

| Week | Topic | Status |
|---|---|---|
| Week 1 | GCP IAM, Identity Fundamentals | ✅ Complete |
| Week 2 | Cloud Trust, GCP VM, Terraform Intro | ✅ Complete |
| Week 3 | IAM Deep Dive | ✅ Complete |
| Week 4 | Network Diagrams, VPC | ✅ Complete |
| Week 5 | Terraform IVPAD Sequence | ✅ Complete |

---

## Lab Submissions

### Lab 1 — Manual GCP VM Deployment

**Status:** ✅ PASS

**What was built:**
- GCE VM deployed manually in GCP Console
- Nginx web server serving the SEIR-I Ops Panel on port 80
- Three endpoints validated: `/`, `/healthz`, `/metadata`
- Gate script run and passed

**Gate Results:**

| Check | Result |
|---|---|
| Homepage reachable (HTTP 200) | ✅ PASS |
| /healthz returns `ok` | ✅ PASS |
| /metadata returns valid JSON | ✅ PASS |
| metadata contains instance_name | ✅ PASS |
| metadata contains region | ✅ PASS |

---

### Lab 2 — Terraform GCP VM Deployment

**Status:** ✅ PASS

**What was built:**
- SEIR-I Ops Panel deployed via Terraform
- Firewall rule and VM created as code
- Gate script validated all endpoints
- plan.txt and apply output saved as evidence

**Gate Results:**

| Check | Result |
|---|---|
| / returns 200 | ✅ PASS |
| /healthz returns `ok` | ✅ PASS |
| /metadata returns valid JSON | ✅ PASS |
| metadata contains region | ✅ PASS |
| metadata contains VPC | ✅ PASS |
| metadata contains subnet | ✅ PASS |

---

### Labs 3 & 4 — Pending Gate Confirmation

**Status:** 🔄 Awaiting confirmation from Jacques

---

### Week 5 Homework — Terraform IVPAD Sequence

**Status:** ✅ Complete

**What was done:**
- Re-ran full Terraform IVPAD sequence against GCP
- Built and destroyed chewbacca-node-lab2 via Terraform
- Saved terraform plan output to plan_output.txt
- BaM extra credit pushed to GitHub

**Deliverables:**

| Item | Status |
|---|---|
| terraform init screenshot | ✅ |
| terraform validate screenshot | ✅ |
| terraform plan screenshot | ✅ |
| terraform apply screenshot | ✅ |
| terraform destroy screenshot | ✅ |
| date && hostname && whoami | ✅ |
| plan_output.txt | ✅ |
| BaM GitHub repo | ✅ |

**BaM Repo:** https://github.com/jayekamau-1991/TheoU_7.5_BaM_weekB

---

## Program Mantras

> "Infrastructure decides what can exist. Identity decides who is trusted."

> "If it's not logged, it didn't happen."

> "Projects are blast radius boundaries. Treat them that way."

> "Service accounts are for machines. Not for humans."

> "Least privilege is not a suggestion. It is the standard."

---

## References

- [SEIR-1 Class Repository](https://github.com/BalericaAI/SEIR-1)
- [Google Cloud Platform Documentation](https://cloud.google.com/docs)
- [Terraform Google Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

---

## Author

| Field | Details |
|---|---|
| **Author** | Kamau |
| **Group Leader** | Jacques |
| **Group Name** | TKO Group |
| **Program** | SEIR-I — Systems Engineering & Identity Responsibility |
| **Date** | April 2026 |

---

*SEIR-I Lab Submissions | TKO Group | Gate Scripts Passing*