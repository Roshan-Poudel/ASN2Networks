#!/bin/bash
# https://github.com/Roshan-Poudel
# asn-ip-lookup.sh - Lookup public IP ranges announced by an ASN

VERSION="0.1.0"

echo "ASN IP Lookup Script v$VERSION"
read -p "Enter ASN (e.g., 13335 or AS13335): " ASN

# Normalize ASN format
if [[ ! "$ASN" =~ ^AS[0-9]+$ ]]; then
  ASN="AS${ASN//[^0-9]/}"  # Strip non-numeric characters just in case
fi

# Get organization name
ORG=$(whois -h whois.radb.net "$ASN" 2>/dev/null | grep -iE 'org-name|descr' | head -n 1 | cut -d: -f2- | sed 's/^[ \t]*//')

if [ -z "$ORG" ]; then
  ORG="Unknown Organization"
fi

echo "------------------------------"
echo "[+] ASN:           $ASN"
echo "[+] Organization:  $ORG"
echo "[+] Fetching IP ranges..."

# Fetch IP ranges
CIDRS=$(whois -h whois.radb.net " -i origin $ASN" 2>/dev/null | grep -E '^route:' | awk '{print $2}' | sort -u)

if [ -z "$CIDRS" ]; then
  echo "[-] No IP ranges found for $ASN"
  exit 1
fi

echo "[+] Found IP ranges:"
echo "------------------------------"
echo "$CIDRS"
echo "------------------------------"
echo "[✔] Done."