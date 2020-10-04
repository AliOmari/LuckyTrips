//
//  SearchUseCase.swift
//  LuckyTrip
//
//  Created by Ali Omari on 10/3/20.
//  Copyright © 2020 Ali Omari. All rights reserved.
//

import Foundation
import Moya

enum SearchUseCase {
    case rooms(String)
}

extension SearchUseCase : TargetType {
    var path: String {
        switch self {
        case .rooms:
            return APIClient.Path.searchRooms.rawValue
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .rooms(let language):
            return .requestParameters(parameters: ["language_code": language],
                                      encoding: URLEncoding.default)
        }
    }
}
