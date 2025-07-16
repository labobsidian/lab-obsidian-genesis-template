# AI Context Summary - YourProjectName

**Quick context loader for AI development assistants**  
Load this file first for immediate project understanding

## Project Overview

**YourProjectName** = Apple ecosystem application built with the Lab Obsidian Genesis Template, featuring modern Swift development with AI-driven workflows.

- **Platforms**: iOS, iPadOS, macOS, watchOS, tvOS, visionOS
- **Language**: Swift 6 with strict concurrency
- **Architecture**: SwiftUI + SwiftData + Modern Apple Frameworks
- **Development Method**: BMAD v4.29.0 with 12 specialized AI agents
- **Project Management**: Linear workspace with bidirectional AI sync (optional)

## Quick Facts

- **Template**: Lab Obsidian Genesis Template - Universal Apple app development
- **Swift Packages**: YourProjectCore, YourProjectUI, YourProjectFeatures
- **AI Agents**: 12 BMAD agents for comprehensive development workflows
- **Build System**: XcodeGen + Swift Package Manager
- **Documentation**: AI-ready guides for humans and assistants

## Key Directories

```
yourprojectname/
├── CLAUDE.md                    # PRIMARY PROJECT INSTRUCTIONS
├── AI_DEVELOPER_ONBOARDING.md  # Universal AI assistant guide
├── Apps/                       # Platform-specific SwiftUI apps
│   ├── YourProjectName-iOS/    # iPhone & iPad app
│   ├── YourProjectName-macOS/  # macOS app
│   └── YourProjectName-*/      # Other platforms
├── Packages/                   # Shared Swift packages
│   ├── YourProjectCore/        # Business logic & data models
│   ├── YourProjectUI/          # Design system & shared UI
│   └── YourProjectFeatures/    # Feature modules
├── Projects/                   # XcodeGen project definitions (generated)
├── Scripts/                   # Build automation
├── .bmad-core/                # BMAD Method (12 AI agents)
└── Documentation/             # Technical specs & guides
```

## Apple Ecosystem Architecture

**Platform Applications**:
- **iOS/iPadOS**: Touch-optimized with Live Activities and Dynamic Island
- **macOS**: Desktop-class with menu bar and native window management
- **visionOS**: Spatial computing with hand tracking and immersive experiences
- **watchOS**: Ambient intelligence with complications and health integration
- **tvOS**: Focus engine navigation with remote control support

**Core Packages**:
1. **YourProjectCore** - Business logic, data models, services
2. **YourProjectUI** - Design system, shared components, platform adaptations
3. **YourProjectFeatures** - Feature-specific modules and workflows

## BMAD Agent System

**12 Specialized Agents** (`.bmad-core/agents/`):
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

## Essential Commands

```bash
# Project initialization (if using template)
./init-new-project.sh

# Development setup
./Scripts/setup-developer.sh

# Generate workspace
./Scripts/generate-workspace.sh

# Build everything
./Scripts/build-workspace.sh

# Open in Xcode
open YourProjectName.xcworkspace
```

## Linear Workspace (Optional)

- **Team ID**: Configured in `.env` file
- **Project Organization**: Automated BMAD project structure
- **Agent Assignment**: Issues automatically assigned to specialized agents
- **Sync System**: `.bmad-core/integration/bmad-linear-sync.js`

## Current Development Status

**Setup Phase**: Project initialized from Lab Obsidian Genesis Template
**Core Architecture**: Swift 6 + SwiftUI + SwiftData foundation ready
**AI Integration**: 12 BMAD agents configured for specialized workflows
**Platform Support**: Complete Apple ecosystem implementation ready

## Development Standards

- **Swift 6**: `@MainActor`, `Sendable`, strict concurrency
- **Memory**: Always `[weak self]` in Task closures
- **Performance**: 60fps UI, efficient memory usage, battery optimization
- **Testing**: Comprehensive coverage for all packages

## Architecture Layers

1. **Apps Layer**: Platform-specific SwiftUI applications
2. **Packages Layer**: Shared business logic and UI components
3. **Core Layer**: Data models, services, and business logic
4. **UI Layer**: Design system and reusable components
5. **Features Layer**: Feature-specific modules and workflows
6. **Apple Integration**: Native APIs, App Intents, system integration

## Key Technologies

- **SwiftUI**: Declarative UI across all platforms
- **SwiftData**: Modern data persistence with CloudKit sync
- **App Intents**: Siri and Shortcuts integration
- **WidgetKit**: Home Screen and Control Center widgets
- **Live Activities**: Dynamic Island and Lock Screen integration
- **Focus Filters**: System-wide focus mode integration

## Platform Features

- **iOS/iPadOS**: Complete productivity suite with native iOS features
- **macOS**: Desktop-class experience with native macOS integration
- **visionOS**: Revolutionary spatial computing interface
- **watchOS**: Ambient intelligence and health integration
- **tvOS**: Dashboard visualization and focus displays

## Development Workflow

1. **Context Loading**: Read `CLAUDE.md` first (contains specific instructions)
2. **Agent Selection**: Choose appropriate BMAD agent from `.bmad-core/agents/`
3. **Linear Sync**: Check current issues and agent assignments (if configured)
4. **Development**: Follow Swift 6 + SwiftUI + Apple platform patterns
5. **Testing**: Validate across all supported Apple platforms

## Critical Files to Read

1. **CLAUDE.md** - Complete project instructions (MUST READ)
2. **AI_DEVELOPER_ONBOARDING.md** - Universal AI setup guide
3. **.env** - Development environment configuration
4. **Scripts/setup-developer.sh** - Development environment setup

## Quick Wins for AI Assistants

- Use `.bmad-core/agents/` for specialized development workflows
- Reference Linear issues for current priorities (if configured)
- Follow Swift 6 concurrency patterns for memory safety
- Leverage SwiftUI declarative patterns for UI development
- Apply Apple platform-specific optimizations

## Template Features

- **Zero Configuration**: Works out-of-the-box for any Apple app
- **AI-First Design**: Optimized for AI assistant development
- **Universal Architecture**: Single codebase for all Apple platforms
- **Enterprise-Grade**: Professional development workflows and tooling
- **Extensible**: Easy to customize for specific project needs

## About Lab Obsidian

Lab Obsidian is a creative platform spanning music, technology, and cultural experiences. We build tools and systems that embody brutalist design principles—every decision is deliberate, nothing accidental.

**Contact**: zack@labobsidian.com  
**Website**: https://www.labobsidian.com

---

**You're now ready for AI-assisted Apple ecosystem development!**

*Next: Load `CLAUDE.md` for complete project instructions and development guidelines.*

*Built with [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template) - The ultimate Apple app development template.*