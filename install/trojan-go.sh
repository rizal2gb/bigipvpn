#!/bin/bash
# Install Trojan-Go
touch /var/log/trojan-go.log
domain=$(cat /etc/v2ray/domain)
uuid=$(cat /proc/sys/kernel/random/uuid)
wget -P /usr/lib/ https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.4/trojan-go-linux-amd64.zip
unzip /usr/lib/trojan-go-linux-amd64.zip -d /usr/lib/trojan-go
mv /usr/lib/trojan-go/trojan-go /usr/bin/
chmod +x /usr/bin/trojan-go
mkdir -p /usr/share/trojan-go
mv /usr/lib/trojan-go/geoip.dat /usr/share/trojan-go/
mv /usr/lib/trojan-go/geosite.dat /usr/share/trojan-go/
mkdir -p /etc/trojan-go
touch /etc/trojan-go/akun.conf
cat <<EOF > /etc/trojan-go/config.json
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": 2096,
    "remote_addr": "127.0.0.1",
    "remote_port": 81,
    "password": [
        "$uuid"
    ],
    "log_level": 1,
    "ssl": {
        "cert": "/etc/v2ray/v2ray.crt",
        "key": "/etc/v2ray/v2ray.key",
        "fallback_port": 81,
        "sni": "$domain"
    },
    "mux": {
        "enabled": false,
        "concurrency": 8,
        "idle_timeout": 60
    },
    "websocket": {
        "enabled": true,
        "path": "/trojan-go",
        "host": "$domain"
    },
    "router": {
        "enabled": true,
        "block": [
            "geoip:private"
        ],
        "geoip": "/usr/share/trojan-go/geoip.dat",
        "geosite": "/usr/share/trojan-go/geosite.dat"
    }
}

EOF
cat <<EOF > /etc/systemd/system/trojan-go.service
[Unit]
Description=Trojan-Go - by jagoanneon
Documentation=https://p4gefau1t.github.io/trojan-go/
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/trojan-go -config /etc/trojan-go/config.json
Restart=on-failure
RestartSec=10s
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target

EOF

cat <<EOF > /etc/trojan-go/uuid.txt
$uuid
EOF

iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2096 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 81 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2096 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 81 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
systemctl daemon-reload
systemctl restart trojan-go
systemctl enable trojan-go
cd /usr/bin
wget -O add-trgo "https://raw.githubusercontent.com/rizal2gb/bigipvpn/main/tambah/add-trgo.sh"
wget -O del-trgo "https://raw.githubusercontent.com/rizal2gb/bigipvpn/main/hapus/del-trgo.sh"
wget -O cek-trgo "https://raw.githubusercontent.com/rizal2gb/bigipvpn/main/cek/cek-trgo.sh"
wget -O renew-trgo "https://raw.githubusercontent.com/rizal2gb/bigipvpn/main/renew-trgo.sh"
chmod +x add-trgo
chmod +x del-trgo
chmod +x cek-trgo
chmod +x renew-trgo
cd
rm -f /usr/lib/trojan-go-linux-amd64.zip
echo "0 0 * * * root xp-trgo" >> /etc/crontab
