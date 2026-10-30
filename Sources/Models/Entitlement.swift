//
//  Entitlement.swift
//  SideSign
//
//  Created by Magesh K on 30/08/26.
//  Copyright © 2026 SideSign. All rights reserved.
//

import Foundation

public struct Entitlement: RawRepresentable, Hashable, Codable, Sendable, ExpressibleByStringLiteral {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.rawValue = value
    }
}

public extension Entitlement {
    static let appGroups: Entitlement                       = "com.apple.security.application-groups"
    static let keychainAccessGroups: Entitlement            = "keychain-access-groups"
    static let getTaskAllow: Entitlement                    = "get-task-allow"
    static let applicationIdentifier: Entitlement           = "application-identifier"
    static let teamIdentifier: Entitlement                  = "com.apple.developer.team-identifier"

    static let increasedDebuggingMemoryLimit: Entitlement   = "com.apple.developer.kernel.increased-debugging-memory-limit"
    static let increasedMemoryLimit: Entitlement            = "com.apple.developer.kernel.increased-memory-limit"
    static let extendedVirtualAddressing: Entitlement       = "com.apple.developer.kernel.extended-virtual-addressing"

    static let interAppAudio: Entitlement                   = "inter-app-audio"
    static let associatedDomains: Entitlement               = "com.apple.developer.associated-domains"
    static let dataProtection: Entitlement                  = "com.apple.developer.default-data-protection"
    static let siri: Entitlement                            = "com.apple.developer.siri"
    static let applePay: Entitlement                        = "com.apple.developer.in-app-payments"
    static let vpn: Entitlement                             = "com.apple.developer.networking.vpn.api"
    static let networkExtensions: Entitlement               = "com.apple.developer.networking.networkextension"
    static let multipath: Entitlement                       = "com.apple.developer.networking.multipath"
    static let hotspot: Entitlement                         = "com.apple.developer.networking.HotspotConfiguration"
    static let nfc: Entitlement                             = "com.apple.developer.nfc.readersession.formats"
    static let classKit: Entitlement                        = "com.apple.developer.ClassKit-environment"
    static let autoFillCredentialProvider: Entitlement      = "com.apple.developer.authentication-services.autofill-credential-provider"
    static let accessWiFiInformation: Entitlement           = "com.apple.developer.networking.wifi-info"
    static let wirelessAccessoryConfiguration: Entitlement  = "com.apple.external-accessory.wireless-configuration"
    static let pushNotifications: Entitlement               = "aps-environment"
    static let gameCenter: Entitlement                      = "game-center"
    static let inAppPurchase: Entitlement                   = "in-app-purchase"

    static let appleSignIn: Entitlement                     = "com.apple.developer.applesignin"
    static let iCloudServices: Entitlement                  = "com.apple.developer.icloud-services"
    static let iCloudContainerIdentifiers: Entitlement      = "com.apple.developer.icloud-container-identifiers"
    static let ubiquityKeyValueStore: Entitlement           = "com.apple.developer.ubiquity-kvstore-identifier"
    static let healthKit: Entitlement                       = "com.apple.developer.healthkit"
    static let healthKitAccess: Entitlement                 = "com.apple.developer.healthkit.access"
    static let homeKit: Entitlement                         = "com.apple.developer.homekit"
    static let criticalAlerts: Entitlement                  = "com.apple.developer.usernotifications.critical-alerts"
    static let timeSensitiveNotifications: Entitlement      = "com.apple.developer.usernotifications.time-sensitive"
    static let communicationNotifications: Entitlement      = "com.apple.developer.usernotifications.communication"
    static let groupSession: Entitlement                    = "com.apple.developer.group-session"
    static let weatherKit: Entitlement                      = "com.apple.developer.weatherkit"
    static let userFonts: Entitlement                       = "com.apple.developer.user-fonts"
    static let carPlayMaps: Entitlement                     = "com.apple.developer.carplay-maps"
    static let carPlayAudio: Entitlement                    = "com.apple.developer.carplay-audio"
    static let appAttest: Entitlement                       = "com.apple.developer.devicecheck.appattest-environment"

    static let freeEntitlements: Set<Entitlement> = [
        .appGroups,
        .interAppAudio,
        .getTaskAllow,
        .increasedMemoryLimit,
        .increasedDebuggingMemoryLimit,
        .extendedVirtualAddressing,
        .teamIdentifier,
        .keychainAccessGroups,
        .applicationIdentifier
    ]

    static let paidEntitlements: Set<Entitlement> = [
        .appGroups,
        .interAppAudio,
        .getTaskAllow,
        .increasedMemoryLimit,
        .increasedDebuggingMemoryLimit,
        .extendedVirtualAddressing,
        .teamIdentifier,
        .keychainAccessGroups,
        .applicationIdentifier,
        .associatedDomains,
        .dataProtection,
        .siri,
        .applePay,
        .vpn,
        .networkExtensions,
        .multipath,
        .hotspot,
        .nfc,
        .classKit,
        .autoFillCredentialProvider,
        .accessWiFiInformation,
        .wirelessAccessoryConfiguration,
        .pushNotifications,
        .gameCenter,
        .inAppPurchase,
        .appleSignIn,
        .iCloudServices,
        .iCloudContainerIdentifiers,
        .ubiquityKeyValueStore,
        .healthKit,
        .healthKitAccess,
        .homeKit,
        .criticalAlerts,
        .timeSensitiveNotifications,
        .communicationNotifications,
        .groupSession,
        .weatherKit,
        .userFonts,
        .carPlayMaps,
        .carPlayAudio,
        .appAttest
    ]

    static let allKnown: [Entitlement] = [
        .increasedMemoryLimit,
        .extendedVirtualAddressing,
        .increasedDebuggingMemoryLimit,
        .getTaskAllow,
        .appGroups,
        .keychainAccessGroups,
        .interAppAudio,
        .pushNotifications,
        .associatedDomains,
        .appleSignIn,
        .iCloudServices,
        .iCloudContainerIdentifiers,
        .ubiquityKeyValueStore,
        .healthKit,
        .healthKitAccess,
        .homeKit,
        .criticalAlerts,
        .timeSensitiveNotifications,
        .communicationNotifications,
        .groupSession,
        .weatherKit,
        .userFonts,
        .carPlayMaps,
        .carPlayAudio,
        .appAttest,
        .dataProtection,
        .vpn,
        .networkExtensions,
        .siri,
        .applePay,
        .multipath,
        .hotspot,
        .nfc,
        .accessWiFiInformation,
        .wirelessAccessoryConfiguration,
        .gameCenter,
        .inAppPurchase,
        .classKit,
        .autoFillCredentialProvider
    ]

    var displayName: String {
        switch self {
        case .increasedMemoryLimit:             return "提高内存上限"
        case .extendedVirtualAddressing:        return "扩展虚拟寻址"
        case .increasedDebuggingMemoryLimit:    return "提高调试内存上限"
        case .getTaskAllow:                     return "Get-Task-Allow（JIT 调试）"
        case .appGroups:                        return "App 小组"
        case .keychainAccessGroups:             return "钥匙串访问组"
        case .interAppAudio:                    return "应用间音频"
        case .pushNotifications:                return "推送通知"
        case .associatedDomains:                return "关联域"
        case .appleSignIn:                      return "通过 Apple 登录"
        case .iCloudServices:                   return "iCloud 服务"
        case .iCloudContainerIdentifiers:       return "iCloud 容器"
        case .ubiquityKeyValueStore:            return "iCloud 键值存储"
        case .healthKit:                        return "HealthKit"
        case .healthKitAccess:                  return "临床健康记录"
        case .homeKit:                          return "HomeKit"
        case .criticalAlerts:                   return "关键警报"
        case .timeSensitiveNotifications:       return "时效性通知"
        case .communicationNotifications:       return "通信通知"
        case .groupSession:                     return "Group Activities（同播共享）"
        case .weatherKit:                       return "WeatherKit"
        case .userFonts:                        return "字体安装"
        case .carPlayMaps:                      return "CarPlay 导航"
        case .carPlayAudio:                     return "CarPlay 音频"
        case .appAttest:                        return "App Attest"
        case .dataProtection:                   return "数据保护"
        case .vpn:                              return "个人 VPN"
        case .networkExtensions:                return "网络扩展"
        case .siri:                             return "SiriKit"
        case .applePay:                         return "Apple Pay"
        case .multipath:                        return "多路径 TCP"
        case .hotspot:                          return "热点配置"
        case .nfc:                              return "NFC 标签读取"
        case .accessWiFiInformation:            return "访问 Wi-Fi 信息"
        case .wirelessAccessoryConfiguration:   return "无线配件"
        case .gameCenter:                       return "Game Center"
        case .inAppPurchase:                    return "App 内购买"
        case .classKit:                         return "ClassKit"
        case .autoFillCredentialProvider:       return "自动填充凭据提供程序"
        case .applicationIdentifier:            return "应用标识符"
        case .teamIdentifier:                   return "团队标识符"
        default:                                return rawValue
        }
    }

    var summary: String {
        switch self {
        case .increasedMemoryLimit:             return "提高应用的内存分配上限"
        case .extendedVirtualAddressing:        return "启用 64 位虚拟内存地址空间"
        case .increasedDebuggingMemoryLimit:    return "提高调试时的内存上限"
        case .getTaskAllow:                     return "允许附加调试器并启用动态 JIT"
        case .appGroups:                        return "在应用与扩展之间共享数据容器"
        case .keychainAccessGroups:             return "在应用之间共享钥匙串凭据"
        case .interAppAudio:                    return "与其它应用共享实时音频"
        case .pushNotifications:                return "Apple 推送通知服务"
        case .associatedDomains:                return "通用链接与共享网站凭据"
        case .appleSignIn:                      return "使用 Apple ID 验证用户身份"
        case .iCloudServices:                   return "CloudKit 与云文档"
        case .iCloudContainerIdentifiers:       return "CloudKit 容器 ID"
        case .ubiquityKeyValueStore:            return "在用户的各设备之间同步偏好设置"
        case .healthKit:                        return "读写个人健康数据"
        case .healthKitAccess:                  return "访问 FHIR 医疗记录"
        case .homeKit:                          return "与家庭自动化配件通信"
        case .criticalAlerts:                   return "播放声音并绕过勿扰模式"
        case .timeSensitiveNotifications:       return "高优先级即时通知"
        case .communicationNotifications:       return "带头像的通话与信息通知"
        case .groupSession:                     return "通过 FaceTime 同步体验"
        case .weatherKit:                       return "获取全球天气预报与警报"
        case .userFonts:                        return "安装系统级自定义字体"
        case .carPlayMaps:                      return "在 CarPlay 上提供逐向导航"
        case .carPlayAudio:                     return "在 CarPlay 上提供音频播放"
        case .appAttest:                        return "与服务器后端校验应用完整性"
        case .dataProtection:                   return "硬件级文件加密"
        case .vpn:                              return "管理自定义 VPN 连接"
        case .networkExtensions:                return "数据包隧道与内容过滤器"
        case .siri:                             return "处理自定义 Siri 语音意图"
        case .applePay:                         return "使用 Apple Pay 进行应用内支付"
        case .multipath:                        return "合并 Wi-Fi 与蜂窝网络数据流"
        case .hotspot:                          return "配置 Wi-Fi 网络"
        case .nfc:                              return "读取 NFC 标签与 ISO 7816 卡片"
        case .accessWiFiInformation:            return "查询已连接 Wi-Fi 网络的 SSID"
        case .wirelessAccessoryConfiguration:   return "配置 MFi Wi-Fi 配件"
        case .gameCenter:                       return "成就与排行榜"
        case .inAppPurchase:                    return "StoreKit 数字内容购买"
        case .classKit:                         return "教育类应用的学生进度报告"
        case .autoFillCredentialProvider:       return "向系统提供密码与通行密钥"
        case .applicationIdentifier:            return "应用的唯一标识符"
        case .teamIdentifier:                   return "开发者团队标识符"
        default:                                return ""
        }
    }

    var valueType: EntitlementValueType {
        switch self {
        case .appGroups,
             .keychainAccessGroups,
             .associatedDomains,
             .appleSignIn,
             .iCloudServices,
             .iCloudContainerIdentifiers,
             .healthKitAccess,
             .userFonts,
             .networkExtensions,
             .applePay,
             .nfc:
            return .stringArray
        case .pushNotifications,
             .ubiquityKeyValueStore,
             .appAttest,
             .dataProtection,
             .classKit,
             .applicationIdentifier,
             .teamIdentifier:
            return .string
        default:
            return .boolean
        }
    }

    var isFreeAllowed: Bool {
        Self.freeEntitlements.contains(self)
    }

    func defaultTemplate(bundleID: String = "") -> Any {
        switch self {
        case .appGroups:                        return bundleID.isEmpty ? [String]() : ["group.\(bundleID)"]
        case .iCloudContainerIdentifiers:       return bundleID.isEmpty ? [String]() : ["iCloud.\(bundleID)"]
        case .appleSignIn:                      return ["Default"]
        case .iCloudServices:                   return ["CloudKit", "CloudDocuments"]
        case .userFonts:                        return ["app-usage"]
        case .networkExtensions:                return ["packet-tunnel-provider"]
        case .nfc:                              return ["NDEF", "TAG"]
        case .keychainAccessGroups,
             .associatedDomains,
             .healthKitAccess,
             .applePay:                         return [String]()
        case .pushNotifications,
             .appAttest,
             .classKit:                         return "development"
        case .dataProtection:                   return "NSFileProtectionComplete"
        case .ubiquityKeyValueStore:            return bundleID.isEmpty ? "" : "$(TeamIdentifierPrefix)\(bundleID)"
        case .applicationIdentifier:            return bundleID
        case .teamIdentifier:                   return ""
        default:                                return true
        }
    }
}

extension Entitlement: Identifiable {
    public var id: String { rawValue }
    public var name: String { displayName }
}

public enum EntitlementValueType: String, Codable, Sendable, CaseIterable, Identifiable {
    case boolean        = "Boolean"
    case string         = "String"
    case stringArray    = "Array"
    case number         = "Number"

    public var id: String { rawValue }
}
