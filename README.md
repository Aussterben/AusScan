AusScan.sh — Network Scanner
A lightweight Bash tool for quick network reconnaissance directly from the terminal. No external tools required beyond a standard Unix environment.
Features

-ap — Scan all 65535 ports on a given IP
-p — Check if a single specific port is open
-ips — Discover all active hosts on the local network (192.168.0.0/24)
-ip — Check if a specific IP is reachable
--aips — Discover all active hosts across the full 192.168.0.0/16 range

Usage
chmod +x AusScan.sh
./AusScan.sh -ap      # Scan all ports
./AusScan.sh -p       # Scan a single port
./AusScan.sh -ips     # Discover active hosts (192.168.0.x)
./AusScan.sh -ip      # Check a single IP
./AusScan.sh --aips   # Discover active hosts (192.168.x.x)

⚠️ For educational and authorized use only. Do not run against networks or systems you don't own or have explicit permission to test.
