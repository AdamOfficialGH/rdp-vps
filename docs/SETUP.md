# 🚀 Setup Guide

Panduan lengkap untuk setup GitHub Actions RDP/VPS dari awal hingga siap digunakan.

## 📋 Prerequisites

### 1. GitHub Account
- Account GitHub (gratis atau berbayar)
- Repository (bisa private atau public)

### 2. Ngrok Account
- Daftar gratis di [ngrok.com](https://ngrok.com)
- Dapatkan auth token dari dashboard

### 3. Basic Knowledge
- Familiar dengan GitHub
- Basic command line knowledge
- Understanding of RDP/SSH/VNC

## 🔧 Step-by-Step Setup

### Step 1: Fork/Clone Repository

#### Option A: Fork Repository (Recommended)
```bash
1. Buka repository ini di GitHub
2. Klik tombol "Fork" di kanan atas
3. Pilih account/organization tujuan
4. Repository akan di-copy ke account Anda
```

#### Option B: Clone dan Push ke Repository Baru
```bash
# Clone repository
git clone https://github.com/your-username/rdp-vps-github-actions.git
cd rdp-vps-github-actions

# Buat repository baru di GitHub
# Lalu push ke repository baru
git remote set-url origin https://github.com/your-username/your-new-repo.git
git push -u origin main
```

### Step 2: Setup Ngrok

#### 2.1 Daftar Ngrok Account
```
1. Buka https://ngrok.com
2. Klik "Sign up" untuk daftar gratis
3. Verifikasi email
4. Login ke dashboard
```

#### 2.2 Dapatkan Auth Token
```
1. Login ke ngrok dashboard
2. Buka https://dashboard.ngrok.com/get-started/your-authtoken
3. Copy auth token (format: 2abc...)
4. Simpan token ini untuk step selanjutnya
```

#### 2.3 Test Ngrok (Optional)
```bash
# Download ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar xvzf ngrok-v3-stable-linux-amd64.tgz

# Configure
./ngrok config add-authtoken YOUR_TOKEN_HERE

# Test tunnel
./ngrok tcp 22
```

### Step 3: Configure GitHub Secrets

#### 3.1 Buka Repository Settings
```
1. Buka repository Anda di GitHub
2. Klik tab "Settings"
3. Di sidebar kiri, klik "Secrets and variables"
4. Klik "Actions"
```

#### 3.2 Tambahkan Required Secrets
```
Klik "New repository secret" dan tambahkan:

Name: NGROK_AUTH_TOKEN
Value: [paste ngrok auth token Anda]
```

#### 3.3 Tambahkan Optional Secrets
```
# Custom RDP password
Name: RDP_PASSWORD
Value: YourStrongPassword123!

# Custom SSH password  
Name: SSH_PASSWORD
Value: AnotherStrongPassword456!

# Custom VNC password
Name: VNC_PASSWORD
Value: VncPassword789!

# SSH public key (untuk key-based auth)
Name: SSH_PUBLIC_KEY
Value: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQ...
```

### Step 4: Generate SSH Keys (Optional)

#### 4.1 Generate Key Pair
```bash
# Jalankan script helper
chmod +x scripts/generate-ssh-key.sh
./scripts/generate-ssh-key.sh

# Atau manual
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f ./github-actions-key
```

#### 4.2 Add Public Key to Secrets
```
1. Copy isi file github-actions-key.pub
2. Tambahkan sebagai secret SSH_PUBLIC_KEY di GitHub
3. Simpan file github-actions-key (private key) dengan aman
```

### Step 5: Test Workflows

#### 5.1 Test Windows RDP
```
1. Buka repository di GitHub
2. Klik tab "Actions"
3. Pilih workflow "Windows RDP"
4. Klik "Run workflow"
5. Tunggu hingga selesai
6. Check logs untuk connection info
```

#### 5.2 Test Linux VPS
```
1. Pilih workflow "Linux VPS"
2. Klik "Run workflow"
3. Tunggu hingga selesai
4. Check logs untuk SSH command
```

#### 5.3 Test Ubuntu Desktop
```
1. Pilih workflow "Ubuntu Desktop (VNC)"
2. Klik "Run workflow"
3. Tunggu hingga selesai
4. Check logs untuk VNC connection info
```

## 🔍 Verification

### Check Workflow Status
```
✅ Workflow completed successfully
✅ No error messages in logs
✅ Connection info displayed in logs
✅ Ngrok tunnel established
```

### Test Connections

#### RDP Connection
```
1. Open Remote Desktop Connection
2. Enter address from logs
3. Use username: runneradmin
4. Use password from logs
5. Should connect successfully
```

#### SSH Connection
```bash
# From logs, copy SSH command like:
ssh runner@0.tcp.ngrok.io -p 12345

# Or with SSH key:
ssh -i github-actions-key runner@0.tcp.ngrok.io -p 12345
```

#### VNC Connection
```
1. Open VNC client (TightVNC, RealVNC, etc.)
2. Enter host:port from logs
3. Enter VNC password
4. Should see Ubuntu desktop
```

## 🛠️ Customization

### Modify Software Installation

#### Windows RDP
```yaml
# Edit .github/workflows/windows-rdp.yml
- name: Install Custom Software
  run: |
    choco install -y your-software-here
    choco install -y another-software
```

#### Linux VPS
```yaml
# Edit .github/workflows/linux-vps.yml
- name: Install Custom Software
  run: |
    sudo apt-get install -y your-package-here
    sudo apt-get install -y another-package
```

### Change Default Settings

#### Session Duration
```yaml
# Default duration in workflow files
default: '4'  # Change from 6 to 4 hours
```

#### Default Passwords
```yaml
# In workflow files, change default passwords
if [ -z "$password" ]; then
  password="YourCustomDefaultPassword123!"
fi
```

### Add Custom Scripts

#### Startup Scripts
```yaml
- name: Run Custom Setup
  run: |
    # Download and run your custom script
    wget https://your-domain.com/setup.sh
    chmod +x setup.sh
    ./setup.sh
```

## 🔒 Security Hardening

### 1. Use Private Repository
```
Repository Settings → General → Repository visibility → Private
```

### 2. Enable Branch Protection
```
Settings → Branches → Add rule
- Require pull request reviews
- Require status checks to pass
- Restrict pushes to matching branches
```

### 3. Use Strong Passwords
```bash
# Generate strong passwords
openssl rand -base64 32
```

### 4. Regular Secret Rotation
```
1. Generate new ngrok token monthly
2. Change passwords regularly
3. Rotate SSH keys periodically
```

### 5. Monitor Usage
```
1. Check Actions usage in Settings → Billing
2. Monitor for unusual activity
3. Set up notifications for workflow runs
```

## 📞 Getting Help

### Common Issues
- Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
- Review workflow logs for errors
- Verify secrets are set correctly

### Community Support
- GitHub Discussions
- Stack Overflow
- Reddit r/github

### Professional Support
- GitHub Support (for paid accounts)
- Ngrok Support
- Community forums

---

**🎉 Selamat! Setup Anda sudah selesai. Sekarang Anda bisa menggunakan RDP/VPS gratis dengan GitHub Actions!**
