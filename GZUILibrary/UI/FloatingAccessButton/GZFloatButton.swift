//
//  SMFloatButton.swift
//  SMUILibrary
//
//  Created by Ground Zero on 28/05/19.
//  Copyright © 2019 Ground Zero Development. All rights reserved.
//

import UIKit

public class GZFloatButton: UIButton {
    public init(BackGroundColor:UIColor,Icon:UIImage) {
        super.init(frame: CGRect())
        self.frame = CGRect(x: UIScreen.main.bounds.width-70.0,
                            y: UIScreen.main.bounds.height-70.0,
                            width: 60.0, height: 60.0)
        
        self.backgroundColor = BackGroundColor
        self.layer.cornerRadius = self.frame.width/2
        self.setImage(Icon, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        self.imageView?.contentMode = .scaleAspectFit
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
