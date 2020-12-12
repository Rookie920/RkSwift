//
//  RKHomeVC.swift
//  RKProject
//
//  Created by YB007 on 2020/11/25.
//

import UIKit

class RKHomeVC: RKBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        titleL.text = String(format: "\(rkLocalized(key: "首页%@数"))", "123")
        leftItem.isHidden = true
        
        rightItem.isHidden = false
        rightItem.setTitle(rkLocalized(key: "地址"), for: .normal)
        
        
        
        
        
    }
    
    override func clickNaviRightBtn() {
        
        
        
        let cuss = RkProjectTestVC()
        navigationController?.pushViewController(cuss, animated: true)
        
        
        
        /*
        let web = RKWebVC(url: "http://www.baidu.com")
        navigationController?.pushViewController(web, animated: true)
        */
    }

}
