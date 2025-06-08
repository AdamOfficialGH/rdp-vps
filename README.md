# Free RDP & VPS using GitHub Actions

Repositori ini menyediakan setup untuk mendapatkan akses RDP Windows dan VPS Linux gratis menggunakan GitHub Actions.

## ⚠️ Disclaimer
- Gunakan dengan bijak dan sesuai dengan Terms of Service GitHub
- Jangan gunakan untuk mining cryptocurrency atau aktivitas ilegal
- Session akan berakhir setelah 6 jam (batas GitHub Actions)
- Hanya untuk tujuan pembelajaran dan development

## ⚡ Quick Start (5 menit)

**🚀 [Ikuti panduan 5 menit di QUICK-START.md](QUICK-START.md)**

## 🚀 Detailed Setup

### Windows RDP
1. Fork repository ini
2. Buka tab **Actions** di repository Anda
3. Pilih workflow **"Windows RDP"**
4. Klik **"Run workflow"**
5. Tunggu hingga workflow selesai
6. Lihat logs untuk mendapatkan kredensial RDP

### Linux VPS
1. Fork repository ini
2. Buka tab **Actions** di repository Anda  
3. Pilih workflow **"Linux VPS"**
4. Klik **"Run workflow"**
5. Tunggu hingga workflow selesai
6. Lihat logs untuk mendapatkan kredensial SSH

## 📋 Spesifikasi

### Windows RDP
- **OS**: Windows Server 2022
- **CPU**: 2 cores
- **RAM**: 7GB
- **Storage**: 14GB SSD
- **Duration**: 6 jam maksimal

### Linux VPS
- **OS**: Ubuntu 22.04 LTS
- **CPU**: 2 cores  
- **RAM**: 7GB
- **Storage**: 14GB SSD
- **Duration**: 6 jam maksimal

## 🔧 Setup Requirements

### Untuk RDP Windows
1. **Ngrok Account** (gratis):
   - Daftar di [ngrok.com](https://ngrok.com)
   - Dapatkan auth token dari dashboard
   - Tambahkan sebagai secret `NGROK_AUTH_TOKEN` di repository

### Untuk VPS Linux
1. **Ngrok Account** (sama seperti di atas)
2. **SSH Key** (opsional):
   - Generate SSH key pair
   - Tambahkan public key sebagai secret `SSH_PUBLIC_KEY`

## ⚙️ Konfigurasi Secrets

Buka **Settings** → **Secrets and variables** → **Actions** di repository Anda, lalu tambahkan:

| Secret Name | Description | Required |
|-------------|-------------|----------|
| `NGROK_AUTH_TOKEN` | Token dari ngrok.com | ✅ Yes |
| `SSH_PUBLIC_KEY` | SSH public key untuk akses | ❌ Optional |
| `RDP_PASSWORD` | Custom password untuk RDP | ❌ Optional |

## 📖 Cara Penggunaan

### Menggunakan Windows RDP
1. Jalankan workflow "Windows RDP"
2. Tunggu hingga muncul log "RDP is ready!"
3. Salin informasi koneksi dari logs:
   ```
   RDP Address: tcp://0.tcp.ngrok.io:12345
   Username: runneradmin
   Password: YourPassword123
   ```
4. Buka Remote Desktop Connection
5. Masukkan address, username, dan password
6. Connect!

### Menggunakan Linux VPS
1. Jalankan workflow "Linux VPS"  
2. Tunggu hingga muncul log "SSH is ready!"
3. Salin informasi koneksi dari logs:
   ```
   SSH Command: ssh runner@0.tcp.ngrok.io -p 12345
   Password: YourPassword123
   ```
4. Buka terminal dan jalankan command SSH
5. Masukkan password jika diminta
6. Enjoy your VPS!

## 🛠️ Advanced Usage

### Custom Software Installation
Edit file workflow untuk menambahkan software yang dibutuhkan:

```yaml
- name: Install Custom Software
  run: |
    # Windows (PowerShell)
    choco install git nodejs python
    
    # Linux (Bash)
    sudo apt update
    sudo apt install -y git nodejs npm python3
```

### Persistent Storage
Gunakan GitHub repository atau external storage untuk menyimpan data:

```yaml
- name: Download Files
  run: |
    git clone https://github.com/yourusername/your-data-repo.git
    
- name: Upload Results
  run: |
    git add .
    git commit -m "Update from Actions"
    git push
```

## 🔒 Security Tips

1. **Jangan share kredensial** di public logs
2. **Gunakan SSH keys** untuk akses yang lebih aman
3. **Set custom password** melalui secrets
4. **Monitor usage** untuk menghindari abuse
5. **Hapus sensitive data** sebelum session berakhir

## 🐛 Troubleshooting

### RDP tidak bisa connect
- Pastikan ngrok auth token valid
- Check firewall settings
- Coba restart workflow

### SSH connection refused  
- Tunggu hingga setup selesai (lihat logs)
- Pastikan port ngrok benar
- Check SSH service status

### Workflow gagal
- Check secrets sudah diset dengan benar
- Lihat error logs di Actions tab
- Pastikan ngrok account tidak exceed limit

## 📚 Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Ngrok Documentation](https://ngrok.com/docs)
- [Windows Server Documentation](https://docs.microsoft.com/en-us/windows-server/)
- [Ubuntu Documentation](https://ubuntu.com/server/docs)

## 🤝 Contributing

Contributions welcome! Please read our contributing guidelines and submit pull requests.

## 📄 License

MIT License - see LICENSE file for details.

---

**⭐ Jika repository ini membantu, jangan lupa beri star!**
