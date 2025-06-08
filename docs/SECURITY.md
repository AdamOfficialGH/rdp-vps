# 🔒 Security Guidelines

Panduan keamanan untuk menggunakan GitHub Actions RDP/VPS dengan aman dan bertanggung jawab.

## ⚠️ Disclaimer Keamanan

**PENTING**: Penggunaan GitHub Actions untuk RDP/VPS memiliki risiko keamanan. Gunakan dengan bijak dan pahami konsekuensinya.

## 🚨 Risiko Keamanan

### 1. Data Exposure
- **Logs publik**: Workflow logs bisa dilihat publik jika repository public
- **Credentials leak**: Password/token bisa terexpose di logs
- **Session recording**: Aktivitas bisa dimonitor oleh GitHub

### 2. Resource Abuse
- **Mining cryptocurrency**: Melanggar ToS GitHub
- **DDoS attacks**: Menggunakan untuk serangan
- **Spam/phishing**: Aktivitas ilegal lainnya

### 3. Account Suspension
- **GitHub account ban**: Jika melanggar Terms of Service
- **Ngrok account suspension**: Jika abuse detected
- **Legal consequences**: Untuk aktivitas ilegal

## 🛡️ Best Practices

### 1. Repository Security

#### Private Repository
```yaml
# Gunakan private repository untuk sensitive workflows
# Settings → General → Repository visibility → Private
```

#### Branch Protection
```yaml
# Settings → Branches → Add rule
# Require pull request reviews
# Require status checks
# Restrict pushes
```

### 2. Secrets Management

#### Required Secrets
```bash
# Minimal secrets yang dibutuhkan
NGROK_AUTH_TOKEN=your_ngrok_token

# Optional tapi recommended
RDP_PASSWORD=strong_password_123!
SSH_PASSWORD=another_strong_password!
SSH_PUBLIC_KEY=ssh-rsa AAAAB3NzaC1yc2E...
```

#### Strong Passwords
```bash
# Generate strong password
openssl rand -base64 32

# Password requirements:
# - Minimal 12 karakter
# - Kombinasi huruf besar, kecil, angka, simbol
# - Tidak menggunakan kata dictionary
# - Unique untuk setiap service
```

### 3. Access Control

#### SSH Key Authentication
```bash
# Generate SSH key pair
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# Add public key to GitHub Secrets
# Use private key untuk connect
ssh -i private_key runner@host -p port
```

#### IP Whitelisting (Advanced)
```yaml
# Tambahkan IP filtering di workflow
- name: Check IP Whitelist
  run: |
    ALLOWED_IPS="1.2.3.4,5.6.7.8"
    CURRENT_IP=$(curl -s https://ipinfo.io/ip)
    if [[ "$ALLOWED_IPS" != *"$CURRENT_IP"* ]]; then
      echo "Access denied from IP: $CURRENT_IP"
      exit 1
    fi
```

### 4. Session Security

#### Time Limits
```yaml
# Set maksimal session time
inputs:
  duration:
    description: 'Duration in hours (max 6)'
    default: '2'  # Default 2 jam, bukan 6
```

#### Auto-cleanup
```yaml
# Cleanup sensitive data
- name: Cleanup
  if: always()
  run: |
    # Clear bash history
    history -c
    rm -f ~/.bash_history
    
    # Clear temporary files
    rm -rf /tmp/*
    
    # Clear logs
    sudo journalctl --vacuum-time=1s
```

### 5. Monitoring & Logging

#### Custom Logging
```yaml
- name: Security Audit
  run: |
    echo "Session started at: $(date)"
    echo "User: $(whoami)"
    echo "IP: $(curl -s https://ipinfo.io/ip)"
    echo "Location: $(curl -s https://ipinfo.io/city)"
    
    # Log to external service (optional)
    curl -X POST https://your-logging-service.com/log \
      -d "session_start=$(date)&user=$(whoami)"
```

#### Failed Login Detection
```yaml
- name: Monitor Failed Logins
  run: |
    # Linux
    sudo grep "Failed password" /var/log/auth.log | tail -10
    
    # Windows
    Get-EventLog -LogName Security -InstanceId 4625 -Newest 10
```

## 🚫 Prohibited Activities

### Absolutely Forbidden:
1. **Cryptocurrency mining** - Akan menyebabkan account ban
2. **Illegal content** - Pornografi, piracy, malware
3. **Network attacks** - DDoS, port scanning, hacking
4. **Spam/phishing** - Email spam, fake websites
5. **Commercial use** - Hosting production services
6. **Resource hogging** - Excessive CPU/bandwidth usage

### Suspicious Activities:
1. **Tor/VPN usage** - Bisa trigger security alerts
2. **Large downloads** - Bandwidth abuse
3. **Multiple concurrent sessions** - Account sharing
4. **Automated scripts** - Bot-like behavior

## 🔍 Detection & Prevention

### GitHub's Monitoring
GitHub memiliki sistem monitoring yang detect:
- Unusual resource usage
- Suspicious network activity  
- Terms of Service violations
- Abuse patterns

### Ngrok's Monitoring
Ngrok juga monitor untuk:
- Malicious traffic
- High bandwidth usage
- Suspicious domains
- Abuse reports

### Self-Monitoring
```yaml
# Add monitoring to your workflow
- name: Resource Monitor
  run: |
    # CPU usage
    top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1
    
    # Memory usage
    free -m | awk 'NR==2{printf "%.2f%%\n", $3*100/$2}'
    
    # Disk usage
    df -h | awk '$NF=="/"{printf "%s\n", $5}'
    
    # Network usage
    cat /proc/net/dev | grep eth0
```

## 📋 Security Checklist

### Before Starting:
- [ ] Repository is private
- [ ] Strong passwords set in secrets
- [ ] SSH keys generated and configured
- [ ] Understand GitHub ToS
- [ ] Understand ngrok ToS
- [ ] Have legitimate use case

### During Session:
- [ ] Monitor resource usage
- [ ] Don't install suspicious software
- [ ] Don't access illegal content
- [ ] Don't share credentials
- [ ] Log activities if needed

### After Session:
- [ ] Clear sensitive data
- [ ] Review logs for anomalies
- [ ] Rotate passwords if compromised
- [ ] Document any issues

## 🆘 Incident Response

### If Compromised:
1. **Immediately stop workflow**
2. **Change all passwords**
3. **Rotate ngrok token**
4. **Review GitHub audit logs**
5. **Check for unauthorized changes**
6. **Report to GitHub if needed**

### If Banned:
1. **Don't create new accounts** (ban evasion)
2. **Contact GitHub support** with explanation
3. **Wait for appeal process**
4. **Learn from mistakes**

## 📞 Reporting Security Issues

### GitHub Security:
- Email: security@github.com
- Bug bounty: https://bounty.github.com/

### Ngrok Security:
- Email: security@ngrok.com
- Support: https://ngrok.com/contact

---

**🔐 Remember: Security is everyone's responsibility. Use these tools ethically and responsibly!**
