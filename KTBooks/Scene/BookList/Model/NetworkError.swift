//
//  NetworkError.swift
//  KTBooks
//
//  Created by pttem-ios on 28.09.2021.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidResponse
    case invalidUrl
    case invalidDecode
}
