# CLAUDE.md

**IMPORTANT**: This is a template project created with Lab Obsidian Genesis Template. Update this file with your specific project details after running `init-new-project.sh`.

## Project Overview

YourProjectName is a modern Apple ecosystem application built with Swift 6, SwiftUI, and enterprise-grade development workflows. This project leverages the BMAD Method for AI-driven development and comprehensive automation.

**Bundle ID**: com.labobsidian.yourprojectname  
**Platforms**: iOS, iPadOS, macOS, watchOS, tvOS, visionOS  
**Development Team**: YOUR_TEAM_ID  
**Template**: [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template)

## Linear Development Operations

**Team ID**: your-linear-team-id  
**Project Management**: Complete BMAD-Linear integration for AI-driven project management

## Build System

**Project Generation**: `./Scripts/generate-workspace.sh` or `cd Projects/YourProjectName-iOS && xcodegen generate`  
**Building**: `./Scripts/build-workspace.sh` or `open YourProjectName.xcworkspace`  
**Testing**: `swift test` in package directories or full workspace testing via xcodebuild

## Architecture Overview

### Core Packages
- **YourProjectCore** - Core business logic, data models, and services
- **YourProjectUI** - Shared UI components, design system, and platform adaptations
- **YourProjectFeatures** - Feature-specific modules and workflows

### Platform Applications
- **YourProjectName-iOS** - iPhone and iPad application
- **YourProjectName-macOS** - macOS desktop application
- **YourProjectName-visionOS** - Vision Pro spatial computing application
- **YourProjectName-watchOS** - Apple Watch application
- **YourProjectName-tvOS** - Apple TV application

### Key Technologies
- **SwiftUI** - Declarative UI framework for all platforms
- **SwiftData** - Modern data persistence with CloudKit sync
- **App Intents** - Siri and Shortcuts integration
- **WidgetKit** - Home Screen and Control Center widgets
- **Live Activities** - Dynamic Island and Lock Screen integration

## Development Guidelines

### Critical Requirements
**Memory Management**: ALWAYS use `[weak self]` in ViewModel Task closures to prevent leaks  
**Swift 6**: `@MainActor` for ViewModels, `Sendable` conformance, actor-based concurrency  
**SwiftData**: Use `@Query` in views, pagination for large datasets, relationship caching

### Key Integrations
**Apple Integration**: App Intents, Siri/Shortcuts, Live Activities, Spotlight  
**Platform Optimization**: iOS (touch), macOS (desktop), visionOS (spatial), watchOS (ambient), tvOS (focus)  
**Testing**: Unit tests for core logic, UI tests for workflows, performance monitoring

### Code Quality Standards
- **Swift 6**: Strict concurrency and memory safety
- **SwiftUI**: Declarative UI with modern patterns
- **Performance**: 60fps UI, efficient memory usage, battery optimization
- **Accessibility**: Full VoiceOver and accessibility support

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
Use `.bmad-core/agent-teams/team-enhanced.yaml` for comprehensive development with all agents.

## Development Workflow

### Setup Process
1. **Project Initialization**: Run `./init-new-project.sh` (if using template)
2. **Environment Setup**: Run `./Scripts/setup-developer.sh`
3. **Workspace Generation**: Run `./Scripts/generate-workspace.sh`
4. **Open Project**: `open YourProjectName.xcworkspace`
5. **Configure Signing**: Set team and bundle IDs in Xcode
6. **Build & Test**: Connect device and build for testing

### AI-Assisted Development
1. **Context Loading**: Read `AI_CONTEXT_SUMMARY.md` for project overview
2. **Agent Selection**: Choose appropriate agent from `.bmad-core/agents/`
3. **Linear Integration**: Check current issues and assignments (if configured)
4. **Development**: Follow Swift 6 and SwiftUI best practices

### Platform-Specific Development
- **iOS/iPadOS**: Focus on touch interactions, Live Activities, Focus Filters
- **macOS**: Implement menu bar, window management, desktop-class features
- **visionOS**: Design for spatial computing, hand tracking, immersive experiences
- **watchOS**: Optimize for glances, complications, health integration
- **tvOS**: Implement focus engine navigation, remote control support

## Package Structure

### YourProjectCore
```swift
// Core business logic and data management
YourProjectCoreManager          // Central coordination
SampleDataModel               // Example data model (replace with your models)
SampleService                 // Example service (replace with your services)
YourProjectError              // Centralized error handling
```

### YourProjectUI
```swift
// Shared UI components and design system
YourProjectDesignSystem       // Colors, typography, spacing
YourProjectButton            // Primary button component
YourProjectCard              // Card container component
YourProjectLoadingView       // Loading indicator
YourProjectErrorView         // Error display component
```

### YourProjectFeatures
```swift
// Feature-specific modules
// TODO: Add your feature modules here
// Example: UserManagement, ContentCreation, Analytics, etc.
```

## Environment Configuration

### Required Settings (.env file)
```bash
# Project Information
PROJECT_NAME="YourProjectName"
BUNDLE_ID_PREFIX="com.labobsidian"

# Apple Developer Configuration
DEVELOPMENT_TEAM="YOUR_TEAM_ID"
BUNDLE_IDENTIFIER="com.labobsidian.yourprojectname"

# CloudKit Configuration (optional)
CLOUDKIT_CONTAINER="iCloud.com.labobsidian.yourprojectname"

# Linear Integration (optional)
LINEAR_TEAM_ID="your-team-id"
LINEAR_API_KEY="your-api-key"

# GitHub Configuration
GITHUB_USERNAME="labobsidian"
GITHUB_REPOSITORY="labobsidian/yourprojectname"
```

## Quality Standards

### Performance Standards
- **Build Time**: Fast incremental builds with modular architecture
- **Memory Usage**: Efficient memory management with ARC
- **Battery Life**: Optimized for all Apple platforms
- **Accessibility**: Full VoiceOver and accessibility support

### Testing Strategy
- **Unit Tests**: Comprehensive coverage for YourProjectCore
- **UI Tests**: Critical user flows across all platforms
- **Integration Tests**: Cross-package functionality
- **Performance Tests**: Memory usage and rendering performance

## Deployment

### Development
```bash
# Build for development
./Scripts/build-workspace.sh --development

# Deploy to device
./Scripts/deploy-to-device.sh
```

### Production
```bash
# Build for production
./Scripts/build-workspace.sh --production

# Deploy to App Store Connect
./Scripts/deploy-to-appstore.sh
```

## AI Development Notes

### For AI Assistants
- **Start Here**: Always read `AI_CONTEXT_SUMMARY.md` first
- **Agent System**: Use `.bmad-core/agents/` for specialized workflows
- **Context Management**: Prefer package-focused development over cross-package changes
- **Platform Awareness**: Consider target platform when making UI/UX decisions

### Common AI Workflows
1. **Feature Development**: Use `dev` agent for implementation
2. **Architecture Planning**: Use `architect` agent for system design
3. **Testing**: Use `qa` agent for comprehensive testing
4. **UI/UX**: Use `ux-expert` agent for design decisions

## Project Customization

### Adding New Features
1. Create feature module in `Packages/YourProjectFeatures/`
2. Define public API in package manifest
3. Implement UI components in `YourProjectUI` if reusable
4. Add platform-specific integration in relevant `Apps/` directories

### Extending BMAD Agents
1. Customize existing agents in `.bmad-core/agents/`
2. Create new agent teams in `.bmad-core/agent-teams/`
3. Add custom tasks and templates in respective directories

## Support and Resources

### Documentation
- **AI Development**: `AI_DEVELOPER_ONBOARDING.md`
- **Human Setup**: `DEVELOPER_SETUP.md`
- **Architecture**: `Documentation/Architecture.md`
- **Template Source**: [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template)

### Troubleshooting
- **Build Issues**: Check Apple Developer Team ID in `.env`
- **Workspace Issues**: Run `./Scripts/generate-workspace.sh`
- **Agent Issues**: Each agent in `.bmad-core/agents/` is self-contained
- **Linear Issues**: Verify API key configuration in `.env`

## About Lab Obsidian

Lab Obsidian is a creative platform spanning music, technology, and cultural experiences. We build tools and systems that embody brutalist design principles—every decision is deliberate, nothing accidental.

**Contact**: zack@labobsidian.com  
**Website**: https://www.labobsidian.com

---

**YourProjectName represents modern Apple ecosystem development with AI-driven workflows, comprehensive automation, and enterprise-grade quality standards.**

*Built with [Lab Obsidian Genesis Template](https://github.com/labobsidian/lab-obsidian-genesis-template) - The ultimate Apple app development template.*