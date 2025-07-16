// YourProjectCore.swift
// Core business logic and data management for YourProjectName

import Foundation
import SwiftData

@MainActor
public final class YourProjectCoreManager: ObservableObject {
    
    public static let shared = YourProjectCoreManager()
    
    @Published public var isInitialized = false
    
    private init() {
        // Private initializer for singleton pattern
    }
    
    public func initialize() async {
        // TODO: Add your core initialization logic here
        // Examples:
        // - Set up data models
        // - Initialize service connections
        // - Configure logging
        // - Load user preferences
        
        await Task { @MainActor in
            self.isInitialized = true
        }.value
    }
}

// MARK: - Core Data Models

/// Base protocol for all data models in your project
public protocol YourProjectModel: Sendable {
    var id: UUID { get }
    var createdAt: Date { get }
    var updatedAt: Date { get }
}

/// Sample data model - replace with your actual models
@Model
public final class SampleDataModel {
    public let id: UUID
    public let createdAt: Date
    public var updatedAt: Date
    public var name: String
    public var isActive: Bool
    
    public init(name: String) {
        self.id = UUID()
        self.createdAt = Date()
        self.updatedAt = Date()
        self.name = name
        self.isActive = true
    }
}

// MARK: - Core Services

/// Base protocol for all services in your project
public protocol YourProjectService: Sendable {
    func start() async throws
    func stop() async throws
    var isRunning: Bool { get }
}

/// Sample service implementation
public actor SampleService: YourProjectService {
    public private(set) var isRunning = false
    
    public init() {}
    
    public func start() async throws {
        // TODO: Add service startup logic
        isRunning = true
    }
    
    public func stop() async throws {
        // TODO: Add service shutdown logic
        isRunning = false
    }
}

// MARK: - Error Handling

public enum YourProjectError: Error, LocalizedError, Sendable {
    case notInitialized
    case serviceUnavailable(String)
    case invalidConfiguration
    case networkError(Error)
    case dataError(Error)
    
    public var errorDescription: String? {
        switch self {
        case .notInitialized:
            return "YourProjectCore is not initialized"
        case .serviceUnavailable(let service):
            return "Service unavailable: \(service)"
        case .invalidConfiguration:
            return "Invalid configuration"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .dataError(let error):
            return "Data error: \(error.localizedDescription)"
        }
    }
}

// MARK: - Utilities

extension YourProjectCoreManager {
    
    /// Get app version information
    public var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }
    
    /// Get build number
    public var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
    }
    
    /// Check if running in debug mode
    public var isDebugBuild: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}