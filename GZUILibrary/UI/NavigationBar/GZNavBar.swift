//
//  SMNavBar.swift
//  SMUILibrary
//
//  Created by Ground Zero on 28/05/19.
//  Copyright © 2019 Ground Zero Development. All rights reserved.
//

import UIKit

public class GZNavBar: UIView {

    private let Heading:UILabel = UILabel()
    
    public init(Title:String,TextColor:UIColor,BackgroundColor:UIColor) {
        super.init(frame: CGRect())
        self.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 70)
        self.backgroundColor = BackgroundColor
        AddShadow(To: self)
        Heading.frame = CGRect(x: 0.0, y: 10.0, width: self.frame.width, height: self.frame.height-10)
        Heading.text = Title
        Heading.textAlignment = .center
        self.addSubview(Heading)
        Heading.layer.zPosition = 0
        Heading.textColor = TextColor
    }
    
    public func AddLeftButton(with Icon:UIImage, selector:Selector) {
        let LeftButton:UIButton = UIButton(frame: CGRect(x: 5.0, y: 10.0, width: 30.0, height: self.frame.height))
        LeftButton.addTarget(GetParentController(), action: selector, for: .touchUpInside)
        LeftButton.setImage(Icon, for: .normal)
        LeftButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(LeftButton)
    }
    
    public func AddRightButton(with Icon:UIImage,selector:Selector){
        let RightButton:UIButton = UIButton(frame: CGRect(x: self.frame.width-35, y: 10.0, width: 30.0, height: self.frame.height))
        RightButton.addTarget(GetParentController(), action: selector, for: .touchUpInside)
        RightButton.setImage(Icon, for: .normal)
        RightButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(RightButton)
    }
    
    public func SetTitle(Title:String) {
        self.Heading.text = Title
    }
    public func SetHeadingFont(Font:UIFont){
        self.Heading.font = Font
    }
    
    private func AddShadow(To View:UIView) {
        View.layer.masksToBounds = false
        View.layer.shadowColor = UIColor.black.cgColor
        View.layer.shadowOpacity = 0.2
        View.layer.shadowOffset = CGSize(width: -1, height: 6)
        View.layer.shadowRadius = 5
    }
    private func GetParentController() -> UIViewController {
        var parentResponder:UIResponder? = self
        while parentResponder != nil{
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController{
                return viewController
            }
        }
        return UIViewController()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
