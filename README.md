# Privacy Policy Hosting for Trello Bridge

This directory contains the privacy policy webpage for the Trello Bridge Chrome extension, ready to be deployed to GitHub Pages.

## Files

- `index.html` - The privacy policy page with professional styling and responsive design

## Deployment Instructions

### Option 1: Deploy via GitHub Pages (Recommended)

1. **Create a new GitHub repository** (if you haven't already):
   ```bash
   # Create a new repo on GitHub, then:
   git init
   git add .
   git commit -m "Initial commit with privacy policy hosting"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/trello-bridge-privacy.git
   git push -u origin main
   ```

2. **Enable GitHub Pages**:
   - Go to your repository on GitHub
   - Navigate to Settings > Pages
   - Under "Source", select "Deploy from a branch"
   - Select the `main` branch and `/ (root)` folder
   - Click "Save"

3. **Your privacy policy will be live at**:
   ```
   https://YOUR_USERNAME.github.io/trello-bridge-privacy/
   ```

### Option 2: Deploy to Existing Repository

If you already have a GitHub repository for Trello Bridge:

1. **Create a `privacy` or `docs` directory** in your existing repo:
   ```bash
   cd /path/to/your/trello-bridge-repo
   mkdir privacy
   cp /path/to/privacy-policy-hosting/index.html privacy/
   ```

2. **Commit and push**:
   ```bash
   git add privacy/index.html
   git commit -m "Add privacy policy page"
   git push
   ```

3. **Enable GitHub Pages** (if not already enabled):
   - Go to Settings > Pages
   - Select the branch and folder (e.g., `main` branch, `/privacy` folder)
   - Your privacy policy will be at: `https://YOUR_USERNAME.github.io/REPO_NAME/privacy/`

### Option 3: Use GitHub's Automatic Page Generator

1. Push the `index.html` to a branch named `gh-pages`
2. GitHub will automatically serve it at `https://YOUR_USERNAME.github.io/REPO_NAME/`

## Update Your manifest.json

Once your privacy policy is live, update your Chrome extension's `manifest.json`:

```json
{
  "name": "Trello Bridge",
  "version": "2.0.0",
  "manifest_version": 3,
  ...
  "homepage_url": "https://YOUR_USERNAME.github.io/trello-bridge-privacy/"
}
```

## Chrome Web Store Requirements

When submitting to the Chrome Web Store, you'll need to provide the privacy policy URL:

1. Go to your extension's Developer Dashboard
2. Navigate to the Privacy section
3. Add the URL: `https://YOUR_USERNAME.github.io/trello-bridge-privacy/`
4. Save the changes

## Updating the Privacy Policy

To update the privacy policy:

1. Edit the `index.html` file
2. Update the "Last updated" date and version number
3. Commit and push the changes:
   ```bash
   git add privacy-policy-hosting/index.html
   git commit -m "Update privacy policy"
   git push
   ```
4. GitHub Pages will automatically update within a few minutes

## Testing Locally

To preview the privacy policy locally before deploying:

```bash
cd privacy-policy-hosting
python3 -m http.server 8000
# Open http://localhost:8000 in your browser
```

Or simply open the `index.html` file directly in your browser.

## Styling and Branding

The HTML page includes:
- Trello brand colors (#0079bf primary)
- Responsive design for mobile devices
- Professional typography
- Clean, readable layout
- Maximum width for optimal readability

## Notes

- The privacy policy is fully self-contained (no external CSS or JS)
- Mobile-responsive design works on all devices
- Meets Chrome Web Store privacy policy requirements
- Professional appearance matching Trello's design aesthetic

## Support

If you need to make changes to the styling or content:
1. Edit the `index.html` file directly
2. The CSS is embedded in the `<style>` section
3. The content is in semantic HTML5 structure

## License

This privacy policy page can be customized and deployed as needed for your Trello Bridge Chrome extension.
