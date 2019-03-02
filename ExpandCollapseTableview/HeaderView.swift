//
//  HeaderView.swift
//  ExpandCollapseTableview
//
//  Created by Meenal Kewat on 3/2/19.
//  Copyright © 2019 Happykrafts Innovations. All rights reserved.
//

import UIKit


protocol headerDelegate {
    func callHeader(idx:Int)
}

class HeaderView: UIView {
    
    
    
    var delegate: headerDelegate?
    var sectionIndex: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        btn.backgroundColor = UIColor.red
        btn.titleLabel?.textColor = UIColor.white
        btn.addTarget(self, action: #selector(onClickHeaderView), for: .touchUpInside)
        return btn
    }()
    
    @objc func onClickHeaderView(){
        print("Header View")
        if let idx = sectionIndex{
            delegate?.callHeader(idx: idx)
        }
    }

}
