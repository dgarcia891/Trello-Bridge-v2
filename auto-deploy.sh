#!/bin/bash

# Trello Bridge Privacy Policy - Automated Deployment Script
# This script handles the complete deployment process

echo "🚀 Trello Bridge Privacy Policy - Automated Deployment"
echo "======================================================"
echo ""

# Configuration
REPO_URL="https://github.com/dgarcia891/Trello-Bridge-v2.git"
PRIVACY_URL="https://dgarcia891.github.io/Trello-Bridge-v2"
MANIFEST_PATH="../TrelloBridge_v2/manifest.json"

echo "📋 Deployment Configuration:"
echo "Repository: $REPO_URL"
echo "Privacy Policy URL: $PRIVACY_URL"
echo ""

# Check if git is configured
echo "🔧 Checking Git Configuration..."
if ! git config --global user.name >/dev/null 2>&1; then
    echo "❌ Git user.name not configured"
    read -p "Enter your Git name: " git_name
    git config --global user.name "$git_name"
    echo "✅ Set git user.name to: $git_name"
fi

if ! git config --global user.email >/dev/null 2>&1; then
    echo "❌ Git user.email not configured"
    read -p "Enter your Git email: " git_email
    git config --global user.email "$git_email"
    echo "✅ Set git user.email to: $git_email"
fi

# Check if remote origin exists
echo ""
echo "🔗 Checking Git Remote..."
if git remote get-url origin >/dev/null 2>&1; then
    echo "✅ Remote origin already configured"
else
    echo "📡 Adding remote origin..."
    git remote add origin "$REPO_URL"
    if [ $? -eq 0 ]; then
        echo "✅ Successfully added remote origin"
    else
        echo "❌ Failed to add remote origin"
        exit 1
    fi
fi

# Push to GitHub
echo ""
echo "📤 Pushing to GitHub..."
echo "Note: You may be prompted for GitHub credentials"
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ SUCCESS! Files pushed to GitHub"
    echo "🌐 Repository: https://github.com/dgarcia891/Trello-Bridge-v2"
    echo ""

    echo "📋 NEXT STEPS:"
    echo "1. Go to: https://github.com/dgarcia891/Trello-Bridge-v2"
    echo "2. Click 'Settings' tab"
    echo "3. Scroll to 'Pages' section"
    echo "4. Select 'Deploy from a branch'"
    echo "5. Choose 'main' branch and '/(root)' folder"
    echo "6. Click 'Save'"
    echo "7. Wait 2-3 minutes, then refresh"
    echo ""
    echo "🎯 GitHub Pages will be available at:"
    echo "$PRIVACY_URL"
    echo ""

    # Update manifest.json
    echo "📝 Updating manifest.json..."
    if [ -f "$MANIFEST_PATH" ]; then
        # Create backup
        cp "$MANIFEST_PATH" "${MANIFEST_PATH}.backup"

        # Update manifest.json with homepage_url
        # Using a simple approach to add homepage_url
        if grep -q '"minimum_chrome_version"' "$MANIFEST_PATH"; then
            # Insert homepage_url after minimum_chrome_version
            sed -i '' '/"minimum_chrome_version": "88"/a\
  "homepage_url": "'"$PRIVACY_URL"'",' "$MANIFEST_PATH"
            echo "✅ Updated manifest.json with homepage_url"
        else
            echo "⚠️  Could not find minimum_chrome_version in manifest.json"
            echo "   Please manually add: \"homepage_url\": \"$PRIVACY_URL\""
        fi
    else
        echo "⚠️  Could not find manifest.json at $MANIFEST_PATH"
        echo "   Please manually add: \"homepage_url\": \"$PRIVACY_URL\""
    fi

    echo ""
    echo "🎉 DEPLOYMENT COMPLETE!"
    echo ""
    echo "Final Steps:"
    echo "1. Enable GitHub Pages (see instructions above)"
    echo "2. Test the privacy policy URL: $PRIVACY_URL"
    echo "3. Create Chrome Web Store ZIP:"
    echo "   cd ../TrelloBridge_v2 && zip -r ../trello-bridge-v1.2.3.zip ."
    echo "4. Submit to Chrome Web Store!"
    echo ""
    echo "⏱️  Estimated time: 15 minutes"

else
    echo ""
    echo "❌ DEPLOYMENT FAILED"
    echo ""
    echo "Possible issues:"
    echo "- Incorrect GitHub credentials"
    echo "- Repository doesn't exist or access denied"
    echo "- Network connectivity issues"
    echo ""
    echo "Please check your credentials and try again."
    exit 1
fi
