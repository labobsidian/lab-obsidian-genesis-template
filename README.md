# Lab Obsidian Genesis Template

World-class, Apple-native project scaffolding—driven by brutalist clarity and radical honesty.

Every workflow, doc, and integration is designed to cut through noise and empower the next generation of creators, developers, and innovators.

**For more, visit: https://www.labobsidian.com**

## Built on the BMAD Method

This template is powered by the revolutionary **BMAD Method** (Breakthrough Method for Agile AI-Driven Development) created by [Brian (BMad)](https://github.com/bmadcode). 

Brian's groundbreaking work in agentic AI development has transformed how we approach software engineering. His [BMAD Method framework](https://github.com/bmadcode/BMAD-METHOD) introduces specialized AI agents that eliminate planning inconsistency and context loss—a paradigm shift that makes complex project development both systematic and creative.

**What makes Brian's work extraordinary:**
- **Agentic Planning**: Dedicated AI agents (Analyst, PM, Architect) create hyper-detailed project specifications
- **Context-Engineered Development**: Transforms abstract ideas into executable development stories
- **Universal Application**: Works across software, creative writing, business strategy, and beyond
- **Human-in-the-Loop Excellence**: Balances AI capabilities with human insight and creativity

Lab Obsidian has adapted Brian's methodology specifically for Apple ecosystem development, adding our brutalist design philosophy and creative platform integration. We're honored to build upon such innovative foundational work.

**Explore the original:** [BMAD Method Repository](https://github.com/bmadcode/BMAD-METHOD) | [Brian's Work](https://github.com/bmadcode) | [BMadCode on YouTube](https://www.youtube.com/@BMadCode)

## Features

- **Complete Apple Ecosystem**: iOS, iPadOS, macOS, watchOS, tvOS, visionOS support
- **AI-First Development**: Claude Code, Gemini CLI, ChatGPT Codex compatibility
- **BMAD Method Integration**: 12 specialized AI agents with Linear sync
- **Zero Configuration**: Works out-of-the-box with minimal setup
- **Automated Project Management**: Linear workspace integration with agent assignment
- **Enterprise-Grade Tooling**: CI/CD, monitoring, deployment automation
- **Comprehensive Documentation**: AI-ready guides for humans and assistants

## Quick Start

### 1. Initialize New Project
```bash
# Clone the template
git clone https://github.com/labobsidian/lab-obsidian-genesis-template.git MyAwesomeApp
cd MyAwesomeApp

# Run the initialization script
./init-new-project.sh
```

### 2. Follow the Interactive Setup
The script will ask for:
- **Project Name**: Your app's name (e.g., "MyAwesome App")
- **Bundle ID Prefix**: Your reverse domain (e.g., "com.labobsidian")
- **Linear Team ID**: Your Linear workspace team ID
- **Apple Developer Team**: Your Apple Developer Team ID

### 3. Start Development
```bash
# Set up development environment
./Scripts/setup-developer.sh

# Generate Xcode workspace
./Scripts/generate-workspace.sh

# Open in Xcode
open YourProjectName.xcworkspace
```

## AI-Assisted Development

### For AI Assistants
1. **Load Context**: Read `AI_CONTEXT_SUMMARY.md` for quick project understanding
2. **Read Instructions**: Load `CLAUDE.md` for complete project guidelines
3. **Explore BMAD**: Use `.bmad-core/agents/` for specialized workflows
4. **Linear Integration**: Check current issues and agent assignments

### Quick AI Setup
```bash
# Essential context files
cat AI_CONTEXT_SUMMARY.md        # Project overview
cat CLAUDE.md                    # Detailed instructions
ls -la .bmad-core/agents/        # Available AI agents
```

## Template Structure

```
lab-obsidian-genesis-template/
├── init-new-project.sh          # Project initialization script
├── Apps/                        # Platform-specific applications
│   ├── YourProjectName-iOS/     # iPhone & iPad app
│   ├── YourProjectName-macOS/   # macOS app
│   └── YourProjectName-*/       # Other platforms
├── Packages/                    # Shared Swift packages
│   ├── YourProjectCore/         # Core business logic
│   ├── YourProjectUI/           # Shared UI components
│   └── YourProjectFeatures/     # Feature modules
├── Scripts/                     # Development automation
│   ├── setup-developer.sh      # Development environment setup
│   ├── generate-workspace.sh   # Xcode workspace generation
│   └── build-workspace.sh      # Build automation
├── .bmad-core/                  # BMAD Method integration
│   ├── agents/                  # 12 specialized AI agents
│   ├── integration/             # Linear sync system
│   └── templates/               # Project templates
├── .github/                     # GitHub workflows
│   └── workflows/               # CI/CD automation
├── Documentation/               # Project documentation
├── AI_DEVELOPER_ONBOARDING.md  # AI assistant guide
├── AI_CONTEXT_SUMMARY.md       # Quick AI context
├── DEVELOPER_SETUP.md          # Human developer guide
└── CLAUDE.md                   # Project instructions
```

## BMAD Method Integration

### 12 Specialized AI Agents
- **bmad-orchestrator**: Project coordination and workflow management
- **dev**: Development specialist with Swift/SwiftUI expertise
- **architect**: System architecture and technical decisions
- **qa**: Quality assurance and testing specialist
- **pm**: Product management and stakeholder coordination
- **ux-expert**: User experience design and interaction patterns
- **analyst**: Data analysis and business intelligence
- **po**: Product owner and requirement management
- **sm**: Scrum master and process optimization
- **infra-devops-platform**: Infrastructure and deployment
- **bmad-the-creator**: Framework extension and tooling
- **bmad-master**: Meta-orchestration and quality control

### Agent Teams
```bash
# View available agent teams
ls .bmad-core/agent-teams/

# Use full team for comprehensive development
cat .bmad-core/agent-teams/team-enhanced.yaml
```

## Linear Workspace Integration

### Automated Project Management
- **Bidirectional Sync**: BMAD stories ↔ Linear issues
- **Agent Assignment**: Issues automatically assigned to specialized agents
- **Workflow Automation**: Status updates and progress tracking
- **Performance Metrics**: Real-time monitoring and analytics

### Setup Linear Integration
```bash
# Configure Linear workspace
export LINEAR_TEAM_ID="your-team-id"
export LINEAR_API_KEY="your-api-key"

# Run Linear integration setup
node .bmad-core/integration/setup-linear-workspace.js
```

## Development Workflow

### 1. Project Setup
```bash
# Initialize new project
./init-new-project.sh

# Set up development environment
./Scripts/setup-developer.sh
```

### 2. Architecture Planning
```bash
# Activate architect agent
cat .bmad-core/agents/architect.md

# Create architecture documentation
./Scripts/generate-architecture-docs.sh
```

### 3. Development Process
```bash
# Start development with AI assistance
cat .bmad-core/agents/dev.md

# Build and test
./Scripts/build-workspace.sh
./Scripts/run-tests.sh
```

### 4. Quality Assurance
```bash
# Activate QA agent
cat .bmad-core/agents/qa.md

# Run comprehensive testing
./Scripts/run-full-test-suite.sh
```

## Platform Support

### iOS/iPadOS
- **SwiftUI** declarative interface
- **App Intents** for Siri integration
- **Live Activities** for Dynamic Island
- **Focus Filters** for system integration

### macOS
- **Native macOS** experience
- **Menu bar** integration
- **Dock** and **Notification Center**
- **System settings** integration

### visionOS
- **Spatial computing** interface
- **Hand tracking** and gestures
- **3D visualization** capabilities
- **Immersive experiences**

### watchOS
- **Complications** and widgets
- **Digital Crown** interaction
- **Health integration**
- **Workout tracking**

### tvOS
- **Focus engine** navigation
- **Remote control** support
- **Big screen** optimization
- **Multi-user** support

## Customization

### Project Configuration
Edit `project-config.yaml`:
```yaml
project:
  name: "YourProjectName"
  bundleIdPrefix: "com.labobsidian"
  platforms: ["iOS", "macOS", "visionOS"]
  
bmad:
  agents: ["dev", "architect", "qa", "pm"]
  linear:
    teamId: "your-team-id"
    
apple:
  developmentTeam: "YOUR_TEAM_ID"
```

### Agent Customization
```bash
# Customize agent behavior
edit .bmad-core/agents/dev.md

# Create custom agent teams
cp .bmad-core/agent-teams/team-enhanced.yaml .bmad-core/agent-teams/team-custom.yaml
```

## Documentation

### Essential Reading
1. **`AI_DEVELOPER_ONBOARDING.md`** - AI assistant setup guide
2. **`AI_CONTEXT_SUMMARY.md`** - Quick project context
3. **`DEVELOPER_SETUP.md`** - Human developer guide
4. **`CLAUDE.md`** - Project-specific instructions

### Advanced Guides
- **`Documentation/Architecture.md`** - System architecture
- **`Documentation/Deployment.md`** - Deployment strategies
- **`Documentation/Testing.md`** - Testing methodologies
- **`Documentation/AI-Integration.md`** - AI development patterns

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

# Deploy to App Store
./Scripts/deploy-to-appstore.sh
```

### CI/CD
GitHub Actions automatically:
- **Build** on every push
- **Test** all platforms
- **Deploy** to TestFlight
- **Sync** with Linear workspace

## Contributing

### For Template Contributors
1. Fork the repository
2. Create feature branch
3. Test with multiple project types
4. Submit PR with comprehensive testing

### For Project Users
1. Report issues in your project's repository
2. Share improvements back to template
3. Contribute to documentation
4. Help improve AI integration

## License

MIT License - see `LICENSE` file for details.

## About Lab Obsidian

Lab Obsidian is a creative platform spanning music, technology, and cultural experiences. We build tools and systems that embody brutalist design principles—every decision is deliberate, nothing accidental. Our approach cuts through noise with clarity, emotional resonance, and cultural force.

**Contact**: zack@labobsidian.com  
**Website**: https://www.labobsidian.com

## Legal & Attribution

Lab Obsidian ensures comprehensive legal compliance while building upon great open source work. This template respects all intellectual property rights and provides enterprise-grade legal protection.

### Apple Platform Attribution

iOS, iPadOS, macOS, watchOS, tvOS, and visionOS are trademarks of Apple Inc., registered in the U.S. and other countries and regions.

This template enables development for Apple platforms but is not affiliated with, endorsed by, or sponsored by Apple Inc. Swift is open source under Apache 2.0 License with Runtime Library Exception. SwiftUI is proprietary technology of Apple Inc.

### Third-Party Tools & Libraries

**BMAD Method**: Built upon the revolutionary BMAD Method framework by [Brian (BMad)](https://github.com/bmadcode) under MIT License.  
**Linear SDK**: Linear API integration uses Linear SDK under MIT License. Copyright (c) 2019 Linear.  
**XcodeGen**: XcodeGen integration under MIT License by Yonas Kolb.  
**GitHub**: Template repository functionality provided by GitHub.

### Development Tools Disclaimer

This template uses but does not include or distribute Apple development tools. Xcode, Apple Developer Account, and platform SDKs are required separately and subject to Apple's terms.

### Warranty & Liability

This template is provided "AS IS" under the MIT License, without warranty of any kind. Lab Obsidian handles the legal complexity so you can focus on creating. See the `LICENSE` file for complete terms.

### Usage Guidelines

This template is designed for Apple platform development and respects all third-party intellectual property rights. Users are responsible for compliance with the Apple Developer Program License Agreement and all applicable terms of service for integrated tools and platforms.

---

**Welcome to the future of Apple app development.**

*This template represents the cutting edge of AI-assisted development with enterprise-grade workflows and comprehensive automation.*