//
//  RKMessageVC.swift
//  RKProject
//
//  Created by YB007 on 2020/11/25.
//

import UIKit

class RKMessageVC: RKBaseVC {

    private var homeModel = HomeConfigModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        leftItem.isHidden = true
        titleL.text = rkLocalized(key: "消息").appending(" Top")
        
        rightItem.isHidden = false
        rightItem.setTitle(rkLocalized(key: "配置"), for: .normal)
        
    }
    override func clickNaviRightBtn() {
        RKNetwork.rkloadData(target: RKApi.homeConfig, model: HomeConfigData.self, showHud: true) { [self] (returnData, jsonData) in
            guard let info = returnData?.info , info.count > 0 else {
                rkShowHud(title: rkLocalized(key: "信息错误"))
                return
            }
            self.homeModel = info[0]
            rkprint("home:\(self.homeModel.login_type?[0] ?? "-1")")
            rkprint("guid:\(self.homeModel.guide?.switch ?? "-1")")
        } failure: { (stateCode, msg) in

        }

    }

    

}
