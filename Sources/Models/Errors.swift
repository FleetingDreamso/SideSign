//
//  Errors.swift
//  SideSign
//
//  Created by Magesh K on 30/08/26.
//  Copyright © 2026 SideSign. All rights reserved.
//

import Foundation

public enum DeveloperPortalError: Error, LocalizedError, Sendable {
    case unknown(cause: String? = nil)
    case invalidParameters(cause: String)
    case incorrectCredentials(cause: String? = nil)
    case noTeams
    case appSpecificPasswordRequired(cause: String? = nil)
    case invalidDeviceID(String)
    case deviceAlreadyRegistered(cause: String)
    case invalidCertificateRequest(cause: String)
    case certificateDoesNotExist(serial: String)
    case invalidAppIDName(String)
    case invalidBundleIdentifier(String)
    case bundleIdentifierUnavailable(cause: String)
    case appIDDoesNotExist(identifier: String)
    case maximumAppIDLimitReached(cause: String)
    case invalidAppGroup(String)
    case appGroupDoesNotExist(String)
    case invalidProvisioningProfileIdentifier(String)
    case provisioningProfileDoesNotExist(identifier: String)
    case requiresTwoFactorAuthentication
    case userCancelled
    case incorrectVerificationCode(cause: String? = nil)
    case authenticationHandshakeFailed(cause: String)
    case invalidAnisetteData(cause: String)
    case tooManyCertificates(cause: String)
    case tooManyAttempts(cause: String)
    case accountRepairRequired(url: URL?, message: String)
    case invalid2FAResponse(cause: String? = nil)

    public var errorDescription: String? {
        switch self {
        case .unknown(let cause):                               return cause ?? "发生了未知错误。"
        case .invalidParameters(let cause):                     return "提供的参数无效：\(cause)"
        case .incorrectCredentials(let cause):                  return cause ?? "你的 Apple ID 或密码不正确。"
        case .noTeams:                                          return "你尚未加入任何开发者团队。"
        case .appSpecificPasswordRequired(let cause):           return cause ?? "需要应用专用密码。你可以前往 appleid.apple.com 创建。"
        case .invalidDeviceID(let id):                          return "此设备的 UDID 无效：\(id)"
        case .deviceAlreadyRegistered(let cause):               return "此设备已注册：\(cause)"
        case .invalidCertificateRequest(let cause):             return "证书请求无效：\(cause)"
        case .certificateDoesNotExist(let serial):              return "此团队中没有序列号为“\(serial)”的证书。"
        case .invalidAppIDName(let name):                       return "App ID 名称包含无效字符：“\(name)”"
        case .invalidBundleIdentifier(let bundleID):            return "Bundle 标识符无效：“\(bundleID)”"
        case .bundleIdentifierUnavailable(let cause):           return "Bundle 标识符不可用：\(cause)"
        case .appIDDoesNotExist(let id):                        return "此团队中没有标识符为“\(id)”的 App ID。"
        case .maximumAppIDLimitReached(let cause):              return "已达 App ID 数量上限：\(cause)"
        case .invalidAppGroup(let group):                       return "提供的 App 组无效：“\(group)”"
        case .appGroupDoesNotExist(let group):                  return "App 组不存在：“\(group)”"
        case .invalidProvisioningProfileIdentifier(let id):     return "请求的配置文件标识符无效：“\(id)”"
        case .provisioningProfileDoesNotExist(let id):          return "此团队中没有标识符为“\(id)”的配置文件。"
        case .requiresTwoFactorAuthentication:                  return "此账号需要使用双重认证登录。"
        case .userCancelled:                                    return "操作已被用户取消。"
        case .incorrectVerificationCode(let cause):             return cause ?? "验证码不正确。"
        case .tooManyAttempts(let cause):                       return cause
        case .authenticationHandshakeFailed(let cause):         return "认证握手失败：\(cause)"
        case .invalidAnisetteData(let cause):                   return "Anisette 数据无效：\(cause)"
        case .tooManyCertificates(let cause):                   return "已达证书数量上限：\(cause)"
        case .accountRepairRequired(_, let message):            return message.isEmpty ? Constants.defaultAccountRepairMessage : message
        case .invalid2FAResponse(let cause):                    return cause ?? "双重认证响应无效。"
        }
    }
}

public enum ServerError: LocalizedError, CustomStringConvertible, Sendable {
    case badServerResponse(reason: String, jsonPayload: String)
    case invalidResponseFormat(rawPayload: String)
    case missingKey(key: String, jsonPayload: String)
    case underlyingError(code: Int, message: String)

    public var description: String {
        switch self {
        case .badServerResponse(let reason, let jsonPayload): return "badServerResponse(reason: \"\(reason)\"):\n\(jsonPayload)"
        case .invalidResponseFormat(let rawPayload):          return "invalidResponseFormat:\n\(rawPayload)"
        case .missingKey(let key, let jsonPayload):           return "missingKey(\"\(key)\"):\n\(jsonPayload)"
        case .underlyingError(let code, let message):         return "underlyingError(code: \(code), message: \"\(message)\")"
        }
    }

    public var errorDescription: String? {
        switch self {
        case .badServerResponse(let reason, let jsonPayload): return "服务器响应无效：\(reason)\n\(jsonPayload)"
        case .invalidResponseFormat(let rawPayload):          return "服务器响应无效：格式无法解析\n\(rawPayload)"
        case .missingKey(let key, let jsonPayload):           return "服务器响应无效：缺少必需的键“\(key)”\n\(jsonPayload)"
        case .underlyingError(let code, let message):         return "\(message) (\(code))"
        }
    }
}

public enum SignerError: Error, LocalizedError, Sendable {
    case unknown(cause: String? = nil)
    case invalidApp(cause: String)
    case missingAppBundle(path: String)
    case missingInfoPlist(path: String)
    case missingProvisioningProfile(bundleIdentifier: String)

    public var errorDescription: String? {
        switch self {
        case .unknown(let cause):                               return cause ?? "签名过程中发生未知错误。"
        case .invalidApp(let cause):                            return "应用无效：\(cause)"
        case .missingAppBundle(let path):                       return "提供的路径中不包含应用包：\(path)"
        case .missingInfoPlist(let path):                       return "提供的应用缺少 Info.plist：\(path)"
        case .missingProvisioningProfile(let bundleIdentifier): return "找不到与 Bundle 标识符“\(bundleIdentifier)”匹配的配置文件。"
        }
    }
}

public enum CertificateError: Error, LocalizedError, Sendable {
    case csrGenerationFailed(cause: String)
    case pkcs12ImportFailed(cause: String)
    case pkcs12ExportFailed(cause: String)
    case decryptionFailed(cause: String? = nil)
    case invalidData(cause: String)

    public var errorDescription: String? {
        switch self {
        case .csrGenerationFailed(let cause):  return "CSR 生成失败：\(cause)"
        case .pkcs12ImportFailed(let cause):   return "PKCS#12 导入失败：\(cause)"
        case .pkcs12ExportFailed(let cause):   return "PKCS#12 导出失败：\(cause)"
        case .decryptionFailed(let cause):     return "解密失败：\(cause ?? "密码不正确")"
        case .invalidData(let cause):          return "证书数据无效：\(cause)"
        }
    }
}
