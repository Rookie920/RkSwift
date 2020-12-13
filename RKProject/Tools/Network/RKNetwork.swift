//
//  RKNetwork.swift
//  RKProject
//
//  Created by YB007 on 2020/12/9.
//

import Foundation

import Moya
import Result

private let provider = MoyaProvider<RKApi>(plugins:[
    RKService(),                //接口
    RKReqCommonParamsPlugin(),  // 拼接公共参数
    RKNetwork.rklogPlugin,      // 日志控制
    
])

// MARK: - 
public class RKNetwork {

    public class func rkloadData<T: TargetType, D: Decodable>(target: T, model: D.Type?, showHud: Bool? = nil,cache:((D?) -> Void)? = nil, success: @escaping((D?,Data?) -> Void), failure:((Int?,String) -> Void)?){
        
        if let isShow = showHud {
            if isShow {
                rkLoadingHud()
            }
        }
        provider.request(target as! RKApi) { (result) in
            rkHideHud()
            switch result {
            case let .success(response):
                let model = try? response.map(D.self)
                let jsonData = response.data
                success(model,jsonData)
            case let .failure(error):
                let statusCode = error.response?.statusCode ?? -1
                let erroMessage = "Net Error" + String(statusCode) + (error.errorDescription ?? "-")
                failureHandle(failure: failure, statusCode: statusCode, message: erroMessage)
            }
        }
        func failureHandle(failure:((Int?,String) -> Void)?, statusCode: Int?, message: String){
            failure?(statusCode,message)
        }
        
        
    }
    
    //打印控制
    static let rklogPlugin = RKRequestLogPlugin(verbose: true, cURL: false, response: true, requestDataFormatter: {data -> String in
        return String(data: data, encoding: .utf8) ?? ""
    }) { (data) -> (Data) in
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data
        }
    }
}

