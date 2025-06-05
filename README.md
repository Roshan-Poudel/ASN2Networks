# ASN2Networks

🔍 A Bash script to extract all public IP ranges (IPv4) announced by a given ASN (Autonomous System Number).  
Ideal for network admins, security analysts, and osint investigators.

---

## ❓ What is an ASN?

An **ASN (Autonomous System Number)** is a unique identifier assigned to a network or group of IP prefixes under the control of a single organization that presents a common routing policy to the internet.

ASNs are used by ISPs, large companies, and cloud providers to announce IP ranges (also called "routes") using the BGP protocol.

### 🔎 Example:
- **Google ASN**: `AS15169`
- **Cloudflare ASN**: `AS13335`
 
Each ASN may be responsible for hundreds or thousands of IP ranges used in their infrastructure.

This script lets you input any ASN and get a full list of public IPs that ASN announces.

---

##  Features

- Accepts ASN with or without the `AS` prefix (e.g., `13335` or `AS13335`)
- Retrieves:
  - Organization name
  - All routed IP prefixes from whois.radb.net
- Optionally saves output to a file
- Lightweight — pure Bash with just `whois` as a dependency

---

## 📥 Installation

### 1 Clone the repository
```
git clone git@github.com:Roshan-Poudel/ASN2Networks.git
```
### 2 Change into the repository directory
```
cd ASN2Networks/
```

### 3 Make the script executable
```
chmod +x asn.sh
```
### 4 Run it and Provide ASN Number
```
./asn.sh 
ASN IP Lookup Script v0.1.0
Enter ASN (e.g., 13335 or AS13335): 
------------------------------
[+] ASN:           AS
[+] Organization:   
[+] Fetching IP ranges...
[+] Found IP ranges:
------------------------------
```
 

