#!/bin/bash

# Trello Bridge Privacy Policy Deployment Script
# Run this script after creating your GitHub repository

echo "🚀 Trello Bridge Privacy Policy Deployment"
echo "=========================================="
echo ""

# Check if remote origin is already set
if git remote get-url origin >/dev/null 2>&1; then
    echo "✅ Git repository already has remote origin configured"
else
    echo "❌ No remote origin found. Please create a GitHub repository first."
    echo ""
    echo "Steps to create repository:"
    echo "1. Go to https://github.com/new"
    echo "2. Repository name: trello-bridge-privacy"
    echo "3. Make it public"
    echo "4. Do NOT initialize with README, .gitignore, or license"
    echo "5. Click 'Create repository'"
    echo ""
    echo "Then run this command (replace YOUR_USERNAME):"
    echo "git remote add origin https://github.com/YOUR_USERNAME/trello-bridge-privacy.git"
    echo ""
    echo "After adding remote, run this script again."
    exit 1
fi

echo "📤 Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed to GitHub!"
    echo ""

    # Get the remote URL to extract username
    REMOTE_URL=$(git remote get-url origin)
    USERNAME=$(echo "$REMOTE_URL" | sed -n 's|https://github.com/\([^/]*\)/.*|\1|p')

    if [ -n "$USERNAME" ]; then
        PRIVACY_URL="https://$USERNAME.github.io/trello-bridge-privacy/"
        echo "🌐 Your privacy policy will be available at:"
        echo "   $PRIVACY_URL"
        echo ""
        echo "📋 Next steps:"
        echo "1. Go to your repository: https://github.com/$USERNAME/trello-bridge-privacy"
        echo "2. Navigate to Settings → Pages"
        echo "3. Under 'Source', select 'Deploy from a branch'"
        echo "4. Select 'main' branch and '/ (root)' folder"
        echo "5. Click 'Save'"
        echo ""
        echo "6. Wait 2-3 minutes for GitHub Pages to deploy"
        echo "7. Test the URL: $PRIVACY_URL"
        echo ""
        echo "8. Update manifest.json with:"
        echo '   "homepage_url": "'$PRIVACY_URL'"'
        echo ""
        echo "9. Submit to Chrome Web Store!"
    else
        echo "❌ Could not extract username from remote URL"
        echo "Please manually check your GitHub repository settings."
    fi
else
    echo ""
    echo "❌ Failed to push to GitHub. Please check your credentials and try again."
    echo ""
    echo "Common issues:"
    echo "- Make sure you have push access to the repository"
    echo "- Check your GitHub credentials are configured"
    echo "- Verify the repository exists and is spelled correctly"
fi
