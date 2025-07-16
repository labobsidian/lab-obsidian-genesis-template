# AI Developer Onboarding Guide

**Universal AI-Assisted Development for YourProjectName**  
Compatible with Claude Code, Gemini CLI, ChatGPT Codex, and other AI development tools

## Quick Start for AI Assistants

### Repository Overview
```
YourProjectName - Apple Ecosystem Application Template
├── Apps/              # Platform-specific SwiftUI applications
├── Packages/          # Shared Swift packages (YourProjectCore, YourProjectUI, etc.)
├── Projects/          # XcodeGen project definitions (will be created)
├── Scripts/           # Build and development automation
├── .bmad-core/        # BMAD Method v4.29.0 - 12 AI agents
├── Documentation/     # Technical specs and project documentation
└── Tests/             # Comprehensive test suites
```

### Core Project Context
- **Platform**: Apple Ecosystem (iOS, iPadOS, macOS, watchOS, tvOS, visionOS)
- **Language**: Swift 6 with strict concurrency
- **Architecture**: SwiftUI + SwiftData + Modern Apple Frameworks
- **Build System**: XcodeGen + Swift Package Manager
- **AI Development**: BMAD Method with 12 specialized agents
- **Project Management**: Linear workspace with bidirectional sync (optional)

## AI Assistant Setup Instructions

### For Claude Code Users

**Initial Repository Understanding:**
```bash
# 1. Read the project overview
Read CLAUDE.md

# 2. Understand the architecture
Read Documentation/Architecture.md

# 3. Check BMAD agent system
Glob .bmad-core/agents/*.md

# 4. Review build system
Read Scripts/setup-developer.sh
```

**Essential Claude Code Workflow:**
1. **Context Loading**: Always start by reading `CLAUDE.md` for project-specific instructions
2. **BMAD Integration**: Use `.bmad-core/agents/` for specialized development workflows
3. **Tool Usage**: Leverage Read, Edit, Bash, Glob, Grep for efficient development
4. **Task Tracking**: Use TodoWrite for complex multi-step tasks
5. **Build Commands**: Use `./Scripts/setup-developer.sh` and `./Scripts/generate-workspace.sh`

**Linear Integration Commands (if configured):**
```bash
# Check Linear integration status
Bash ls -la .bmad-core/integration/

# Set up Linear workspace
Bash node .bmad-core/integration/bmad-linear-sync.js --setup
```

### For Gemini CLI Users

**Context Preparation:**
```bash
# Load project context
cat CLAUDE.md AI_CONTEXT_SUMMARY.md > /tmp/project_context.md

# Understand BMAD system
find .bmad-core/agents -name "*.md" -exec head -20 {} \;

# Get repository structure
tree -L 3 -I 'node_modules|.build|DerivedData'
```

**Development Workflow:**
1. **Start Session**: Load `AI_CONTEXT_SUMMARY.md` first
2. **Architecture Review**: Read `Documentation/` for deep understanding
3. **BMAD Agents**: Navigate `.bmad-core/agents/` for specialized capabilities
4. **Build System**: Use `Scripts/setup-developer.sh` before development
5. **Testing**: Run `swift test` in package directories

### For ChatGPT Codex Users

**Repository Context Loading:**
```bash
# Essential context files (load in order)
1. AI_CONTEXT_SUMMARY.md     # Quick project overview
2. CLAUDE.md                 # Detailed project instructions
3. README.md                 # Repository introduction
4. Documentation/README.md   # Technical documentation index
```

**Key Development Patterns:**
1. **SwiftUI + Swift 6**: Focus on `@MainActor`, `Sendable`, and concurrency
2. **Modular Architecture**: YourProjectCore, YourProjectUI, YourProjectFeatures
3. **Apple Integration**: Native platform APIs, App Intents, SwiftData
4. **BMAD Method**: 12 specialized agents for AI-driven development
5. **Universal Design**: Single codebase for all Apple platforms

## Critical File Locations

### Core Configuration
- `CLAUDE.md` - **Primary project instructions (READ FIRST)**
- `.bmad-core/core-config.yaml` - BMAD Method configuration
- `YourProjectName.xcworkspace` - Main Xcode workspace (generated)
- `.env` - Development environment configuration

### Source Code Structure
```
Apps/YourProjectName-iOS/Sources/     # iOS application code
Packages/YourProjectCore/Sources/     # Core business logic
Packages/YourProjectUI/Sources/       # Shared UI components
Packages/YourProjectFeatures/Sources/ # Feature modules
```

### Development Tools
```
Scripts/setup-developer.sh           # Complete development setup
Scripts/generate-workspace.sh        # XcodeGen workspace generation
Scripts/build-workspace.sh           # Automated build process
Scripts/deploy-testflight.sh         # TestFlight deployment
```

### BMAD Agent System
```
.bmad-core/agents/                   # 12 specialized AI agents
.bmad-core/agent-teams/              # Agent collaboration configurations
.bmad-core/integration/              # Linear workspace integration
.bmad-core/tasks/                    # Workflow automation tasks
```

## Development Workflow for AI Assistants

### 1. Initial Setup
```bash
# Initialize and set up the project (if cloning template)
./init-new-project.sh

# Set up development environment
./Scripts/setup-developer.sh

# Generate workspace
./Scripts/generate-workspace.sh
```

### 2. AI Context Preparation
```bash
# Load essential context (for any AI assistant)
cat AI_CONTEXT_SUMMARY.md        # Quick overview
cat CLAUDE.md                    # Detailed instructions
ls -la .bmad-core/agents/        # Available AI agents
```

### 3. Development Commands
```bash
# Build workspace
./Scripts/build-workspace.sh

# Run tests
swift test --package-path Packages/YourProjectCore
swift test --package-path Packages/YourProjectUI

# Open in Xcode
open YourProjectName.xcworkspace
```

### 4. BMAD Agent Activation (AI-Specific)
For AI assistants that support role-playing or agent systems:

```markdown
# Activate specific BMAD agent by reading:
.bmad-core/agents/dev.md          # Development specialist
.bmad-core/agents/architect.md    # System architecture expert
.bmad-core/agents/qa.md           # Quality assurance specialist
.bmad-core/agents/pm.md           # Product management expert
```

## Apple Ecosystem Architecture

### Platform Applications
- **iOS/iPadOS**: Touch-optimized interface with Live Activities
- **macOS**: Desktop-class experience with menu bar integration
- **visionOS**: Spatial computing interface with hand tracking
- **watchOS**: Ambient intelligence with complications
- **tvOS**: Focus engine navigation with remote control

### Core Packages
1. **YourProjectCore** - Business logic, data models, services
2. **YourProjectUI** - Design system, shared components
3. **YourProjectFeatures** - Feature-specific modules

### Key Technologies
```swift
// Core architecture
SwiftUI          // Declarative UI framework
SwiftData        // Data persistence with CloudKit sync
@MainActor       // Swift 6 main actor isolation
Sendable         // Concurrency safety

// Apple Integration
App Intents      // Siri and Shortcuts integration
Live Activities  // Dynamic Island and Lock Screen
WidgetKit        // Home Screen and Control Center widgets
```

## Linear Workspace Integration (Optional)

### For AI Project Management
- **Team ID**: Configured in `.env` file
- **Project Structure**: Automated BMAD project organization
- **Agent Assignment**: Issues automatically assigned to specialized agents
- **Sync System**: `.bmad-core/integration/bmad-linear-sync.js`

### Setup Linear Integration
```bash
# Configure environment
echo "LINEAR_TEAM_ID=your-team-id" >> .env
echo "LINEAR_API_KEY=your-api-key" >> .env

# Set up workspace
node .bmad-core/integration/bmad-linear-sync.js --setup
```

## AI Development Best Practices

### Context Window Optimization
1. **Start with** `AI_CONTEXT_SUMMARY.md` for quick context
2. **Reference** `CLAUDE.md` for specific project rules
3. **Use** `.bmad-core/agents/` for specialized workflows
4. **Focus on** current development priorities

### Code Quality Standards
- **Swift 6**: Strict concurrency with `@MainActor` and `Sendable`
- **Memory Management**: Always use `[weak self]` in Task closures
- **Performance**: 60fps UI, efficient memory usage, battery optimization
- **Testing**: Comprehensive test coverage for core components

### AI-Specific Workflow Tips
- **Claude Code**: Use tool combinations (Read+Edit, Bash+Grep) for efficiency
- **Gemini CLI**: Load context files in sequence for better understanding
- **ChatGPT Codex**: Focus on single-package analysis before multi-package operations
- **All AIs**: Reference BMAD agents for specialized development guidance

## Troubleshooting for AI Assistants

### Common Issues
1. **Workspace Not Found**: Run `./Scripts/generate-workspace.sh` to create Xcode workspace
2. **Build Failures**: Check Apple Developer Team ID in `.env` file
3. **Missing Context**: Always start with `CLAUDE.md` and `AI_CONTEXT_SUMMARY.md`
4. **BMAD Confusion**: Each agent in `.bmad-core/agents/` is self-contained

### Quick Fixes
```bash
# Reset workspace
./Scripts/generate-workspace.sh

# Clean build
rm -rf .build
./Scripts/build-workspace.sh

# Update dependencies
swift package update
```

## Essential Reading Order for AI Assistants

1. **AI_CONTEXT_SUMMARY.md** - Start here for quick context
2. **CLAUDE.md** - Comprehensive project instructions
3. **README.md** - Repository overview
4. **.bmad-core/README.md** - BMAD Method overview
5. **Documentation/Architecture.md** - Technical deep dive

## Success Metrics

Your AI-assisted development session is successful when you can:
- ✅ Navigate the repository structure efficiently
- ✅ Understand the Apple ecosystem architecture
- ✅ Use BMAD agents for specialized development tasks
- ✅ Integrate with Linear workspace for project management (if configured)
- ✅ Build and test the application successfully
- ✅ Follow Swift 6 concurrency and Apple platform guidelines

## About Lab Obsidian

Lab Obsidian is a creative platform spanning music, technology, and cultural experiences. We build tools and systems that embody brutalist design principles—every decision is deliberate, nothing accidental.

**Contact**: zack@labobsidian.com  
**Website**: https://www.labobsidian.com

## Legal Compliance for AI Assistants

### Important Requirements
- **Apple Trademarks**: Always use proper attribution for iOS, macOS, visionOS, watchOS, tvOS (Apple trademarks)
- **Third-Party Licenses**: Reference LICENSE file and README.md Legal section for all attribution requirements
- **Generated Code**: Ensure all generated code respects intellectual property rights and licensing terms
- **API Usage**: Follow rate limits and terms of service for Linear, GitHub, and integrated services
- **Template License**: This template is MIT Licensed - include appropriate attributions in generated projects

### Best Practices
- Always reference the README.md "Legal & Attribution" section when working with third-party integrations
- Include proper license files when generating new projects
- Respect all trademark and intellectual property guidelines
- Follow Apple Developer Program requirements for platform development

---

**Welcome to AI-assisted Apple ecosystem development!**

*This guide ensures any AI development assistant can quickly understand and effectively contribute to your Apple platform application.*

*Built with [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template) - The ultimate Apple app development template.*