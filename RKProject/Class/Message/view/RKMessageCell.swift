//
//  RKMessageCell.swift
//  RKProject
//
//  Created by YB007 on 2020/12/26.
//

import UIKit

class RKMessageCell: RKBaseTableCell {

    lazy var leftIV: UIImageView = {
        let imgIV = UIImageView()
        imgIV.backgroundColor = .brown
        imgIV.layer.cornerRadius = 3;
        imgIV.layer.masksToBounds = true
        imgIV.contentMode = .scaleAspectFill
        return imgIV
    }()
    
    override func configCellUI() {
        
        addSubview(leftIV)
        leftIV.snp.makeConstraints { (make) in
            make.height.equalTo(self).multipliedBy(0.9)
            make.width.equalTo(leftIV.snp.height)
            make.centerY.equalTo(self)
            make.left.equalTo(15)
        }
        
    }
    
}
