// YourProjectNameApp.swift
// Main app entry point for iOS

import SwiftUI
import SwiftData
import YourProjectCore
import YourProjectUI

@main
struct YourProjectNameApp: App {
    
    @StateObject private var coreManager = YourProjectCoreManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coreManager)
                .task {
                    await coreManager.initialize()
                }
        }
        .modelContainer(for: SampleDataModel.self)
    }
}

struct ContentView: View {
    @EnvironmentObject private var coreManager: YourProjectCoreManager
    @State private var isShowingSettings = false
    
    var body: some View {
        NavigationView {
            Group {
                if coreManager.isInitialized {
                    MainView()
                } else {
                    YourProjectLoadingView(message: "Initializing YourProjectName...")
                }
            }
            .navigationTitle("YourProjectName")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Settings") {
                        isShowingSettings = true
                    }
                }
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
        }
    }
}

struct MainView: View {
    @Query private var sampleData: [SampleDataModel]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: YourProjectDesignSystem.Spacing.md) {
                
                // Welcome Card
                YourProjectCard {
                    VStack(alignment: .leading, spacing: YourProjectDesignSystem.Spacing.sm) {
                        Text("Welcome to YourProjectName")
                            .font(YourProjectDesignSystem.Typography.title)
                        
                        Text("This is your new Apple ecosystem app built with the Obsidian Genesis Template. Start building your amazing features here!")
                            .font(YourProjectDesignSystem.Typography.body)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Quick Actions
                YourProjectCard {
                    VStack(spacing: YourProjectDesignSystem.Spacing.md) {
                        Text("Quick Actions")
                            .font(YourProjectDesignSystem.Typography.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: YourProjectDesignSystem.Spacing.sm) {
                            YourProjectButton(title: "Add Sample Data", style: .primary) {
                                addSampleData()
                            }
                            
                            YourProjectButton(title: "Clear All Data", style: .destructive) {
                                clearAllData()
                            }
                        }
                    }
                }
                
                // Sample Data List
                if !sampleData.isEmpty {
                    YourProjectCard {
                        VStack(alignment: .leading, spacing: YourProjectDesignSystem.Spacing.md) {
                            Text("Sample Data (\(sampleData.count) items)")
                                .font(YourProjectDesignSystem.Typography.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(sampleData, id: \.id) { item in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(YourProjectDesignSystem.Typography.body)
                                        Text("Created: \(item.createdAt, style: .date)")
                                            .font(YourProjectDesignSystem.Typography.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Circle()
                                        .fill(item.isActive ? YourProjectDesignSystem.Colors.success : YourProjectDesignSystem.Colors.error)
                                        .frame(width: 8, height: 8)
                                }
                                .padding(.vertical, YourProjectDesignSystem.Spacing.xs)
                            }
                        }
                    }
                }
                
                // Development Info
                YourProjectCard {
                    VStack(alignment: .leading, spacing: YourProjectDesignSystem.Spacing.sm) {
                        Text("Development Info")
                            .font(YourProjectDesignSystem.Typography.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: YourProjectDesignSystem.Spacing.xs) {
                            InfoRow(label: "Version", value: YourProjectCoreManager.shared.appVersion)
                            InfoRow(label: "Build", value: YourProjectCoreManager.shared.buildNumber)
                            InfoRow(label: "Debug Mode", value: YourProjectCoreManager.shared.isDebugBuild ? "Yes" : "No")
                            InfoRow(label: "Platform", value: "iOS")
                        }
                    }
                }
            }
            .padding(YourProjectDesignSystem.Spacing.md)
        }
    }
    
    private func addSampleData() {
        let newItem = SampleDataModel(name: "Sample Item \(Date().timeIntervalSince1970)")
        modelContext.insert(newItem)
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save sample data: \(error)")
        }
    }
    
    private func clearAllData() {
        for item in sampleData {
            modelContext.delete(item)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to clear data: \(error)")
        }
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(YourProjectDesignSystem.Typography.caption)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(YourProjectDesignSystem.Typography.caption)
        }
    }
}

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            YourProjectCard {
                VStack(spacing: YourProjectDesignSystem.Spacing.lg) {
                    Text("Settings")
                        .font(YourProjectDesignSystem.Typography.title)
                    
                    Text("Add your app settings here.")
                        .font(YourProjectDesignSystem.Typography.body)
                        .foregroundColor(.secondary)
                    
                    YourProjectButton(title: "Close", style: .secondary) {
                        dismiss()
                    }
                }
            }
            .padding(YourProjectDesignSystem.Spacing.lg)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(YourProjectCoreManager.shared)
        .modelContainer(for: SampleDataModel.self, inMemory: true)
}