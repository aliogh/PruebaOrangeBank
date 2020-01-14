//
//  RepositoryConstants.swift
//  Domain
//
//  Created by ali.ghanbari.local on 13/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation

public struct RepositoryConstants {

    public struct ApiOrangeBank {

        public struct Method {
            // Login
            public static let transactions = "/bins/1a30k8"
        }

    }

    public enum Exception: Int, Error {
        case unknownError = 1000
        case parseError = 1001
        case fileError = 1002

        public enum Http: Int, Error {
            case badRequestError = 400
            case unauthorizedError = 401
            case forbiddenError = 403
            case notFoundError = 404
            case methodFailureError = 420
            case misdirectedRequestError = 421
            case internalServerError = 500

            case timeoutError = -1001
            case cannotFindHostError = -1003
            case cannotConnectToHostError = -1004
            case connectionLostError = -1005
            case internetError = -1009
            case badServerResponseError = -1011
            case requiresSecureConnectionError = -1022
        }

    }

}
