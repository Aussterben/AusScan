AusScan.sh — Network Scanner
A lightweight Bash tool for quick network reconnaissance directly from the terminal. It allows you to scan all 65535 ports on a target IP, check whether a specific port is open or closed, discover all active hosts on a 192.168.0.x subnet, or probe a single IP to verify it's reachable.
Features

-ap — Scan all ports on a given IP
-p — Check a single specific port
-ips — Discover all active IPs on the local network (192.168.0.0/24)
-ip — Check if a specific IP is reachable

Uses native Bash /dev/tcp for port scanning — no external tools required beyond a standard Unix environment. Includes colored output, cursor management, and a Ctrl+C interrupt handler.
Usage
chmod +x AusScan.sh
./AusScan.sh -ap    # Scan all ports
./AusScan.sh -p     # Scan a single port
./AusScan.sh -ips   # Discover active hosts
./AusScan.sh -ip    # Check a single IP

⚠️ For educational and authorized use only. Do not run against networks or systems you don't own or have explicit permission to test.
