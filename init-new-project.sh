#!/bin/bash

# Lab Obsidian Genesis Template - Project Initialization Script
# Creates a new Apple ecosystem project with AI-driven development workflows

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Print styled output
print_header() {
    echo -e "\n${PURPLE}========================================${NC}"
    echo -e "${PURPLE}LAB OBSIDIAN GENESIS PROJECT INIT${NC}"
    echo -e "${PURPLE}========================================${NC}\n"
}

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_input() {
    echo -e "${CYAN}[INPUT]${NC} $1"
}

# Check if we're in a template directory
if [ ! -f "init-new-project.sh" ]; then
    print_error "This script must be run from the lab-obsidian-genesis-template directory"
    exit 1
fi

print_header
print_status "Initializing new Apple ecosystem project with AI-driven workflows..."

# Gather project information
print_input "Enter your project name (e.g., 'MyAwesome App'):"
read -r PROJECT_NAME

print_input "Enter your bundle ID prefix (e.g., 'com.yourcompany'):"
read -r BUNDLE_ID_PREFIX

print_input "Enter your Apple Developer Team ID (10 characters):"
read -r APPLE_TEAM_ID

print_input "Enter your Linear Team ID (optional, press Enter to skip):"
read -r LINEAR_TEAM_ID

print_input "Enter your GitHub username/organization:"
read -r GITHUB_USERNAME

# Validate inputs
if [ -z "$PROJECT_NAME" ]; then
    print_error "Project name cannot be empty"
    exit 1
fi

if [ -z "$BUNDLE_ID_PREFIX" ]; then
    print_error "Bundle ID prefix cannot be empty"
    exit 1
fi

if [ -z "$APPLE_TEAM_ID" ]; then
    print_error "Apple Developer Team ID cannot be empty"
    exit 1
fi

if [ -z "$GITHUB_USERNAME" ]; then
    print_error "GitHub username cannot be empty"
    exit 1
fi

# Create safe project name for file/directory names
PROJECT_NAME_SAFE=$(echo "$PROJECT_NAME" | sed 's/[^a-zA-Z0-9]//g')

print_status "Project Configuration:"
echo "  Name: $PROJECT_NAME"
echo "  Safe Name: $PROJECT_NAME_SAFE"
echo "  Bundle Prefix: $BUNDLE_ID_PREFIX"
echo "  Apple Team: $APPLE_TEAM_ID"
echo "  Linear Team: ${LINEAR_TEAM_ID:-'Not configured'}"
echo "  GitHub: $GITHUB_USERNAME"

print_input "Proceed with project initialization? (y/n):"
read -r CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    print_warning "Project initialization cancelled"
    exit 0
fi

print_status "Starting project initialization..."

# Step 1: Rename template files and directories
print_status "Renaming template files and directories..."

# Rename Apps directories
if [ -d "Apps" ]; then
    for app_dir in Apps/YourProjectName-*; do
        if [ -d "$app_dir" ]; then
            platform=$(basename "$app_dir" | sed 's/YourProjectName-//')
            new_name="Apps/${PROJECT_NAME_SAFE}-${platform}"
            mv "$app_dir" "$new_name"
            print_success "Renamed $app_dir to $new_name"
        fi
    done
fi

# Rename Packages directories
if [ -d "Packages" ]; then
    for package_dir in Packages/YourProject*; do
        if [ -d "$package_dir" ]; then
            package_suffix=$(basename "$package_dir" | sed 's/YourProject//')
            new_name="Packages/${PROJECT_NAME_SAFE}${package_suffix}"
            mv "$package_dir" "$new_name"
            print_success "Renamed $package_dir to $new_name"
        fi
    done
fi

# Rename workspace file
if [ -f "YourProjectName.xcworkspace/contents.xcworkspacedata" ]; then
    mv "YourProjectName.xcworkspace" "${PROJECT_NAME_SAFE}.xcworkspace"
    print_success "Renamed workspace to ${PROJECT_NAME_SAFE}.xcworkspace"
fi

# Step 2: Update file contents
print_status "Updating file contents with project information..."

# Function to replace placeholders in files
replace_placeholders() {
    local file="$1"
    if [ -f "$file" ]; then
        # Use temporary file for cross-platform compatibility
        tmp_file=$(mktemp)
        sed -e "s/YourProjectName/$PROJECT_NAME_SAFE/g" \
            -e "s/Your Project Name/$PROJECT_NAME/g" \
            -e "s/com\.yourcompany/$BUNDLE_ID_PREFIX/g" \
            -e "s/YOUR_TEAM_ID/$APPLE_TEAM_ID/g" \
            -e "s/your-linear-team-id/$LINEAR_TEAM_ID/g" \
            -e "s/your-github-username/$GITHUB_USERNAME/g" \
            "$file" > "$tmp_file"
        mv "$tmp_file" "$file"
        print_success "Updated placeholders in $file"
    fi
}

# Update project configuration files
find . -name "*.yaml" -o -name "*.yml" -o -name "*.json" -o -name "*.plist" -o -name "*.swift" -o -name "*.md" | while read -r file; do
    replace_placeholders "$file"
done

# Update shell scripts
find . -name "*.sh" | while read -r file; do
    replace_placeholders "$file"
done

# Update XcodeGen project files
find . -name "project.yml" | while read -r file; do
    replace_placeholders "$file"
done

# Step 3: Create environment configuration
print_status "Creating environment configuration..."

cat > .env << EOL
# ${PROJECT_NAME} Development Configuration
# Generated by init-new-project.sh

# Project Information
PROJECT_NAME="${PROJECT_NAME}"
PROJECT_NAME_SAFE="${PROJECT_NAME_SAFE}"
BUNDLE_ID_PREFIX="${BUNDLE_ID_PREFIX}"

# Apple Developer Configuration
DEVELOPMENT_TEAM="${APPLE_TEAM_ID}"
BUNDLE_IDENTIFIER="${BUNDLE_ID_PREFIX}.${PROJECT_NAME_SAFE,,}"

# CloudKit Configuration (optional)
CLOUDKIT_CONTAINER="iCloud.${BUNDLE_ID_PREFIX}.${PROJECT_NAME_SAFE,,}"

# Linear Integration (optional)
LINEAR_TEAM_ID="${LINEAR_TEAM_ID}"
LINEAR_API_KEY=""

# GitHub Configuration
GITHUB_USERNAME="${GITHUB_USERNAME}"
GITHUB_REPOSITORY="${GITHUB_USERNAME}/${PROJECT_NAME_SAFE,,}"

# Build Configuration
BUILD_CONFIGURATION="Debug"
EOL

print_success "Created .env configuration file"

# Step 4: Update BMAD configuration
print_status "Configuring BMAD system..."

if [ -f ".bmad-core/core-config.yaml" ]; then
    # Update BMAD configuration with project-specific settings
    cat > .bmad-core/core-config.yaml << EOL
version: 4.29.0
markdownExploder: true
prd:
  prdFile: docs/prd.md
  prdVersion: v4
  prdSharded: true
  prdShardedLocation: docs/prd
  epicFilePattern: epic-{n}*.md
architecture:
  architectureFile: docs/architecture.md
  architectureVersion: v4
  architectureSharded: true
  architectureShardedLocation: docs/architecture
customTechnicalDocuments:
  - Documentation/Technical/Architecture.md
  - Documentation/Technical/${PROJECT_NAME_SAFE}-Technical-Architecture.md
  - CLAUDE.md
devLoadAlwaysFiles:
  - docs/architecture/coding-standards.md
  - docs/architecture/tech-stack.md
  - docs/architecture/source-tree.md
  - docs/architecture/apple-ecosystem-integration.md
  - docs/architecture/development-patterns.md
  - docs/architecture/swift-6-concurrency-patterns.md
devDebugLog: .ai/debug-log.md
devStoryLocation: docs/stories
slashPrefix: ${PROJECT_NAME_SAFE}
coreProjectLocation:
  devStoryLocation: docs/stories
  devLoadAlwaysFiles:
    - docs/architecture/coding-standards.md
    - docs/architecture/tech-stack.md
    - docs/architecture/source-tree.md
    - docs/architecture/apple-ecosystem-integration.md
    - docs/architecture/development-patterns.md
    - docs/architecture/swift-6-concurrency-patterns.md
  devDebugLog: .ai/debug-log.md
  agentCoreDump: .ai/core-dump{n}.md
EOL
    print_success "Updated BMAD core configuration"
fi

# Step 5: Update Linear integration
if [ -n "$LINEAR_TEAM_ID" ] && [ -f ".bmad-core/integration/bmad-linear-sync.js" ]; then
    print_status "Configuring Linear integration..."
    
    # Update Linear team ID in sync script
    sed -i.bak "s/18256215-63b0-4f7b-a9c2-12b5c04e03d7/$LINEAR_TEAM_ID/g" .bmad-core/integration/bmad-linear-sync.js
    rm .bmad-core/integration/bmad-linear-sync.js.bak
    
    print_success "Updated Linear integration configuration"
fi

# Step 6: Create project documentation
print_status "Creating project-specific documentation..."

# Update CLAUDE.md with project information
cat > CLAUDE.md << EOL
# CLAUDE.md

> **⚠️ IMPORTANT**: Always update Linear workspace with comprehensive verbosity for seamless developer onboarding. Maintain Linear synchronization for full project visibility.

## Project Overview

${PROJECT_NAME} is a revolutionary Apple ecosystem application built with modern Swift and SwiftUI. This project leverages the BMAD Method for AI-driven development workflows and comprehensive automation.

**Bundle ID**: ${BUNDLE_ID_PREFIX}.${PROJECT_NAME_SAFE,,}  
**Platforms**: iOS, iPadOS, macOS, watchOS, tvOS, visionOS  
**Development Team**: ${APPLE_TEAM_ID}  
**GitHub**: https://github.com/${GITHUB_USERNAME}/${PROJECT_NAME_SAFE,,}

## Linear Development Operations

**Team ID**: ${LINEAR_TEAM_ID:-'Not configured'}  
**Project Management**: Complete BMAD-Linear integration for AI-driven project management

## Build System

**Project Generation**: \`./Scripts/generate-workspace.sh\` or \`cd Projects/${PROJECT_NAME_SAFE}-iOS && xcodegen generate\`  
**Building**: \`./Scripts/build-workspace.sh\` or \`open ${PROJECT_NAME_SAFE}.xcworkspace\`  
**Testing**: \`swift test\` in package directories or full workspace testing via xcodebuild

## Architecture Overview

### Core Components
- **${PROJECT_NAME_SAFE}Core** - Core business logic and data management
- **${PROJECT_NAME_SAFE}UI** - Shared UI components and design system
- **${PROJECT_NAME_SAFE}Features** - Feature-specific modules and functionality

### Platform Applications
- **${PROJECT_NAME_SAFE}-iOS** - iPhone and iPad application
- **${PROJECT_NAME_SAFE}-macOS** - macOS desktop application
- **${PROJECT_NAME_SAFE}-visionOS** - Vision Pro spatial computing application
- **${PROJECT_NAME_SAFE}-watchOS** - Apple Watch application
- **${PROJECT_NAME_SAFE}-tvOS** - Apple TV application

## Development Guidelines

### Critical Requirements
**Memory Management**: ALWAYS use \`[weak self]\` in ViewModel Task closures to prevent leaks  
**Swift 6**: \`@MainActor\` for ViewModels, \`Sendable\` conformance, actor-based concurrency  
**SwiftData**: Use \`@Query\` in views, pagination for large datasets, relationship caching

### Key Integrations
**Apple Integration**: App Intents, Siri/Shortcuts, Live Activities, Spotlight  
**Platform Optimization**: iOS (touch), macOS (desktop), visionOS (spatial), watchOS (ambient), tvOS (focus)  
**Testing**: Unit tests for core logic, UI tests for workflows, performance monitoring

## BMAD Method Integration

### 12 Specialized AI Agents
- **bmad-orchestrator** - Project coordination and workflow management
- **dev** - Development specialist with Swift/SwiftUI expertise
- **architect** - System architecture and technical decisions
- **qa** - Quality assurance and testing specialist
- **pm** - Product management and stakeholder coordination
- **ux-expert** - User experience design and interaction patterns
- **analyst** - Data analysis and business intelligence
- **po** - Product owner and requirement management
- **sm** - Scrum master and process optimization
- **infra-devops-platform** - Infrastructure and deployment
- **bmad-the-creator** - Framework extension and tooling
- **bmad-master** - Meta-orchestration and quality control

### Agent Teams
Use \`.bmad-core/agent-teams/team-enhanced.yaml\` for comprehensive development with all agents.

## Development Workflow

### Setup Process
1. **Environment Setup**: Run \`./Scripts/setup-developer.sh\`
2. **Workspace Generation**: Run \`./Scripts/generate-workspace.sh\`
3. **Open Project**: \`open ${PROJECT_NAME_SAFE}.xcworkspace\`
4. **Configure Signing**: Set team and bundle IDs in Xcode
5. **Build & Test**: Connect device and build for testing

### AI-Assisted Development
1. **Context Loading**: Read \`AI_CONTEXT_SUMMARY.md\` for project overview
2. **Agent Selection**: Choose appropriate agent from \`.bmad-core/agents/\`
3. **Linear Integration**: Check current issues and assignments
4. **Development**: Follow Swift 6 and SwiftUI best practices

## Quality Standards

### Performance Standards
- **Build Time**: Fast incremental builds with modular architecture
- **Memory Usage**: Efficient memory management with ARC
- **Battery Life**: Optimized for all Apple platforms
- **Accessibility**: Full VoiceOver and accessibility support

### Code Quality
- **Swift 6**: Strict concurrency and memory safety
- **SwiftUI**: Declarative UI with modern patterns
- **Testing**: Comprehensive unit and UI test coverage
- **Documentation**: Complete API documentation

## Legal & Compliance

### Important Requirements
This project requires compliance with multiple intellectual property and licensing requirements:

- **Apple Trademarks**: iOS, macOS, visionOS, watchOS, tvOS are trademarks of Apple Inc.
- **Template License**: Built with Lab Obsidian Genesis Template under MIT License
- **Third-Party Licenses**: Respect all third-party tool and library licensing requirements
- **Generated Code**: Ensure all code respects intellectual property rights

### License Compliance
Include appropriate LICENSE file and attributions in your project. Reference the template's README.md "Legal & Attribution" section for comprehensive compliance guidelines.

**Template Source**: [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template)

---

**${PROJECT_NAME} represents the future of Apple ecosystem development with AI-driven workflows, comprehensive automation, and enterprise-grade quality standards.**
EOL

print_success "Created project-specific CLAUDE.md"

# Step 7: Initialize git repository
print_status "Initializing git repository..."

# Remove existing git history if present
if [ -d ".git" ]; then
    rm -rf .git
    print_warning "Removed existing git history"
fi

# Initialize new git repository
git init
git add .
git commit -m "$(cat <<EOF
Initial commit: ${PROJECT_NAME} project created from Lab Obsidian Genesis Template

Project Configuration:
- Name: ${PROJECT_NAME}
- Bundle ID: ${BUNDLE_ID_PREFIX}.${PROJECT_NAME_SAFE,,}
- Apple Team: ${APPLE_TEAM_ID}
- Linear Team: ${LINEAR_TEAM_ID:-'Not configured'}
- GitHub: ${GITHUB_USERNAME}/${PROJECT_NAME_SAFE,,}

Features:
- Complete Apple ecosystem support (iOS, macOS, visionOS, watchOS, tvOS)
- BMAD Method integration with 12 specialized AI agents
- Linear workspace integration for project management
- AI-assisted development with Claude Code, Gemini CLI, ChatGPT Codex
- Comprehensive automation and CI/CD workflows
- Enterprise-grade development environment

Generated with Lab Obsidian Genesis Template - the ultimate Apple app development template.

Generated with [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template)
EOF
)"

print_success "Initialized git repository with initial commit"

# Step 8: Final setup instructions
print_status "Finalizing project setup..."

# Create setup completion summary
cat > PROJECT_SETUP_COMPLETE.md << EOL
# ${PROJECT_NAME} Setup Complete!

Your new Apple ecosystem project has been successfully initialized with enterprise-grade workflows and AI-driven development capabilities.

## ✅ What's Been Configured

### Project Structure
- **Name**: ${PROJECT_NAME}
- **Bundle ID**: ${BUNDLE_ID_PREFIX}.${PROJECT_NAME_SAFE,,}
- **Platforms**: iOS, iPadOS, macOS, watchOS, tvOS, visionOS
- **GitHub**: https://github.com/${GITHUB_USERNAME}/${PROJECT_NAME_SAFE,,}

### AI Development Ready
- **BMAD Method**: 12 specialized AI agents configured
- **Linear Integration**: ${LINEAR_TEAM_ID:-'Ready for configuration'}
- **AI Assistants**: Claude Code, Gemini CLI, ChatGPT Codex support
- **Documentation**: Complete AI-ready development guides

### Development Environment
- **Xcode Workspace**: ${PROJECT_NAME_SAFE}.xcworkspace
- **Swift Packages**: Modular architecture with ${PROJECT_NAME_SAFE}Core, ${PROJECT_NAME_SAFE}UI, ${PROJECT_NAME_SAFE}Features
- **Build Scripts**: Automated development, testing, and deployment
- **CI/CD**: GitHub Actions workflows configured

## Next Steps

### 1. Complete Development Setup
\`\`\`bash
# Set up development environment
./Scripts/setup-developer.sh

# Generate Xcode workspace
./Scripts/generate-workspace.sh

# Open in Xcode
open ${PROJECT_NAME_SAFE}.xcworkspace
\`\`\`

### 2. Configure Apple Developer Account
1. Edit \`.env\` file to verify your Apple Developer Team ID
2. Configure code signing in Xcode for each platform target
3. Set up provisioning profiles for device testing

### 3. Set Up Linear Integration (Optional)
If you provided a Linear Team ID, configure the API key:
\`\`\`bash
# Set Linear API key in .env file
echo "LINEAR_API_KEY=your-api-key-here" >> .env

# Run Linear workspace setup
node .bmad-core/integration/setup-linear-workspace.js
\`\`\`

### 4. Start AI-Assisted Development
\`\`\`bash
# For AI assistants, load context files
cat AI_CONTEXT_SUMMARY.md        # Quick project overview
cat CLAUDE.md                    # Detailed instructions
ls -la .bmad-core/agents/        # Available AI agents
\`\`\`

### 5. Push to GitHub
\`\`\`bash
# Add GitHub remote
git remote add origin https://github.com/${GITHUB_USERNAME}/${PROJECT_NAME_SAFE,,}.git

# Push to GitHub
git push -u origin main
\`\`\`

## 📚 Documentation

### Essential Reading
- **AI_DEVELOPER_ONBOARDING.md** - AI assistant setup guide
- **AI_CONTEXT_SUMMARY.md** - Quick project context
- **DEVELOPER_SETUP.md** - Human developer guide
- **CLAUDE.md** - Project-specific instructions

### Development Resources
- **Documentation/Architecture.md** - System architecture
- **.bmad-core/agents/** - AI agent specifications
- **Scripts/** - Development automation tools

## 🤖 AI Development Workflow

### For Claude Code Users
1. Read \`AI_CONTEXT_SUMMARY.md\` for project overview
2. Load \`CLAUDE.md\` for project-specific instructions
3. Use \`.bmad-core/agents/dev.md\` for development workflows
4. Leverage Linear integration for project management

### For Other AI Assistants
1. Load \`AI_DEVELOPER_ONBOARDING.md\` for setup instructions
2. Follow platform-specific integration guides
3. Use BMAD agents for specialized workflows

## 🎯 Project Goals

Use this template to create:
- **Enterprise-grade Apple applications** with modern Swift and SwiftUI
- **AI-driven development workflows** with specialized agents
- **Comprehensive automation** for testing, building, and deployment
- **Seamless project management** with Linear integration
- **Multi-platform excellence** across the Apple ecosystem

## 🛠️ Troubleshooting

### Common Issues
- **Build Failures**: Run \`./Scripts/generate-workspace.sh\` to regenerate workspace
- **Code Signing**: Verify Apple Developer Team ID in \`.env\` file
- **Linear Integration**: Ensure API key is configured in environment

### Support Resources
- **Template Issues**: https://github.com/labobsidian/lab-obsidian-genesis-template/issues
- **Project Documentation**: Check \`Documentation/\` directory
- **AI Agent Help**: Use \`*help\` command with any BMAD agent

## Legal & Compliance Checklist

### Essential Requirements
- **License File**: Add appropriate LICENSE file to your project repository
- **Apple Trademarks**: Use proper attribution for iOS, macOS, visionOS, watchOS, tvOS
- **Third-Party Licenses**: Review and comply with all integrated tool licensing requirements
- **Template Attribution**: Credit Lab Obsidian Genesis Template (MIT Licensed)

### Next Steps for Legal Compliance
1. **Create LICENSE file** for your project (consider MIT for compatibility)
2. **Review Apple Developer Program License Agreement** requirements
3. **Check third-party integrations** for additional licensing requirements
4. **Include attributions** in your project documentation

**Template Legal Info**: See [Lab Obsidian Genesis Template Legal & Attribution](https://github.com/labobsidian/lab-obsidian-genesis-template#legal--attribution)

---

**Welcome to the future of Apple app development!**

*Your ${PROJECT_NAME} project is now ready for enterprise-grade development with AI-driven workflows and comprehensive automation.*
EOL

print_success "Created PROJECT_SETUP_COMPLETE.md"

# Final success message
print_header
print_success "PROJECT INITIALIZATION COMPLETE!"
echo ""
print_status "Project Summary:"
echo "  Name: ${PROJECT_NAME}"
echo "  Bundle ID: ${BUNDLE_ID_PREFIX}.${PROJECT_NAME_SAFE,,}"
echo "  Apple Team: ${APPLE_TEAM_ID}"
echo "  Linear Team: ${LINEAR_TEAM_ID:-'Not configured'}"
echo "  GitHub: ${GITHUB_USERNAME}/${PROJECT_NAME_SAFE,,}"
echo ""
print_status "Next Steps:"
echo "  1. Read PROJECT_SETUP_COMPLETE.md for detailed instructions"
echo "  2. Run ./Scripts/setup-developer.sh to configure development environment"
echo "  3. Run ./Scripts/generate-workspace.sh to create Xcode workspace"
echo "  4. Open ${PROJECT_NAME_SAFE}.xcworkspace in Xcode"
echo "  5. Configure code signing and build for your devices"
echo ""
print_success "Your AI-driven Apple ecosystem project is ready for development!"
print_status "For AI assistants: Start with AI_CONTEXT_SUMMARY.md and CLAUDE.md"
echo ""
print_header