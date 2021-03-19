//
//  ErrorManager.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import Foundation

public enum CustomError: Error {
    case malformedError
    
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .malformedError:
            return String("The url is malformed")
        }
    }
}

