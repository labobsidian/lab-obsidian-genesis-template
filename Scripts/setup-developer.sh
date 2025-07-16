#!/bin/bash

# YourProjectName Developer Setup Script
# Configures the workspace for development and testing

set -e  # Exit on any error

echo "🚀 Setting up YourProjectName for development..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
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

# Check if we're in the right directory
if [ ! -f "YourProjectName.xcworkspace/contents.xcworkspacedata" ] && [ ! -f "Scripts/generate-workspace.sh" ]; then
    print_error "This script must be run from the YourProjectName project root directory"
    exit 1
fi

print_status "Checking prerequisites..."

# Check for Xcode
if ! command -v xcodebuild &> /dev/null; then
    print_error "Xcode is not installed or not in PATH"
    print_error "Please install Xcode from the App Store"
    exit 1
fi

print_success "Xcode found: $(xcodebuild -version | head -n 1)"

# Check for Git
if ! command -v git &> /dev/null; then
    print_error "Git is not installed"
    exit 1
fi

# Check if XcodeGen is available
XCODEGEN_AVAILABLE=false
if command -v xcodegen &> /dev/null; then
    XCODEGEN_AVAILABLE=true
    print_success "XcodeGen found: $(xcodegen --version)"
else
    print_warning "XcodeGen not found. We'll try to install it..."
    
    # Try to install XcodeGen via Homebrew
    if command -v brew &> /dev/null; then
        print_status "Installing XcodeGen via Homebrew..."
        brew install xcodegen
        XCODEGEN_AVAILABLE=true
        print_success "XcodeGen installed successfully"
    else
        print_warning "Homebrew not found. You can install XcodeGen manually:"
        print_warning "1. Install Homebrew: https://brew.sh"
        print_warning "2. Run: brew install xcodegen"
        print_warning "3. Re-run this script"
    fi
fi

# Environment Configuration
print_status "Setting up environment configuration..."

ENV_FILE=".env"
if [ ! -f "$ENV_FILE" ]; then
    print_status "Creating default environment configuration..."
    cat > "$ENV_FILE" << EOL
# YourProjectName Development Configuration
# Copy this file and update with your Apple Developer credentials

# Project Information
PROJECT_NAME="YourProjectName"
PROJECT_NAME_SAFE="YourProjectName"
BUNDLE_ID_PREFIX="com.yourcompany"

# Your Apple Developer Team ID (10-character alphanumeric)
# Find this at: https://developer.apple.com/account/#!/membership/
DEVELOPMENT_TEAM=

# Your bundle identifier prefix (reverse domain notation)
# Example: com.yourcompany, dev.yourname, etc.
BUNDLE_IDENTIFIER=com.yourcompany.yourprojectname

# CloudKit container identifier (optional, for advanced features)
# Will be auto-generated as: iCloud.\${BUNDLE_ID_PREFIX}.yourprojectname
CLOUDKIT_CONTAINER=

# Linear Integration (optional)
LINEAR_TEAM_ID=
LINEAR_API_KEY=

# GitHub Configuration
GITHUB_USERNAME=
GITHUB_REPOSITORY=

# Build configuration (Debug or Release)
BUILD_CONFIGURATION=Debug
EOL
    print_success "Created .env file with default configuration"
else
    print_warning ".env file already exists - keeping existing configuration"
fi

# Check for required environment variables
print_status "Checking environment configuration..."

# Source the .env file if it exists
if [ -f "$ENV_FILE" ]; then
    set -a  # automatically export all variables
    source "$ENV_FILE"
    set +a
fi

# Check for DEVELOPMENT_TEAM
if [ -z "$DEVELOPMENT_TEAM" ]; then
    print_warning "DEVELOPMENT_TEAM not set in .env file"
    print_warning "Please edit .env and add your 10-character Apple Developer Team ID"
    print_warning "You can find this at: https://developer.apple.com/account/#!/membership/"
fi

# Check for BUNDLE_ID_PREFIX
if [ -z "$BUNDLE_ID_PREFIX" ]; then
    print_warning "BUNDLE_ID_PREFIX not set, using default: com.yourcompany"
    export BUNDLE_ID_PREFIX="com.yourcompany"
fi

print_status "Configuration summary:"
echo "  Team ID: ${DEVELOPMENT_TEAM:-'[NOT SET]'}"
echo "  Bundle Prefix: ${BUNDLE_ID_PREFIX}"
echo "  Build Config: ${BUILD_CONFIGURATION:-'Debug'}"

# AI Development Context Setup
print_status "Setting up AI development context..."

# Create AI context files if they don't exist
if [ ! -f "AI_CONTEXT_SUMMARY.md" ]; then
    print_warning "AI_CONTEXT_SUMMARY.md not found - AI assistants will have limited context"
fi

if [ ! -f "AI_DEVELOPER_ONBOARDING.md" ]; then
    print_warning "AI_DEVELOPER_ONBOARDING.md not found - AI workflow guidance unavailable"
fi

# Verify BMAD integration
if [ -d ".bmad-core/agents" ]; then
    AGENT_COUNT=$(find .bmad-core/agents -name "*.md" | wc -l)
    print_success "BMAD Method integrated: $AGENT_COUNT agents available"
else
    print_warning "BMAD agents not found - AI development workflows unavailable"
fi

# Check Linear integration
if [ -f ".bmad-core/integration/bmad-linear-sync.js" ]; then
    print_success "Linear workspace integration ready"
    
    # Install Node.js dependencies if needed
    if [ -f ".bmad-core/integration/package.json" ]; then
        if command -v npm &> /dev/null; then
            print_status "Installing Linear integration dependencies..."
            (cd .bmad-core/integration && npm install)
            print_success "Linear integration dependencies installed"
        else
            print_warning "npm not found - Linear integration may not work without Node.js dependencies"
        fi
    fi
else
    print_warning "Linear integration not found - project management sync unavailable"
fi

# Generate workspace if XcodeGen is available
if [ "$XCODEGEN_AVAILABLE" = true ]; then
    print_status "Generating Xcode workspace..."
    
    if [ -f "Scripts/generate-workspace.sh" ]; then
        chmod +x Scripts/generate-workspace.sh
        ./Scripts/generate-workspace.sh
        print_success "Workspace generated successfully"
    else
        print_warning "Workspace generation script not found, generating manually..."
        
        # Generate each platform project
        for project_dir in Projects/YourProjectName-*; do
            if [ -d "$project_dir" ] && [ -f "$project_dir/project.yml" ]; then
                print_status "Generating $(basename "$project_dir")..."
                (cd "$project_dir" && xcodegen generate)
            fi
        done
        
        print_success "All platform projects generated"
    fi
else
    print_warning "Skipping workspace generation (XcodeGen not available)"
    print_warning "You'll need to generate the workspace manually after installing XcodeGen"
fi

# Verify workspace exists
if [ -f "YourProjectName.xcworkspace/contents.xcworkspacedata" ]; then
    print_success "Workspace verified: YourProjectName.xcworkspace"
else
    print_warning "Workspace not found or incomplete"
fi

# Development setup instructions
print_status "Setup complete! Next steps:"
echo ""
echo "1. ${BLUE}Configure your credentials:${NC}"
echo "   Edit .env file and set your DEVELOPMENT_TEAM ID"
echo ""
echo "2. ${BLUE}For AI-Assisted Development:${NC}"
echo "   - Load AI_CONTEXT_SUMMARY.md for quick context"
echo "   - Read AI_DEVELOPER_ONBOARDING.md for full AI workflow"
echo "   - Explore .bmad-core/agents/ for specialized AI workflows"
echo ""
echo "3. ${BLUE}Open the workspace:${NC}"
echo "   open YourProjectName.xcworkspace"
echo ""
echo "4. ${BLUE}Configure code signing in Xcode:${NC}"
echo "   - Select each target in Xcode"
echo "   - Go to 'Signing & Capabilities'"
echo "   - Set your Team and verify bundle IDs"
echo ""
echo "5. ${BLUE}Build and test:${NC}"
echo "   - Connect your device"
echo "   - Select your device as the destination"
echo "   - Build and run (⌘+R)"
echo ""

# Platform-specific notes
print_status "Platform deployment notes:"
echo "  📱 iOS/iPadOS: Connect device via USB, trust developer cert"
echo "  🖥️  macOS: Enable Developer Mode in System Settings"
echo "  🥽 visionOS: Requires Vision Pro with visionOS 1.0+"
echo "  ⌚ watchOS: Requires paired iPhone with YourProjectName installed"
echo "  📺 tvOS: Enable Developer Mode on Apple TV"

print_success "YourProjectName development environment is ready!"
print_status "Documentation:"
echo "  📋 Human developers: DEVELOPER_SETUP.md"
echo "  🤖 AI assistants: AI_DEVELOPER_ONBOARDING.md"
echo "  ⚡ Quick AI context: AI_CONTEXT_SUMMARY.md"
echo "  🧠 BMAD agents: .bmad-core/agents/"

# Optional: Open workspace automatically
if [ "$1" = "--open" ] && [ -f "YourProjectName.xcworkspace/contents.xcworkspacedata" ]; then
    print_status "Opening workspace in Xcode..."
    open YourProjectName.xcworkspace
fi