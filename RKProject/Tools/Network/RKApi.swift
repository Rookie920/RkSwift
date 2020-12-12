//
//  RKApi.swift
//  RKProject
//
//  Created by YB007 on 2020/12/9.
//

import Foundation

import Moya

 enum RKApi {
    case homeConfig
    case homeLogin
    
}

extension RKApi: TargetType{
    
    var path: String{
//        return ""
        switch self {
        case .homeConfig:
            return "?service=home.getconfig"
        default:
            return ""
        }
    }
    var method: Moya.Method{
        switch self {
        case .homeConfig:
            return .get
        default:
            return .get
        }
    }
    var task: Task {
        var params: [String:Any] = [:]
        
        switch self {
        case .homeConfig:
//            params["service"] = "home.getconfig"
            params["rk1"] = "abc"
            params["rk2"] = "abc"
            params["rk3"] = "abc"
            params["rk4"] = "abc"
        default:
            return .requestPlain
        }
        
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
}

