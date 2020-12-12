//
//  RKApiConfig.swift
//  RKProject
//
//  Created by YB007 on 2020/12/9.
//

import Foundation

import Moya

// 基本参数
public extension TargetType {
    var baseURL:URL {
        return URL(string: rkhostPath)!
    }
//    var path: String{
//        return ""
//    }
    var headers: [String: String]? {
        return nil
    }
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
}

// 公共参数
extension URLRequest {
    private var commonParams:[String: Any]?{
        return ["uid":"666",
                "token":"token",
                "version":rkversion,
                "build":rkbuild,
                "system":rksystemName,
        ]
    }
    mutating func appendCommonParams() -> URLRequest {
        let request = try?rkencod(params: commonParams, paramsEncodeing: URLEncoding(destination: .queryString))
        assert(request != nil,"check common params value")
        return request!
    }
    func rkencod(params: [String:Any]?, paramsEncodeing: ParameterEncoding) throws -> URLRequest {
        do {
            return try paramsEncodeing.encode(self, with: params)
        } catch  {
            throw MoyaError.parameterEncoding(error)
        }
    }
}

//拼接公共参数
class RKReqCommonParamsPlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mutatebleReq = request
        return mutatebleReq.appendCommonParams()
    }
}


