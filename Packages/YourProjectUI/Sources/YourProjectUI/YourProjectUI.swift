// YourProjectUI.swift
// Shared UI components and design system for YourProjectName

import SwiftUI
import YourProjectCore

// MARK: - Design System

public struct YourProjectDesignSystem {
    
    // MARK: - Colors
    public struct Colors {
        public static let primary = Color.accentColor
        public static let secondary = Color.secondary
        public static let background = Color(UIColor.systemBackground)
        public static let surface = Color(UIColor.secondarySystemBackground)
        public static let onSurface = Color.primary
        public static let success = Color.green
        public static let warning = Color.orange
        public static let error = Color.red
    }
    
    // MARK: - Typography
    public struct Typography {
        public static let largeTitle = Font.largeTitle.weight(.bold)
        public static let title = Font.title.weight(.semibold)
        public static let headline = Font.headline.weight(.medium)
        public static let body = Font.body
        public static let caption = Font.caption
    }
    
    // MARK: - Spacing
    public struct Spacing {
        public static let xs: CGFloat = 4
        public static let sm: CGFloat = 8
        public static let md: CGFloat = 16
        public static let lg: CGFloat = 24
        public static let xl: CGFloat = 32
        public static let xxl: CGFloat = 48
    }
    
    // MARK: - Corner Radius
    public struct CornerRadius {
        public static let small: CGFloat = 8
        public static let medium: CGFloat = 12
        public static let large: CGFloat = 16
        public static let extraLarge: CGFloat = 24
    }
}

// MARK: - Common UI Components

/// Primary button component following design system
public struct YourProjectButton: View {
    let title: String
    let action: () -> Void
    let style: Style
    
    public enum Style {
        case primary, secondary, destructive
        
        var backgroundColor: Color {
            switch self {
            case .primary: return YourProjectDesignSystem.Colors.primary
            case .secondary: return YourProjectDesignSystem.Colors.surface
            case .destructive: return YourProjectDesignSystem.Colors.error
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .primary: return .white
            case .secondary: return YourProjectDesignSystem.Colors.onSurface
            case .destructive: return .white
            }
        }
    }
    
    public init(title: String, style: Style = .primary, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(YourProjectDesignSystem.Typography.headline)
                .foregroundColor(style.foregroundColor)
                .frame(maxWidth: .infinity)
                .padding(.vertical, YourProjectDesignSystem.Spacing.md)
                .padding(.horizontal, YourProjectDesignSystem.Spacing.lg)
                .background(style.backgroundColor)
                .cornerRadius(YourProjectDesignSystem.CornerRadius.medium)
        }
    }
}

/// Card component for content containers
public struct YourProjectCard<Content: View>: View {
    let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        VStack(spacing: YourProjectDesignSystem.Spacing.md) {
            content()
        }
        .padding(YourProjectDesignSystem.Spacing.lg)
        .background(YourProjectDesignSystem.Colors.surface)
        .cornerRadius(YourProjectDesignSystem.CornerRadius.large)
        .shadow(radius: 2, x: 0, y: 1)
    }
}

/// Loading indicator component
public struct YourProjectLoadingView: View {
    let message: String
    
    public init(message: String = "Loading...") {
        self.message = message
    }
    
    public var body: some View {
        VStack(spacing: YourProjectDesignSystem.Spacing.md) {
            ProgressView()
                .scaleEffect(1.2)
            
            Text(message)
                .font(YourProjectDesignSystem.Typography.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(YourProjectDesignSystem.Colors.background)
    }
}

/// Error view component
public struct YourProjectErrorView: View {
    let error: Error
    let retryAction: (() -> Void)?
    
    public init(error: Error, retryAction: (() -> Void)? = nil) {
        self.error = error
        self.retryAction = retryAction
    }
    
    public var body: some View {
        YourProjectCard {
            VStack(spacing: YourProjectDesignSystem.Spacing.md) {
                Image(systemName: "exclamationmark.triangle")
                    .font(.largeTitle)
                    .foregroundColor(YourProjectDesignSystem.Colors.error)
                
                Text("Something went wrong")
                    .font(YourProjectDesignSystem.Typography.headline)
                
                Text(error.localizedDescription)
                    .font(YourProjectDesignSystem.Typography.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                if let retryAction = retryAction {
                    YourProjectButton(title: "Try Again", style: .primary) {
                        retryAction()
                    }
                }
            }
        }
        .padding(YourProjectDesignSystem.Spacing.lg)
    }
}

// MARK: - Platform-Specific Components

#if os(iOS) || os(visionOS)
/// iOS/visionOS specific navigation components
public struct YourProjectNavigationView<Content: View>: View {
    let title: String
    let content: () -> Content
    
    public init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    public var body: some View {
        NavigationView {
            content()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.large)
        }
    }
}
#endif

#if os(macOS)
/// macOS specific window components
public struct YourProjectWindowView<Content: View>: View {
    let title: String
    let content: () -> Content
    
    public init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    public var body: some View {
        content()
            .frame(minWidth: 800, minHeight: 600)
            .navigationTitle(title)
    }
}
#endif

#if os(watchOS)
/// watchOS specific components
public struct YourProjectWatchView<Content: View>: View {
    let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        ScrollView {
            content()
                .padding(.horizontal, YourProjectDesignSystem.Spacing.sm)
        }
    }
}
#endif

// MARK: - View Modifiers

public extension View {
    
    /// Apply standard card styling
    func yourProjectCardStyle() -> some View {
        self
            .padding(YourProjectDesignSystem.Spacing.lg)
            .background(YourProjectDesignSystem.Colors.surface)
            .cornerRadius(YourProjectDesignSystem.CornerRadius.large)
            .shadow(radius: 2, x: 0, y: 1)
    }
    
    /// Apply conditional styling based on platform
    func platformConditional<Content: View>(
        @ViewBuilder content: @escaping (Self) -> Content
    ) -> some View {
        content(self)
    }
}

// MARK: - Preview Helpers

#if DEBUG
public struct YourProjectPreviewHelper {
    
    public static func sampleData() -> [SampleDataModel] {
        [
            SampleDataModel(name: "Sample Item 1"),
            SampleDataModel(name: "Sample Item 2"),
            SampleDataModel(name: "Sample Item 3")
        ]
    }
    
    public static var sampleError: YourProjectError {
        .serviceUnavailable("Preview Service")
    }
}

#Preview("Button Styles") {
    VStack(spacing: YourProjectDesignSystem.Spacing.md) {
        YourProjectButton(title: "Primary Button", style: .primary) {}
        YourProjectButton(title: "Secondary Button", style: .secondary) {}
        YourProjectButton(title: "Destructive Button", style: .destructive) {}
    }
    .padding()
}

#Preview("Card Component") {
    YourProjectCard {
        VStack {
            Text("Card Title")
                .font(YourProjectDesignSystem.Typography.headline)
            Text("This is sample content inside a card component.")
                .font(YourProjectDesignSystem.Typography.body)
        }
    }
    .padding()
}

#Preview("Error View") {
    YourProjectErrorView(error: YourProjectPreviewHelper.sampleError) {
        // Retry action
    }
}
#endif