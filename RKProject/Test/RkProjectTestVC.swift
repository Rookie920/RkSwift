//
//  RkProjectTestVC.swift
//  RKProject
//
//  Created by YB007 on 2020/11/24.
//

import UIKit

class RkProjectTestVC: RKBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let cor = "#123456".rkStringConvertColor()
//        let corW = UIColor(hexString: "ffffff", alpha: 1.0)
//        rkprint("corlor1:\(cor)===corlor2:\(corW)")
        
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(clikcBtn), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view).offset(100)
        }
        
        
    }
    
    @objc func clikcBtn(){
        /*
        let alertV = RKAlertView(title: "", message: "2222", style: .alert)
        let cancelA = RKAlertAction(title: "取消", style: .cancel) { (action) in
            rkprint("clcik：\(action.actionTitleStr!)")
        }
        let sureA = RKAlertAction(title: "确认", style: .confirm) { (action) in
            rkprint("clcik：\(action.actionTitleStr!)")
        }
        let aaaa = RKAlertAction(title: "又一个", style: .normal) { (action) in
            rkprint("clcik：\(action.actionTitleStr!)")
        }
        alertV.addAction(action: cancelA)
        alertV.addAction(action: sureA)
        alertV.addAction(action: aaaa)
        alertV.show()
        */
        
        rkLoadingHud(title: rkLocalized(key: "你好年后"))
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            rkHideHud()
        }
    
    }
    
    
    
}
