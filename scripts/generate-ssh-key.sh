#!/bin/bash

# SSH Key Generator for GitHub Actions VPS
# This script helps generate SSH key pairs for secure access

echo "🔐 SSH Key Generator"
echo "==================="
echo ""

# Get email for SSH key
read -p "Enter your email address: " email

if [ -z "$email" ]; then
    echo "❌ Email is required for SSH key generation"
    exit 1
fi

# Generate SSH key pair
echo "🔑 Generating SSH key pair..."
ssh-keygen -t rsa -b 4096 -C "$email" -f "./github-actions-key" -N ""

if [ $? -eq 0 ]; then
    echo "✅ SSH key pair generated successfully!"
    echo ""
    
    # Display public key
    echo "📋 Your PUBLIC key (add this to GitHub Secrets as SSH_PUBLIC_KEY):"
    echo "=================================================================="
    cat ./github-actions-key.pub
    echo ""
    echo "=================================================================="
    echo ""
    
    # Display private key
    echo "🔒 Your PRIVATE key (keep this secure on your local machine):"
    echo "=============================================================="
    echo "File: ./github-actions-key"
    echo ""
    
    # Instructions
    echo "📝 Setup Instructions:"
    echo "======================"
    echo ""
    echo "1. Copy the PUBLIC key above"
    echo "2. Go to your GitHub repository → Settings → Secrets and variables → Actions"
    echo "3. Add new secret:"
    echo "   Name: SSH_PUBLIC_KEY"
    echo "   Value: [paste the public key]"
    echo ""
    echo "4. Save the PRIVATE key file (github-actions-key) securely"
    echo "5. Use this command to connect to your VPS:"
    echo "   ssh -i ./github-actions-key runner@HOST -p PORT"
    echo ""
    
    # Set proper permissions
    chmod 600 ./github-actions-key
    chmod 644 ./github-actions-key.pub
    
    echo "🔒 File permissions set correctly"
    echo ""
    
    # Security notes
    echo "⚠️  Security Notes:"
    echo "==================="
    echo "• Keep your private key secure and never share it"
    echo "• The private key file has been set to read-only for owner"
    echo "• Consider using a passphrase for additional security"
    echo "• Regularly rotate your SSH keys"
    echo ""
    
else
    echo "❌ Failed to generate SSH key pair"
    exit 1
fi
