/**
 * BMAD-Linear Integration System (Template Version)
 * Provides bidirectional synchronization between BMAD stories and Linear issues
 * with automated agent tracking and issue completion
 * 
 * TEMPLATE NOTE: This is a generalized version for any project.
 * The init-new-project.sh script will configure project-specific settings.
 */

const fs = require('fs');
const path = require('path');
const yaml = require('yaml');

class BMADLinearSync {
    constructor() {
        this.config = this.loadConfig();
        this.storyDirectory = path.join(process.cwd(), 'docs/stories');
        this.agentDirectory = path.join(process.cwd(), '.bmad-core/agents');
        this.debugLogDirectory = path.join(process.cwd(), '.bmad-core/debug');
        
        // Linear configuration - will be updated by init-new-project.sh
        this.linear = {
            teamId: "your-linear-team-id",  // TEMPLATE: Replace with actual team ID
            cycleId: null,  // Will be set dynamically
            apiKey: process.env.LINEAR_API_KEY,
            projects: {
                bmadStories: null,    // Will be set after project creation
                bmadEpics: null,
                bmadAgents: null,
                bmadMilestones: null
            },
            states: {
                todo: null,      // Will be set after state creation
                inProgress: null,
                done: null,
                inReview: null,
                blocked: null
            }
        };
        
        // Universal agent mapping - compatible with all BMAD templates
        this.agentMapping = {
            'bmad-orchestrator': 'BMAD Orchestrator',
            'dev': 'Development Agent',
            'architect': 'Architecture Agent',
            'qa': 'Quality Assurance Agent',
            'pm': 'Product Manager Agent',
            'ux-expert': 'UX Expert Agent',
            'analyst': 'Data Analyst Agent',
            'po': 'Product Owner Agent',
            'sm': 'Scrum Master Agent',
            'infra-devops-platform': 'Infrastructure Agent',
            'bmad-the-creator': 'Creator Agent',
            'bmad-master': 'BMAD Master Agent'
        };
        
        this.init();
    }
    
    loadConfig() {
        const configPath = path.join(process.cwd(), '.bmad-core/core-config.yaml');
        try {
            const configFile = fs.readFileSync(configPath, 'utf8');
            return yaml.parse(configFile);
        } catch (error) {
            console.error('Failed to load BMAD config:', error);
            return {
                version: '4.29.0',
                slashPrefix: 'YourProjectName',
                devStoryLocation: 'docs/stories'
            };
        }
    }
    
    async init() {
        if (!this.linear.apiKey) {
            console.warn('LINEAR_API_KEY not set. Linear integration will be disabled.');
            return;
        }
        
        try {
            await this.setupLinearWorkspace();
            await this.syncExistingStories();
            console.log('BMAD-Linear sync initialized successfully');
        } catch (error) {
            console.error('Failed to initialize BMAD-Linear sync:', error);
        }
    }
    
    async setupLinearWorkspace() {
        console.log('Setting up Linear workspace...');
        
        // Create BMAD projects in Linear
        const projects = await this.createLinearProjects();
        this.linear.projects = projects;
        
        // Create or update workflow states
        const states = await this.createLinearStates();
        this.linear.states = states;
        
        // Set current cycle
        this.linear.cycleId = await this.getCurrentCycle();
        
        console.log('Linear workspace setup complete');
    }
    
    async createLinearProjects() {
        const projectNames = [
            'BMAD Development Stories',
            'BMAD Epic Management', 
            'BMAD Agent Activity',
            'BMAD Milestone Tracking'
        ];
        
        const projects = {};
        
        for (const name of projectNames) {
            try {
                const project = await this.createLinearProject(name);
                const key = name.toLowerCase().replace(/[^a-z]+/g, '');
                projects[key] = project.id;
                console.log(`Created Linear project: ${name}`);
            } catch (error) {
                console.error(`Failed to create project ${name}:`, error);
            }
        }
        
        return projects;
    }
    
    async createLinearProject(name) {
        // TEMPLATE: Implement Linear API integration
        // This would use the Linear GraphQL API to create projects
        return {
            id: `project-${name.toLowerCase().replace(/[^a-z]+/g, '')}-id`,
            name: name
        };
    }
    
    async createLinearStates() {
        const stateNames = [
            { name: 'Todo', type: 'unstarted' },
            { name: 'In Progress', type: 'started' },
            { name: 'In Review', type: 'started' },
            { name: 'Done', type: 'completed' },
            { name: 'Blocked', type: 'started' }
        ];
        
        const states = {};
        
        for (const state of stateNames) {
            try {
                const stateResult = await this.createLinearState(state);
                const key = state.name.toLowerCase().replace(/[^a-z]+/g, '');
                states[key] = stateResult.id;
                console.log(`Created Linear state: ${state.name}`);
            } catch (error) {
                console.error(`Failed to create state ${state.name}:`, error);
            }
        }
        
        return states;
    }
    
    async createLinearState(state) {
        // TEMPLATE: Implement Linear API integration
        return {
            id: `state-${state.name.toLowerCase().replace(/[^a-z]+/g, '')}-id`,
            name: state.name,
            type: state.type
        };
    }
    
    async getCurrentCycle() {
        // TEMPLATE: Implement Linear API integration to get current cycle
        return `cycle-${new Date().getFullYear()}-${new Date().getMonth() + 1}`;
    }
    
    async syncExistingStories() {
        console.log('Syncing existing BMAD stories with Linear...');
        
        if (!fs.existsSync(this.storyDirectory)) {
            console.log('No story directory found, skipping sync');
            return;
        }
        
        const storyFiles = fs.readdirSync(this.storyDirectory)
            .filter(file => file.endsWith('.md'));
        
        for (const file of storyFiles) {
            try {
                await this.syncStoryToLinear(file);
            } catch (error) {
                console.error(`Failed to sync story ${file}:`, error);
            }
        }
        
        console.log(`Synced ${storyFiles.length} stories to Linear`);
    }
    
    async syncStoryToLinear(storyFile) {
        const storyPath = path.join(this.storyDirectory, storyFile);
        const storyContent = fs.readFileSync(storyPath, 'utf8');
        
        // Parse story metadata
        const story = this.parseStoryMetadata(storyContent);
        
        if (!story) {
            console.warn(`Could not parse story: ${storyFile}`);
            return;
        }
        
        // Create or update Linear issue
        const issue = await this.createLinearIssue(story);
        
        // Update story with Linear issue ID
        this.updateStoryWithLinearId(storyPath, issue.id);
        
        console.log(`Synced story ${story.title} to Linear issue ${issue.id}`);
    }
    
    parseStoryMetadata(content) {
        const lines = content.split('\n');
        const story = {};
        
        // Extract title from first heading
        const titleMatch = lines.find(line => line.startsWith('# '));
        if (titleMatch) {
            story.title = titleMatch.substring(2).trim();
        }
        
        // Extract story metadata
        const metadataStart = lines.findIndex(line => line.includes('## Story Metadata'));
        if (metadataStart !== -1) {
            const metadataLines = lines.slice(metadataStart + 1, metadataStart + 10);
            
            for (const line of metadataLines) {
                if (line.includes('**Priority:**')) {
                    story.priority = line.split('**Priority:**')[1].trim();
                }
                if (line.includes('**Agent:**')) {
                    story.agent = line.split('**Agent:**')[1].trim();
                }
                if (line.includes('**Status:**')) {
                    story.status = line.split('**Status:**')[1].trim();
                }
            }
        }
        
        return story.title ? story : null;
    }
    
    async createLinearIssue(story) {
        // TEMPLATE: Implement Linear API integration
        return {
            id: `issue-${Date.now()}`,
            title: story.title,
            state: this.mapStatusToLinearState(story.status),
            assignee: this.mapAgentToLinearUser(story.agent),
            project: this.linear.projects.bmadstories
        };
    }
    
    mapStatusToLinearState(status) {
        const statusMap = {
            'draft': this.linear.states.todo,
            'ready': this.linear.states.todo,
            'in_progress': this.linear.states.inprogress,
            'review': this.linear.states.inreview,
            'done': this.linear.states.done,
            'blocked': this.linear.states.blocked
        };
        
        return statusMap[status] || this.linear.states.todo;
    }
    
    mapAgentToLinearUser(agent) {
        // TEMPLATE: Map agents to Linear users
        // This would typically map to actual user IDs in Linear
        return this.agentMapping[agent] || null;
    }
    
    updateStoryWithLinearId(storyPath, issueId) {
        let content = fs.readFileSync(storyPath, 'utf8');
        
        // Add Linear issue ID to story metadata
        const linearIdLine = `**Linear Issue:** [${issueId}](https://linear.app/your-workspace/issue/${issueId})\n`;
        
        const metadataStart = content.indexOf('## Story Metadata');
        if (metadataStart !== -1) {
            const metadataEnd = content.indexOf('\n## ', metadataStart + 1);
            const beforeMetadata = content.substring(0, metadataStart);
            const afterMetadata = content.substring(metadataEnd);
            
            content = beforeMetadata + 
                     '## Story Metadata\n\n' + 
                     linearIdLine + 
                     afterMetadata;
        }
        
        fs.writeFileSync(storyPath, content);
    }
    
    // Agent activity tracking
    async trackAgentActivity(agentId, activity) {
        const timestamp = new Date().toISOString();
        const logEntry = {
            agent: agentId,
            activity: activity,
            timestamp: timestamp
        };
        
        // Log to debug directory
        const debugPath = path.join(this.debugLogDirectory, `agent-activity-${agentId}.log`);
        fs.appendFileSync(debugPath, JSON.stringify(logEntry) + '\n');
        
        // Sync to Linear if configured
        if (this.linear.apiKey) {
            await this.syncAgentActivityToLinear(logEntry);
        }
    }
    
    async syncAgentActivityToLinear(logEntry) {
        // TEMPLATE: Implement Linear API integration for agent activity
        console.log(`Agent activity: ${logEntry.agent} - ${logEntry.activity}`);
    }
    
    // Auto-completion detection
    async checkStoryCompletion(storyPath) {
        const content = fs.readFileSync(storyPath, 'utf8');
        const story = this.parseStoryMetadata(content);
        
        if (!story) return false;
        
        // Check completion criteria
        const isComplete = this.evaluateCompletionCriteria(content);
        
        if (isComplete && story.status !== 'done') {
            await this.markStoryComplete(storyPath, story);
            return true;
        }
        
        return false;
    }
    
    evaluateCompletionCriteria(content) {
        // TEMPLATE: Implement completion criteria checking
        // This would check for:
        // - All dev agent checkboxes completed
        // - Tests passing
        // - Code review approved
        // - Documentation updated
        
        const devSectionMatch = content.match(/## Dev Agent Record([\s\S]*?)(?=##|$)/);
        if (!devSectionMatch) return false;
        
        const devSection = devSectionMatch[1];
        const checkboxes = devSection.match(/- \[[ x]\]/g) || [];
        const completedCheckboxes = devSection.match(/- \[x\]/g) || [];
        
        return checkboxes.length > 0 && completedCheckboxes.length === checkboxes.length;
    }
    
    async markStoryComplete(storyPath, story) {
        // Update story status
        let content = fs.readFileSync(storyPath, 'utf8');
        content = content.replace(
            /(\*\*Status:\*\*)\s*\w+/,
            '$1 done'
        );
        
        // Add completion timestamp
        const completionNote = `\n\n**Completed:** ${new Date().toISOString()}\n`;
        content += completionNote;
        
        fs.writeFileSync(storyPath, content);
        
        // Sync to Linear
        if (this.linear.apiKey) {
            await this.updateLinearIssueStatus(story.linearId, 'done');
        }
        
        console.log(`Story completed: ${story.title}`);
    }
    
    async updateLinearIssueStatus(issueId, status) {
        // TEMPLATE: Implement Linear API integration
        console.log(`Updated Linear issue ${issueId} to status: ${status}`);
    }
    
    // Performance monitoring
    generatePerformanceReport() {
        const report = {
            timestamp: new Date().toISOString(),
            agentActivity: this.getAgentActivitySummary(),
            storyMetrics: this.getStoryMetrics(),
            systemHealth: this.getSystemHealth()
        };
        
        const reportPath = path.join(this.debugLogDirectory, 'performance-report.json');
        fs.writeFileSync(reportPath, JSON.stringify(report, null, 2));
        
        return report;
    }
    
    getAgentActivitySummary() {
        // TEMPLATE: Implement agent activity analysis
        return {
            totalAgents: Object.keys(this.agentMapping).length,
            activeAgents: 0,
            averageResponseTime: 0
        };
    }
    
    getStoryMetrics() {
        // TEMPLATE: Implement story metrics
        return {
            totalStories: 0,
            completedStories: 0,
            averageCompletionTime: 0,
            velocity: 0
        };
    }
    
    getSystemHealth() {
        return {
            linearConnected: !!this.linear.apiKey,
            storiesDirectory: fs.existsSync(this.storyDirectory),
            agentsDirectory: fs.existsSync(this.agentDirectory),
            debugDirectory: fs.existsSync(this.debugLogDirectory)
        };
    }
}

// Export for use in other modules
module.exports = BMADLinearSync;

// CLI usage
if (require.main === module) {
    const sync = new BMADLinearSync();
    
    // Handle command line arguments
    const args = process.argv.slice(2);
    
    if (args.includes('--setup')) {
        console.log('Setting up Linear workspace...');
        sync.setupLinearWorkspace();
    } else if (args.includes('--sync')) {
        console.log('Syncing stories to Linear...');
        sync.syncExistingStories();
    } else if (args.includes('--report')) {
        console.log('Generating performance report...');
        const report = sync.generatePerformanceReport();
        console.log(JSON.stringify(report, null, 2));
    } else {
        console.log('BMAD-Linear Sync Template');
        console.log('Usage:');
        console.log('  node bmad-linear-sync.js --setup   # Set up Linear workspace');
        console.log('  node bmad-linear-sync.js --sync    # Sync existing stories');
        console.log('  node bmad-linear-sync.js --report  # Generate performance report');
    }
}