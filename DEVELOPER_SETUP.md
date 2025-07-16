# YourProjectName Developer Setup Guide

**Complete setup for human developers and AI-assisted development**  
Supports traditional development and AI coding assistants (Claude Code, Gemini CLI, ChatGPT Codex)

This guide will help you set up YourProjectName for development and testing on your personal devices.

## AI-Assisted Development Setup

### For AI Development Assistants
If you're an AI assistant (Claude Code, Gemini CLI, ChatGPT Codex), start here:

1. **Load Context**: Read `AI_CONTEXT_SUMMARY.md` first for quick project understanding
2. **Read Instructions**: Load `CLAUDE.md` for complete project guidelines  
3. **Understand BMAD**: Explore `.bmad-core/agents/` for specialized development workflows
4. **Check Linear**: Review current issues and agent assignments (if configured)

**Quick AI Setup:**
```bash
# Essential context files for AI assistants
cat AI_CONTEXT_SUMMARY.md        # Quick overview
cat CLAUDE.md                    # Detailed instructions
ls -la .bmad-core/agents/        # Available AI agents
```

**Full AI Guide**: See `AI_DEVELOPER_ONBOARDING.md` for comprehensive AI assistant instructions.

---

## Prerequisites

- **Xcode 15.0+** with Apple platforms SDK
- **Apple Developer Account** (free tier works for device testing)
- **macOS 14.0+** for development
- **XcodeGen** for project generation (optional, see automated setup)

## Quick Setup (Automated)

1. **Clone and Configure**:
```bash
git clone https://github.com/labobsidian/yourprojectname.git
cd yourprojectname
./Scripts/setup-developer.sh
```

2. **Set Your Developer Credentials**:
```bash
export DEVELOPMENT_TEAM="YOUR_TEAM_ID"
export BUNDLE_ID_PREFIX="com.labobsidian"
```

3. **Generate and Open Workspace**:
```bash
./Scripts/generate-workspace.sh
open YourProjectName.xcworkspace
```

## Manual Setup

### 1. Configure Environment Variables

Create a `.env` file in the project root:
```bash
# Your Apple Developer Team ID (found in Apple Developer Portal)
DEVELOPMENT_TEAM=ABC123DEF4

# Your bundle ID prefix (use your domain in reverse)
BUNDLE_ID_PREFIX=com.labobsidian

# Your project name
PROJECT_NAME=YourProjectName

# Optional: CloudKit container
CLOUDKIT_CONTAINER=iCloud.com.labobsidian.yourprojectname

# Optional: Linear integration
LINEAR_TEAM_ID=your-team-id
LINEAR_API_KEY=your-api-key
```

### 2. Generate Workspace

The project uses XcodeGen for workspace management:

```bash
# Install XcodeGen (if not already installed)
brew install xcodegen

# Generate all platform projects
./Scripts/generate-workspace.sh

# Or generate individual platforms
cd Projects/YourProjectName-iOS && xcodegen generate
```

### 3. Configure Code Signing in Xcode

1. Open `YourProjectName.xcworkspace`
2. Select each target (YourProjectName-iOS, YourProjectName-macOS, etc.)
3. In **Signing & Capabilities**:
   - Set **Team** to your Apple Developer Team
   - Ensure **Automatically manage signing** is checked
   - Bundle Identifier should auto-populate as `com.labobsidian.yourprojectname`

### 4. Device-Specific Setup

#### iOS/iPadOS
- Connect your device via USB
- Trust your device and developer certificate
- Build and run to device

#### macOS
- Enable Developer Mode in System Settings
- Allow apps from your team ID

#### visionOS (Apple Vision Pro)
- Requires Xcode 15.2+ and visionOS SDK
- Device testing requires Vision Pro with visionOS 1.0+

#### watchOS (Apple Watch)
- Requires paired iPhone with YourProjectName installed
- Watch must be in Developer Mode

#### tvOS (Apple TV)
- Requires Apple TV 4K or Apple TV HD
- Enable Developer Mode via Settings

## BMAD Method Integration

### AI Development Agents
YourProjectName uses the **BMAD Method v4.29.0** with 12 specialized AI agents for enhanced development:

**Core Agents**: bmad-orchestrator, dev, architect, qa, pm, ux-expert, analyst, po, sm  
**Expansion Agents**: infra-devops-platform, bmad-the-creator  
**Meta Agent**: bmad-master

### Using BMAD Agents
```bash
# View available agents
ls .bmad-core/agents/

# Example: Activate development agent
cat .bmad-core/agents/dev.md

# Use agent teams for collaboration
cat .bmad-core/agent-teams/team-enhanced.yaml
```

## Linear Workspace Integration (Optional)

### Project Management Setup
- **Linear Team**: Configure in `.env` file
- **Project Organization**: Automated BMAD project structure
- **Sync System**: `.bmad-core/integration/bmad-linear-sync.js`

### Setup Linear Integration
```bash
# Set Linear configuration in .env
echo "LINEAR_TEAM_ID=your-team-id" >> .env
echo "LINEAR_API_KEY=your-api-key" >> .env

# Install dependencies and set up workspace
cd .bmad-core/integration
npm install
node bmad-linear-sync.js --setup
```

## Architecture Overview

### Core Packages
1. **YourProjectCore** - Business logic, data models, services
2. **YourProjectUI** - Design system, shared components
3. **YourProjectFeatures** - Feature-specific modules

### Key Technologies
- **SwiftUI** + **SwiftData** for modern Apple development
- **App Intents** for Siri and Shortcuts integration
- **Live Activities** for Dynamic Island and Lock Screen
- **WidgetKit** for Home Screen widgets

## Essential Documentation

### Required Reading
1. **`CLAUDE.md`** - Primary project instructions (MUST READ)
2. **`AI_DEVELOPER_ONBOARDING.md`** - Universal AI assistant guide
3. **`AI_CONTEXT_SUMMARY.md`** - Quick project context for AI tools
4. **`.bmad-core/README.md`** - BMAD Method overview

### Additional Resources
- **Documentation/Architecture.md** - Technical deep dive
- **Scripts/** - Development automation tools
- **Template Source**: [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template)

## Build Settings Overview

### Deployment Targets (Device Compatibility)
- **iOS**: 17.0+ (iPhone 12 and newer)
- **macOS**: 14.0+ (macOS Sonoma and newer)
- **visionOS**: 1.0+ (All Vision Pro models)
- **watchOS**: 10.0+ (Apple Watch Series 7 and newer)
- **tvOS**: 17.0+ (Apple TV 4K and Apple TV HD)

### Code Signing Configuration
All platforms use:
- **Automatic signing** with your Developer Team
- **Debug builds** for development and testing
- **Release builds** for distribution (requires additional setup)

## Common Issues

### "Failed to code sign" error
- Verify your Team ID is correct in `.env`
- Check bundle ID doesn't conflict with existing apps
- Ensure provisioning profiles are valid

### Workspace generation issues
- Install XcodeGen: `brew install xcodegen`
- Run: `./Scripts/generate-workspace.sh`
- Check that all `.yml` files in `Projects/` are valid

### Build failures
- Clean build folder: `CMD+Shift+K` in Xcode
- Delete derived data: `~/Library/Developer/Xcode/DerivedData`
- Regenerate workspace: `./Scripts/generate-workspace.sh`

## Development Workflow

### Recommended Development Setup
1. **iOS** - Primary development and testing platform
2. **macOS** - Desktop productivity features
3. **visionOS** - Spatial computing experiences (if available)

### Build & Test Commands
```bash
# Build all platforms
./Scripts/build-workspace.sh

# Run tests
swift test --package-path Packages/YourProjectCore
swift test --package-path Packages/YourProjectUI

# Run on physical device
./Scripts/deploy-to-device.sh
```

## About Lab Obsidian

Lab Obsidian is a creative platform spanning music, technology, and cultural experiences. We build tools and systems that embody brutalist design principles—every decision is deliberate, nothing accidental.

**Contact**: zack@labobsidian.com  
**Website**: https://www.labobsidian.com

## Support

For development issues:
- **AI Assistants**: Start with `AI_DEVELOPER_ONBOARDING.md`
- **Project Context**: Check `CLAUDE.md` for architecture details
- **BMAD Workflow**: Use appropriate agent from `.bmad-core/agents/`
- **Template Issues**: Check [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template)
- **Build Problems**: Review build logs in Xcode and verify environment variables

The workspace is designed to "just work" with minimal configuration for both human developers and AI assistants. Most issues stem from code signing or missing environment variables.

---

*Built with [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template) - The ultimate Apple app development template.*