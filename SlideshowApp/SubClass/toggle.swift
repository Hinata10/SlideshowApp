//
//  toggle.swift
//  SlideshowApp
//
//  Created by 日向亮博 on 2019/06/23.
//  Copyright © 2019 Hinata10. All rights reserved.
//

import UIKit

class toggle: UIButton {
    var isOn = false
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initButton()
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        initButton()
    }
    func initButton(){
//        layer.borderWidth = 0.5
//        layer.borderColor =
        addTarget(self, action: #selector(toggle.buttonPressed), for: .touchUpInside)
    }
    @objc func buttonPressed(){
        activeButton(bool: isOn)
//        layer.borderWidth = 0.5
    }
    func activeButton(bool: Bool){
        isOn = bool
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
