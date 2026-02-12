const fs = require('fs');
const type = process.argv[2] || 'patch';
const pkg = JSON.parse(fs.readFileSync('package.json'));
// Bump Logic...
pkg.version = '1.0.1'; // (Placeholder for actual semver logic)
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
if (fs.existsSync('src/manifest.json')) {
    const m = JSON.parse(fs.readFileSync('src/manifest.json'));
    m.version = pkg.version;
    fs.writeFileSync('src/manifest.json', JSON.stringify(m, null, 2));
}
console.log(`📦 Bumped to ${pkg.version}`);
