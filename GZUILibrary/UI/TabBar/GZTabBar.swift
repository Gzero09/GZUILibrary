//
//  SMTabBar.swift
//  SMUILibrary
//
//  Created by Ground Zero on 28/05/19.
//  Copyright © 2019 Ground Zero Development. All rights reserved.
//

import UIKit

public protocol GZTabBarDelegate{
    func DidReceivedButtonClickAt(Index:Int)
}

    private var ButtonArray:[UIButton] = [UIButton]()
    private var ButtonTintColor:UIColor! = nil
    public var delegate:GZTabBarDelegate! = nil

public class GZTabBar: UIView {

/*
     Instantiate TabBar Without Constraints
     **/
    init(BackgroundColor:UIColor,ShadowHeight:CGFloat,ShadowRadius:CGFloat,TintColor:UIColor) {
        super.init(frame: CGRect())
        self.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.height-50.0, width: UIScreen.main.bounds.width, height: 50)
        self.backgroundColor = BackgroundColor
        ButtonTintColor = TintColor
        AddShadow(To: self, with: ShadowHeight, and: ShadowRadius)
    }


/*
     Insert A Button With Icon and Background Color of Button
     **/
   public func InsertButtonWith(Icon:UIImage,BackgroundColor:UIColor) {
        let Button:UIButton = UIButton()
        Button.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.width/(CGFloat(ButtonArray.count)+1), height: 50.0)
        Button.backgroundColor = BackgroundColor
        let Image = Icon.withRenderingMode(.alwaysTemplate)
        Button.setImage(Image, for: .normal)
        Button.imageView?.contentMode = .scaleAspectFit
        Button.tag = ButtonArray.count+1
        Button.tintColor = .none
        Button.addTarget(self, action: #selector(ButtonClicked(sender:)), for: .touchUpInside)
        ButtonArray.append(Button)
        var wid = CGFloat(0.0)
        for (i,oldBtn) in ButtonArray.enumerated(){
            oldBtn.removeFromSuperview()
            if(i == 0){
                oldBtn.frame = CGRect(x: 0.0, y: 0.0,
                                      width: self.frame.width/CGFloat(ButtonArray.count),
                                      height: 50.0)
            }else{
                if(i == ButtonArray.count-1){
                    for Btn in ButtonArray{
                        Btn.removeFromSuperview()
                        Btn.frame = CGRect(x: wid,
                                           y: 0.0, width: self.frame.width/CGFloat(ButtonArray.count), height: 50.0)
                        wid = wid+Btn.frame.width
                        self.addSubview(Btn)
                        
                    }
                }
            }
            self.addSubview(Button)
        }
    }
    
    private func AddShadow(To View:UIView, with Height:CGFloat, and Radius:CGFloat) {
        View.layer.masksToBounds = false
        View.layer.shadowColor = UIColor.black.cgColor
        View.layer.shadowOpacity = 0.2
        View.layer.shadowOffset = CGSize(width: -1, height: Height)
        View.layer.shadowRadius = Radius
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
@objc extension GZTabBar{
    private func ButtonClicked(sender:Any) {
        let Button = sender as! UIButton
        delegate.DidReceivedButtonClickAt(Index: Button.tag)
        for (i,Btn) in ButtonArray.enumerated(){
            if(Btn.tag == Button.tag){
                ButtonArray.remove(at: i)
                Button.tintColor = ButtonTintColor
                ButtonArray.insert(Button, at: i)
            }else{
                ButtonArray.remove(at: i)
                Btn.tintColor = .none
                ButtonArray.insert(Btn, at: i)
            }
        }
        
    }
}
