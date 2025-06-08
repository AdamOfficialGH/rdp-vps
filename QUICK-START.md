# ⚡ Quick Start Guide

Panduan cepat untuk langsung menggunakan RDP/VPS gratis dalam 5 menit!

## 🚀 5-Minute Setup

### Step 1: Fork Repository (30 detik)
```
1. Klik tombol "Fork" di atas
2. Pilih account GitHub Anda
3. Repository akan di-copy ke account Anda
```

### Step 2: Daftar Ngrok (2 menit)
```
1. Buka https://ngrok.com
2. Klik "Sign up" → daftar dengan email
3. Verifikasi email
4. Login → buka https://dashboard.ngrok.com/get-started/your-authtoken
5. Copy auth token (contoh: 2abc123def456...)
```

### Step 3: Setup GitHub Secret (1 menit)
```
1. Di repository fork Anda, klik "Settings"
2. Klik "Secrets and variables" → "Actions"
3. Klik "New repository secret"
4. Name: NGROK_AUTH_TOKEN
5. Value: [paste token dari step 2]
6. Klik "Add secret"
```

### Step 4: Run Workflow (1 menit)
```
1. Klik tab "Actions"
2. Pilih "Windows RDP" atau "Linux VPS"
3. Klik "Run workflow" → "Run workflow"
4. Tunggu 2-3 menit
```

### Step 5: Connect! (30 detik)
```
1. Lihat logs workflow
2. Copy connection info
3. Connect dengan RDP/SSH client
4. Enjoy your free VPS! 🎉
```

## 🖥️ Connection Examples

### Windows RDP
```
Dari logs workflow:
RDP Address: tcp://0.tcp.ngrok.io:12345
Username: runneradmin
Password: P@ssw0rd123!

1. Buka "Remote Desktop Connection"
2. Computer: 0.tcp.ngrok.io:12345
3. Username: runneradmin
4. Password: P@ssw0rd123!
5. Connect!
```

### Linux SSH
```
Dari logs workflow:
SSH Command: ssh runner@0.tcp.ngrok.io -p 12345
Password: P@ssw0rd123!

1. Buka terminal
2. Jalankan: ssh runner@0.tcp.ngrok.io -p 12345
3. Enter password: P@ssw0rd123!
4. You're in! 🐧
```

### Ubuntu Desktop (VNC)
```
Dari logs workflow:
VNC Host: 0.tcp.ngrok.io:12345
VNC Password: vnc123456

1. Buka VNC client (TightVNC, RealVNC, dll)
2. Host: 0.tcp.ngrok.io:12345
3. Password: vnc123456
4. See the desktop! 🖥️
```

## 🛠️ What You Get

### Windows RDP
- **OS**: Windows Server 2022
- **Software**: Chrome, Firefox, VS Code, Git, Node.js, Python
- **Access**: Full GUI desktop
- **Duration**: 6 hours max

### Linux VPS
- **OS**: Ubuntu 22.04 LTS
- **Software**: Docker, Node.js, Python, Git, development tools
- **Access**: SSH command line
- **Duration**: 6 hours max

### Ubuntu Desktop
- **OS**: Ubuntu 22.04 with XFCE desktop
- **Software**: Firefox, LibreOffice, VS Code, development tools
- **Access**: VNC graphical desktop
- **Duration**: 6 hours max

## 🔧 Customization

### Custom Password
```
1. Repository → Settings → Secrets → New secret
2. Name: RDP_PASSWORD (atau SSH_PASSWORD, VNC_PASSWORD)
3. Value: YourStrongPassword123!
```

### Custom Duration
```
Saat run workflow:
1. Klik "Run workflow"
2. Duration: masukkan jam (max 6)
3. Run workflow
```

### Install Software
Edit file workflow di `.github/workflows/`:

**Windows:**
```yaml
- name: Install Software
  run: choco install -y your-software
```

**Linux:**
```yaml
- name: Install Software
  run: sudo apt-get install -y your-package
```

## ⚠️ Important Notes

### Limitations
- **6 jam maksimal** per session
- **Tidak persistent** - data hilang setelah session
- **Public IP** - jangan untuk production
- **Resource terbatas** - 2 CPU, 7GB RAM

### Security
- **Jangan share credentials** di public
- **Gunakan untuk development** saja
- **Backup data penting** sebelum session berakhir
- **Follow GitHub ToS** - no mining, no illegal activities

### Troubleshooting
- **Workflow gagal**: Check ngrok token di secrets
- **Connection refused**: Tunggu sampai setup selesai
- **Timeout**: Restart workflow jika perlu

## 📚 Need More Help?

### Documentation
- [📖 Full Setup Guide](docs/SETUP.md)
- [🔧 Troubleshooting](docs/TROUBLESHOOTING.md)
- [🔒 Security Guide](docs/SECURITY.md)

### Support
- [GitHub Issues](../../issues) - Report bugs
- [GitHub Discussions](../../discussions) - Ask questions
- [Stack Overflow](https://stackoverflow.com/questions/tagged/github-actions) - Community help

## 🎯 Use Cases

### Development
- Test applications on different OS
- CI/CD pipeline testing
- Cross-platform development
- Learning new technologies

### Education
- Programming tutorials
- System administration practice
- Software testing
- Demonstration purposes

### Temporary Tasks
- File conversion
- Data processing
- Quick computations
- Emergency access

---

**🚀 Ready to start? Fork this repo and follow the 5-minute setup above!**

**⭐ Don't forget to star this repository if it helps you!**
