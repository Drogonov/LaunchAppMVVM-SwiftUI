//
//  NetworkHelpers.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//

import Foundation
import Moya

public enum HTMAPIError: Error {
    case deserialization
    case authError
    case invalidData
    case expiredToken
    case userNotFound
    case invalidOTPCode
    
    case unknown
}
