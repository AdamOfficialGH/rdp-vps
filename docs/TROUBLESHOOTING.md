# 🔧 Troubleshooting Guide

Panduan ini membantu mengatasi masalah umum yang mungkin terjadi saat menggunakan GitHub Actions untuk RDP/VPS.

## 🚨 Masalah Umum

### 1. Workflow Gagal Start

#### Gejala:
- Workflow tidak berjalan atau langsung gagal
- Error "Invalid workflow file"

#### Solusi:
```bash
# Periksa syntax YAML
yamllint .github/workflows/windows-rdp.yml
yamllint .github/workflows/linux-vps.yml

# Pastikan indentasi benar (gunakan spaces, bukan tabs)
```

### 2. Ngrok Authentication Failed

#### Gejala:
- Error "authentication failed" di logs
- Tunnel tidak terbuat

#### Solusi:
1. Pastikan `NGROK_AUTH_TOKEN` sudah diset di GitHub Secrets
2. Verifikasi token di [ngrok dashboard](https://dashboard.ngrok.com/get-started/your-authtoken)
3. Token harus valid dan tidak expired

```bash
# Test token locally
ngrok config add-authtoken YOUR_TOKEN
ngrok tcp 22  # Test tunnel
```

### 3. RDP Connection Refused

#### Gejala:
- "Connection could not be established" di RDP client
- Timeout saat connecting

#### Solusi:
1. **Tunggu setup selesai** - Lihat logs sampai muncul "RDP IS READY!"
2. **Periksa address** - Pastikan menggunakan address dari logs, bukan localhost
3. **Firewall** - Beberapa network memblok RDP, coba network lain
4. **RDP Client** - Coba client berbeda (Windows RDP, FreeRDP, dll)

```powershell
# Test RDP port locally
Test-NetConnection -ComputerName "0.tcp.ngrok.io" -Port 12345
```

### 4. SSH Connection Refused

#### Gejala:
- "Connection refused" saat SSH
- "No route to host"

#### Solusi:
1. **Tunggu setup selesai** - Lihat logs sampai muncul "SSH VPS IS READY!"
2. **Periksa port** - Gunakan port dari logs, bukan 22
3. **SSH client** - Pastikan SSH client terinstall

```bash
# Test SSH connection
ssh -v runner@0.tcp.ngrok.io -p 12345

# Test port connectivity
nc -zv 0.tcp.ngrok.io 12345
```

### 5. Workflow Timeout

#### Gejala:
- Workflow berhenti setelah 6 jam
- "Job was cancelled because it exceeded the maximum execution time"

#### Solusi:
- Ini adalah batasan GitHub Actions (6 jam maksimal)
- Restart workflow jika masih butuh akses
- Simpan data penting sebelum timeout

### 6. Ngrok Tunnel Limit Exceeded

#### Gejala:
- Error "tunnel limit exceeded"
- Tunnel tidak bisa dibuat

#### Solusi:
1. **Free account** - Hanya 1 tunnel aktif
2. **Tunggu tunnel lama expire** - Atau upgrade ke paid plan
3. **Kill tunnel lama** - Di ngrok dashboard

## 🔍 Debugging Steps

### 1. Check Workflow Logs
```
1. Buka repository GitHub
2. Klik tab "Actions"
3. Pilih workflow run yang bermasalah
4. Klik pada job untuk melihat detailed logs
5. Expand setiap step untuk melihat output
```

### 2. Check Secrets Configuration
```
1. Repository → Settings → Secrets and variables → Actions
2. Pastikan secrets berikut ada:
   - NGROK_AUTH_TOKEN (required)
   - RDP_PASSWORD (optional)
   - SSH_PASSWORD (optional)
   - SSH_PUBLIC_KEY (optional)
```

### 3. Test Ngrok Locally
```bash
# Install ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar xvzf ngrok-v3-stable-linux-amd64.tgz

# Configure
./ngrok config add-authtoken YOUR_TOKEN

# Test tunnel
./ngrok tcp 22
```

### 4. Validate YAML Syntax
```bash
# Online validator
# https://www.yamllint.com/

# Local validation
python -c "import yaml; yaml.safe_load(open('.github/workflows/windows-rdp.yml'))"
```

## 🛠️ Advanced Troubleshooting

### Custom Debugging Steps

#### Add Debug Output to Workflow:
```yaml
- name: Debug Info
  run: |
    echo "Current user: $(whoami)"
    echo "Current directory: $(pwd)"
    echo "Environment variables:"
    env | grep -E "(NGROK|GITHUB)" | sort
    echo "Network interfaces:"
    ip addr show || ifconfig
    echo "Listening ports:"
    netstat -tlnp || ss -tlnp
```

#### Check Service Status (Linux):
```yaml
- name: Check Services
  run: |
    systemctl status ssh
    systemctl status ngrok || echo "Ngrok not a service"
    ps aux | grep -E "(ssh|ngrok)"
```

#### Check RDP Status (Windows):
```powershell
- name: Check RDP Status
  run: |
    Get-Service -Name "TermService"
    Get-NetFirewallRule -DisplayGroup "Remote Desktop"
    Get-Process -Name "ngrok" -ErrorAction SilentlyContinue
```

## 📞 Getting Help

### 1. GitHub Issues
Jika masalah masih berlanjut, buat issue di repository dengan informasi:
- OS yang digunakan (Windows/Linux)
- Error message lengkap
- Screenshot logs
- Steps yang sudah dicoba

### 2. Community Resources
- [GitHub Actions Community](https://github.community/c/github-actions)
- [Ngrok Community](https://ngrok.com/docs)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/github-actions)

### 3. Alternative Solutions
Jika GitHub Actions tidak bekerja:
- [Gitpod](https://gitpod.io/) - Cloud development environment
- [Codespaces](https://github.com/features/codespaces) - GitHub's cloud IDE
- [Replit](https://replit.com/) - Online coding platform

## 🔒 Security Considerations

### Best Practices:
1. **Jangan share credentials** di public logs
2. **Gunakan strong passwords** untuk RDP/SSH
3. **Rotate secrets regularly** 
4. **Monitor usage** untuk detect abuse
5. **Clean up data** sebelum session berakhir

### Red Flags:
- Credentials muncul di logs
- Unusual network activity
- Unexpected software installations
- High resource usage

---

**💡 Tip: Selalu backup data penting dan jangan gunakan untuk production workloads!**
