//
//  CertificateType.swift
//  SideSign
//
//  Created by Magesh K on 11/09/26.
//  Copyright © 2026 SideSign. All rights reserved.
//

import Foundation

public struct CertificateType: RawRepresentable, Sendable, Codable, Equatable, Hashable, CustomStringConvertible, CaseIterable {
    public let rawValue: String

    public enum Category: String, Sendable, Codable {
        case development
        case distribution
    }

    public static let development          = CertificateType(rawValue: "development")
    public static let distribution         = CertificateType(rawValue: "distribution")
    public static let iosDevelopment       = CertificateType(rawValue: "ios-development")
    public static let iosDistribution      = CertificateType(rawValue: "ios-distribution")
    public static let macDevelopment       = CertificateType(rawValue: "mac-development")
    public static let macAppStore          = CertificateType(rawValue: "mac-appstore")
    public static let macInstaller         = CertificateType(rawValue: "mac-installer")
    public static let developerIDInstaller = CertificateType(rawValue: "developer-id-installer")
    public static let developerID          = CertificateType(rawValue: "developer-id")

    public static let allCases: [CertificateType] = [
        .development,
        .distribution,
        .iosDevelopment,
        .iosDistribution,
        .macDevelopment,
        .macAppStore,
        .macInstaller,
        .developerIDInstaller,
        .developerID
    ]

    public static var freeAccountCases: [CertificateType] {
        allCases.filter { $0.isFreeAccountSupported }
    }

    public static var paidOnlyCases: [CertificateType] {
        allCases.filter { $0.isPaidOnly }
    }

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init?(argument: String) {
        switch argument.lowercased() {
        case "development", "dev", "apple development", "apple-development":
            self = .development
        case "distribution", "dist", "apple distribution", "apple-distribution":
            self = .distribution
        case "ios-development", "ios-dev", "ios app development", "ios development", "iphone developer", "iphone-developer":
            self = .iosDevelopment
        case "ios-distribution", "ios-dist", "ios distribution", "iphone distribution", "adhoc", "ad-hoc", "ad hoc":
            self = .iosDistribution
        case "mac-development", "mac-dev", "mac development":
            self = .macDevelopment
        case "mac-appstore", "macappstore", "mac app distribution":
            self = .macAppStore
        case "mac-installer", "mac-installer-distribution", "mac installer distribution":
            self = .macInstaller
        case "developer-id-installer", "developeridinstaller", "developer id installer":
            self = .developerIDInstaller
        case "developer-id", "developerid", "developer id application", "developer-id-application":
            self = .developerID
        default:
            return nil
        }
    }

    public var isFreeAccountSupported: Bool {
        switch self {
        case .development, .iosDevelopment, .macDevelopment:
            return true
        default:
            return false
        }
    }

    public var isPaidOnly: Bool {
        !isFreeAccountSupported
    }

    public var category: Category {
        switch self {
        case .development, .iosDevelopment, .macDevelopment:
            return .development
        case .distribution, .iosDistribution, .macAppStore, .macInstaller, .developerID, .developerIDInstaller:
            return .distribution
        default:
            return .development
        }
    }

    public var displayName: String {
        switch self {
        case .development:          return "Apple 开发"
        case .distribution:         return "Apple 分发"
        case .iosDevelopment:       return "iOS App 开发"
        case .iosDistribution:      return "iOS 分发（App Store Connect 和 Ad Hoc）"
        case .macDevelopment:       return "Mac 开发"
        case .macAppStore:          return "Mac App 分发"
        case .macInstaller:         return "Mac 安装器分发"
        case .developerIDInstaller: return "Developer ID 安装器"
        case .developerID:          return "Developer ID 应用"
        default:                    return rawValue.capitalized
        }
    }

    public var description: String {
        rawValue
    }

    public var submitEndpointAction: String {
        switch self.category {
        case .development:  return "ios/submitDevelopmentCSR.action"
        case .distribution: return "ios/submitDistributionCSR.action"
        }
    }
}
