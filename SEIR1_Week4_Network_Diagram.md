# SEIR-1 Week 4 Artifact — VM Network Diagram
## Compute & Networking

---

## Network Architecture

```
┌─────────────────┐         ┌──────────────────┐         ┌──────────────────────────────────┐
│                 │         │                  │         │  VPC: default                    │
│    Internet     │────────>│    Firewall      │         │  Region: us-central1             │
│                 │ Port 80 │                  │         │                                  │
│                 │ Port 22 │  Allow Port 80   │────────>│  ┌────────────────────────────┐  │
│                 │         │  Allow Port 22   │         │  │  Subnet: default           │  │
│                 │         │  Deny all other  │         │  │  Range: 10.0.0.0/24        │  │
│                 │<────────│  inbound         │<────────│  │                            │  │
│                 │Outbound │                  │Outbound │  │  ┌──────────────────────┐  │  │
└─────────────────┘         └──────────────────┘         │  │  │  GCE Instance        │  │  │
                                                         │  │  │  dusty-warrior       │  │  │
                                                         │  │  │  Internal: 10.0.0.2  │  │  │
                                                         │  │  │  External: enabled   │  │  │
                                                         │  │  └──────────────────────┘  │  │
                                                         │  └────────────────────────────┘  │
                                                         └──────────────────────────────────┘
```

---

## What Each Component Does

### Internet
- The public internet where traffic originates
- Users access the VM homepage from here
- Outbound traffic from the VM also exits here

### Firewall
- Sits at the edge of the VPC between the internet and the internal network
- Controls what traffic is allowed in and out
- Default behavior is **deny all** — traffic must be explicitly allowed
- Firewalls are **policy**, not convenience

### VPC (Virtual Private Cloud)
- The private network boundary in GCP
- Contains all subnets and resources for the project
- Nothing inside is reachable from the internet unless the firewall explicitly allows it

### Subnet
- A subdivision of the VPC
- Defines the internal IP address range
- Resources inside the subnet get internal IPs from this range

### GCE Instance (VM)
- The actual virtual machine running in GCP
- Runs nginx serving the SEIR-1 ops panel
- Has an internal IP for communication inside the VPC
- Has an external IP so it can be reached from the internet on allowed ports

---

## Firewall Rules

| Rule | Direction | Port | Protocol | Action |
|---|---|---|---|---|
| Allow HTTP | Inbound | 80 | TCP | Allow |
| Allow SSH | Inbound | 22 | TCP | Allow |
| Default | Inbound | All others | All | Deny |
| Default | Outbound | All | All | Allow |

---

## Traffic Flow

**Inbound (user accessing the VM):**
```
User → Internet → Firewall (check port 80) → VPC → Subnet → GCE Instance
```

**Outbound (VM responding):**
```
GCE Instance → Subnet → VPC → Firewall → Internet → User
```

**SSH (engineer accessing the VM):**
```
Engineer → Internet → Firewall (check port 22) → VPC → Subnet → GCE Instance
```

---

## Why the VM Has an External IP

In a production environment VMs should **not** have external IPs by default.
Traffic should flow through a load balancer or bastion host instead.

In this lab the external IP is enabled because:
- The gate script needs to reach the VM directly via HTTP
- There is no load balancer configured yet
- This is a learning environment, not production

---

## Key Takeaways

> "Firewalls are policy, not convenience. Default is deny."

> "VMs should not be public by default."

> "Every open port is a decision that must be justified."

> "The subnet is the blast radius boundary for network-level mistakes."

---

*SEIR-1 Week 4 Artifact | Compute & Networking*
