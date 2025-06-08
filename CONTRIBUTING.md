# 🤝 Contributing Guidelines

Terima kasih atas minat Anda untuk berkontribusi! Panduan ini akan membantu Anda memahami cara berkontribusi dengan efektif.

## 🎯 Cara Berkontribusi

### 1. Reporting Issues
- Gunakan template issue yang tersedia
- Berikan informasi detail tentang masalah
- Include logs dan screenshots jika memungkinkan
- Test di environment yang bersih sebelum report

### 2. Suggesting Features
- Buka issue dengan label "enhancement"
- Jelaskan use case dan benefit
- Diskusikan implementasi yang mungkin
- Consider security implications

### 3. Code Contributions
- Fork repository
- Create feature branch
- Make changes dengan best practices
- Test thoroughly
- Submit pull request

## 📋 Development Setup

### Prerequisites
```bash
# Required tools
git
bash/powershell
text editor (VS Code recommended)

# For testing
docker (optional)
ngrok account
GitHub account
```

### Local Development
```bash
# Clone repository
git clone https://github.com/your-username/rdp-vps-github-actions.git
cd rdp-vps-github-actions

# Create feature branch
git checkout -b feature/your-feature-name

# Make changes
# Test changes
# Commit changes
git add .
git commit -m "feat: add your feature description"

# Push and create PR
git push origin feature/your-feature-name
```

## 🧪 Testing Guidelines

### Workflow Testing
```yaml
# Test workflows in your fork before submitting PR
1. Fork repository
2. Add your ngrok token to secrets
3. Run workflows to test changes
4. Verify all functionality works
5. Check logs for errors
```

### Security Testing
```bash
# Check for security issues
1. No hardcoded secrets
2. No sensitive data in logs
3. Proper input validation
4. Safe default configurations
```

### Documentation Testing
```bash
# Verify documentation
1. Follow setup guide step-by-step
2. Test all commands and examples
3. Check for broken links
4. Verify screenshots are current
```

## 📝 Code Standards

### YAML Workflows
```yaml
# Use consistent indentation (2 spaces)
# Add comments for complex sections
# Use descriptive step names
# Handle errors gracefully
# Include timeout settings

- name: Descriptive Step Name
  run: |
    # Comment explaining what this does
    command_here
  timeout-minutes: 10
```

### Shell Scripts
```bash
#!/bin/bash
# Use strict mode
set -euo pipefail

# Add comments
# Use meaningful variable names
# Handle errors
# Quote variables properly

echo "Starting process..."
if [ -z "${VARIABLE:-}" ]; then
    echo "Error: VARIABLE is required"
    exit 1
fi
```

### Documentation
```markdown
# Use clear headings
# Include code examples
# Add screenshots where helpful
# Keep language simple and clear
# Update table of contents
```

## 🔒 Security Guidelines

### Secrets Management
- Never commit secrets to repository
- Use GitHub Secrets for sensitive data
- Document required secrets clearly
- Provide secure default values

### Code Security
- Validate all inputs
- Avoid command injection
- Use secure defaults
- Follow principle of least privilege

### Documentation Security
- Don't include real tokens/passwords
- Use placeholder values
- Warn about security implications
- Provide security best practices

## 📋 Pull Request Process

### Before Submitting
- [ ] Test changes thoroughly
- [ ] Update documentation
- [ ] Add/update tests if applicable
- [ ] Follow code standards
- [ ] Check for security issues

### PR Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Security improvement

## Testing
- [ ] Tested on Windows RDP
- [ ] Tested on Linux VPS
- [ ] Tested on Ubuntu Desktop
- [ ] Documentation updated

## Security Checklist
- [ ] No hardcoded secrets
- [ ] Input validation added
- [ ] Secure defaults used
- [ ] Security docs updated
```

### Review Process
1. Automated checks must pass
2. Manual review by maintainers
3. Security review if applicable
4. Testing in clean environment
5. Approval and merge

## 🏷️ Issue Labels

### Type Labels
- `bug` - Something isn't working
- `enhancement` - New feature request
- `documentation` - Documentation improvements
- `security` - Security-related issues

### Priority Labels
- `critical` - Urgent security/functionality issues
- `high` - Important improvements
- `medium` - Nice to have features
- `low` - Minor improvements

### Status Labels
- `needs-info` - More information required
- `in-progress` - Being worked on
- `ready-for-review` - Ready for maintainer review
- `blocked` - Waiting for external dependency

## 🎨 Style Guide

### Commit Messages
```bash
# Format: type(scope): description
feat(rdp): add custom password support
fix(ssh): resolve connection timeout issue
docs(setup): update ngrok configuration steps
security(auth): improve password validation
```

### Branch Naming
```bash
# Format: type/short-description
feature/custom-passwords
bugfix/ssh-timeout
docs/setup-guide-update
security/input-validation
```

### File Naming
```bash
# Use kebab-case for files
setup-guide.md
troubleshooting.md
windows-rdp.yml

# Use UPPERCASE for important files
README.md
LICENSE
CONTRIBUTING.md
```

## 🌟 Recognition

### Contributors
All contributors will be recognized in:
- README.md contributors section
- Release notes
- GitHub contributors page

### Types of Contributions
- Code contributions
- Documentation improvements
- Bug reports and testing
- Security reviews
- Community support

## 📞 Getting Help

### Development Questions
- Open discussion in GitHub Discussions
- Ask in pull request comments
- Contact maintainers directly

### Security Issues
- Email security@github.com for GitHub issues
- Create private security advisory for this repo
- Follow responsible disclosure practices

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**🙏 Thank you for contributing to make this project better for everyone!**
