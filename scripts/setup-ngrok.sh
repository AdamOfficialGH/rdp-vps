#!/bin/bash

# Setup script for ngrok
# This script helps users set up ngrok authentication token

echo "🔧 Ngrok Setup Helper"
echo "====================="
echo ""

# Check if ngrok auth token is provided
if [ -z "$1" ]; then
    echo "❌ Error: Ngrok auth token is required"
    echo ""
    echo "📋 Usage:"
    echo "  ./setup-ngrok.sh YOUR_NGROK_AUTH_TOKEN"
    echo ""
    echo "🔗 Get your token from: https://dashboard.ngrok.com/get-started/your-authtoken"
    echo ""
    exit 1
fi

NGROK_TOKEN="$1"

echo "✅ Ngrok auth token provided"
echo ""

# Instructions for adding to GitHub Secrets
echo "📝 Next Steps:"
echo "=============="
echo ""
echo "1. Go to your GitHub repository"
echo "2. Click on 'Settings' tab"
echo "3. Click on 'Secrets and variables' → 'Actions'"
echo "4. Click 'New repository secret'"
echo "5. Add the following secret:"
echo ""
echo "   Name: NGROK_AUTH_TOKEN"
echo "   Value: $NGROK_TOKEN"
echo ""
echo "6. Click 'Add secret'"
echo ""
echo "🎉 After adding the secret, you can run the workflows!"
echo ""

# Optional: Test ngrok token locally if ngrok is installed
if command -v ngrok &> /dev/null; then
    echo "🧪 Testing ngrok token locally..."
    ngrok config add-authtoken "$NGROK_TOKEN"
    
    if [ $? -eq 0 ]; then
        echo "✅ Ngrok token is valid!"
    else
        echo "❌ Ngrok token validation failed"
    fi
else
    echo "ℹ️  Ngrok not installed locally - skipping validation"
fi

echo ""
echo "🔒 Security Note:"
echo "=================="
echo "• Never share your ngrok auth token publicly"
echo "• Use GitHub Secrets to store sensitive information"
echo "• Regularly rotate your tokens for better security"
echo ""
