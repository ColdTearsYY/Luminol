# Triggering GitHub Actions for ver/1.21.11

## Problem
The `ver/1.21.11` branch needs to have the GitHub Actions workflow executed to build and release the Luminol 1.21.11 version.

## Solution

### Automated Script (Recommended)
Use the provided script to trigger the workflow:

```bash
./scripts/trigger_ver_1_21_11_build.sh
```

This script will:
1. Checkout the `ver/1.21.11` branch
2. Create an empty commit (to trigger the workflow)
3. Push to origin, which automatically triggers the GitHub Actions workflow

### Manual Steps
Alternatively, you can manually trigger the workflow:

```bash
# 1. Checkout the branch
git checkout ver/1.21.11

# 2. Create a trigger commit (without [ci skip])
git commit --allow-empty -m "Trigger build for ver/1.21.11"

# 3. Push to trigger the workflow
git push origin ver/1.21.11
```

### Via GitHub UI (workflow_dispatch)
The workflow also supports manual triggering through the GitHub Actions UI:

1. Navigate to: https://github.com/ColdTearsYY/Luminol/actions/workflows/build.yml
2. Click "Run workflow"
3. Select branch: `ver/1.21.11`
4. (Optional) Configure inputs:
   - `force-release`: Control release behavior
   - `force-push`: Control Maven repository push
   - `comments`: Add comments to the release
5. Click "Run workflow"

## Expected Output

Once triggered, the workflow will:
- ✅ Build Luminol Paperclip JAR for Minecraft 1.21.11
- ✅ Upload build artifacts
- ✅ Create a GitHub release with tag `1.21.11-<commit_hash>`
- ✅ Publish to Maven repository (if configured)

## Monitoring

Monitor the workflow progress at:
https://github.com/ColdTearsYY/Luminol/actions

##Notes
- The current HEAD of `ver/1.21.11` has commit message `[ci skip]Add jprofiler lnk` which prevents automatic CI
- This is why a new trigger commit is needed
- The branch is properly configured with `mcVersion=1.21.11` and `release=2` (full release mode)
