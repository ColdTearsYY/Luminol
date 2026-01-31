#!/bin/bash
# Script to trigger GitHub Actions workflow for ver/1.21.11

set -e

echo "=========================================="
echo "Trigger Build for ver/1.21.11"
echo "=========================================="

# Check if we're in the correct repository
if [ ! -d ".git" ]; then
    echo "Error: This script must be run from the repository root"
    exit 1
fi

# Fetch the latest changes
echo "Fetching latest changes..."
git fetch origin ver/1.21.11

# Checkout the ver/1.21.11 branch
echo "Checking out ver/1.21.11 branch..."
git checkout ver/1.21.11

# Pull latest changes
echo "Pulling latest changes..."
git pull origin ver/1.21.11 || true

# Create an empty commit to trigger the workflow
echo "Creating trigger commit..."
git commit --allow-empty -m "Trigger GitHub Actions workflow for ver/1.21.11 build"

# Push to trigger the workflow
echo "Pushing to origin/ver/1.21.11..."
git push origin ver/1.21.11

echo ""
echo "=========================================="
echo "✅ Successfully triggered workflow!"
echo "=========================================="
echo ""
echo "The GitHub Actions workflow should now be running."
echo "You can monitor the progress at:"
echo "https://github.com/ColdTearsYY/Luminol/actions"
echo ""
