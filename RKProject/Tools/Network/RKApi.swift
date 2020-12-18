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

class RKServicePlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mutatebleReq = request
        var params: [String:Any] = [:]
        
        switch target {
        case RKApi.homeConfig:
            params["service"] = "home.getconfig"
        default:
            params["service"] = "home.getconfig"
        }
        return mutatebleReq.appendApi(api: params)
    }
}

extension RKApi: TargetType{
    
    var method: Moya.Method{
        switch self {
        case .homeConfig:
            return .post
        default:
            return .get
        }
    }
    var task: Task {
        var params: [String:Any] = [:]
        
        switch self {
        case .homeConfig:
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

