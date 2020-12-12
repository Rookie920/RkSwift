//
//  RKModel.swift
//  RKProject
//
//  Created by YB007 on 2020/12/9.
//

import Foundation

struct RKModel: Codable {
    
    var ret: Int
    var msg: String
    var data: reqData
    struct reqData: Codable{
        var code: Int
        var msg: String
        var info :InfoData?
        
    }
    
    struct InfoData: Codable {
        var configInfo:[homeConfig]?
    }
    
    //配置
    struct homeConfig: Codable {
        var site_name: String
        var site_seo_title: String
    }
    
    
    
    
    
    
    
}
