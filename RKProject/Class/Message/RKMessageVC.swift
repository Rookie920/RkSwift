//
//  RKMessageVC.swift
//  RKProject
//
//  Created by YB007 on 2020/11/25.
//

import UIKit

class RKMessageVC: RKBaseVC {

    var homeModel: RKModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        leftItem.isHidden = true
        titleL.text = rkLocalized(key: "消息").appending(" Top")
        
        rightItem.isHidden = false
        rightItem.setTitle(rkLocalized(key: "配置"), for: .normal)
        
    }
    override func clickNaviRightBtn() {
        RKNetwork.rkloadData(target: RKApi.homeConfig, model: RKModel.self, showHud: true) { (model, jsonData) in
            self.homeModel = model
            let infoaaa = self.homeModel?.data.info?.configInfo
            rkprint("home:\(String(describing: infoaaa))")
        } failure: { (stateCode, msg) in
            
        }

    }

    

}
