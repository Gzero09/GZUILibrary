//
//  SMAlertController.swift
//  SMUILibrary
//
//  Created by Ground Zero on 28/05/19.
//  Copyright © 2019 Ground Zero Development. All rights reserved.
//

import UIKit

public protocol GZAlertDelegate{
    /*
     Receive the Title Name Of Button Clicked
     **/
    func DidReceivedTouchWithButton(Title:String)
}

public class GZAlertController: UIViewController {

    public var delegate:GZAlertDelegate! = nil
    
    let View:UIView = UIView()
    
    private let MessageTitle:UILabel = UILabel()
    private let MainScreen = UIScreen.main.bounds
    private var ButtonArray:[UIButton] = [UIButton]()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    /*
     Instantiate Controller With Title, Message and Icon For Alert
     **/
    public init(Title:String,Message:String,icon:UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
        let Gesture = UITapGestureRecognizer(target: self, action: #selector(DismissController))
        Gesture.delegate = self
        self.view.addGestureRecognizer(Gesture)
        View.frame = CGRect(x:0.0, y: MainScreen.height/3,
                            width: 290,
                            height: MainScreen.height/3)
        View.center = self.view.center
        View.backgroundColor = .white
        View.layer.cornerRadius = 10.0
        self.view.addSubview(View)
        
        let ImageView:UIImageView = UIImageView(frame: CGRect(x: 0.0, y: 10.0,
                                                              width: View.frame.width, height: 25.0))
        ImageView.image = icon
        ImageView.contentMode = .scaleAspectFit
        View.addSubview(ImageView)
        
        let MainTitle:UILabel = UILabel(frame: CGRect(x: 0.0,
                                                      y: ImageView.frame.height+ImageView.frame.origin.y+5.0,
                                                      width: View.frame.width,
                                                      height: 30.0))
        MainTitle.textColor = GZ_COLORS.LIGHT_GREY_COLOR
        MainTitle.text = Title
        MainTitle.font = GZ_FONTS.ALERT_MAIN_HEAD_FONT
        MainTitle.textAlignment = .center
        View.addSubview(MainTitle)
        
        MessageTitle.frame = CGRect(x: 5.0,
                                    y: MainTitle.frame.height+MainTitle.frame.origin.y,
                                    width: View.frame.width-10.0,
                                    height: CGFloat.greatestFiniteMagnitude)
        
        MessageTitle.textColor = GZ_COLORS.SECONDARY_LABEL_COLOR
        MessageTitle.text = Message
        MessageTitle.font = GZ_FONTS.MESSAGE_TEXT_FONT
        MessageTitle.lineBreakMode = .byWordWrapping
        MessageTitle.numberOfLines = 0
        MessageTitle.textAlignment = .center
        MessageTitle.sizeToFit()
        MessageTitle.frame = CGRect(x: 5.0,
                                    y: MainTitle.frame.height+MainTitle.frame.origin.y,
                                    width: View.frame.width-10.0, height: MessageTitle.frame.height)
        View.addSubview(MessageTitle)
        let totalViewHeight = ImageView.frame.origin.y+ImageView.frame.height+MainTitle.frame.height+MessageTitle.frame.height
        
        self.View.frame = CGRect(x: View.frame.origin.x,
                                 y: View.frame.origin.y,
                                 width: View.frame.width,
                                 height: totalViewHeight+10.0)
    }
    
    /*
     Add Button To Alert With Title
     **/
    public func InsertButtonWith(Title:String)
    {
        let Button:UIButton = UIButton()
        switch ButtonArray.count {
        case 0:
            self.View.frame = CGRect(x: self.View.frame.origin.x,
                                     y: self.View.frame.origin.y,
                                     width: self.View.frame.width,
                                     height: self.View.frame.height+45.0)
            
            Button.frame = CGRect(x: 0.0, y: self.View.frame.height-40.0,
                                  width: self.View.frame.width, height: 35.0)
        case 1:
            Button.frame = CGRect(x: self.View.frame.width/2,
                                  y: self.View.frame.height-40.0,
                                  width: View.frame.width/2, height: 35.0)
            let FirstButton = ButtonArray[0]
            FirstButton.removeFromSuperview()
            FirstButton.frame = CGRect(x: 0.0, y: self.View.frame.height-40.0,
                                       width: self.View.frame.width/2, height: 35.0)
            self.View.addSubview(FirstButton)
        case 2:
            self.View.frame = CGRect(x: self.View.frame.origin.x,
                                     y: self.View.frame.origin.y,
                                     width: self.View.frame.width,
                                     height: self.View.frame.height+35*CGFloat(ButtonArray.count))
            let FirstButton = ButtonArray[0]
            let SecondButton = ButtonArray[1]
            FirstButton.removeFromSuperview()
            SecondButton.removeFromSuperview()
            FirstButton.frame = CGRect(x: 0.0, y: MessageTitle.frame.origin.y+MessageTitle.frame.height+2.5,
                                       width: self.View.frame.width, height: 35.0)
            SecondButton.frame = CGRect(x: 0.0, y: FirstButton.frame.origin.y+FirstButton.frame.height+2.5,
                                        width: self.View.frame.width, height: 35.0)
            self.View.addSubview(FirstButton)
            self.View.addSubview(SecondButton)
            Button.frame = CGRect(x: 0.0, y: SecondButton.frame.height+SecondButton.frame.origin.y+2.5,
                                  width: self.View.frame.width, height: 35.0)
        default:
            let lastButton = ButtonArray.last
            Button.frame = CGRect(x: 0.0, y: (lastButton?.frame.height)!+(lastButton?.frame.origin.y)!+2.5,
                                  width: self.View.frame.width, height: 35.0)
            self.View.frame = CGRect(x: self.View.frame.origin.x,
                                     y: self.View.frame.origin.y,
                                     width: self.View.frame.width,
                                     height: self.View.frame.height+(lastButton?.frame.height)!+2.5)
        }
        
        self.View.center = self.view.center
        Button.setTitle(Title, for: .normal)
        Button.setTitleColor(GZ_COLORS.SECONDARY_COLOR, for: .normal)
        Button.addTarget(self, action: #selector(AlertButtonClick(sender:)), for: .touchUpInside)
        ButtonArray.append(Button)
        self.View.addSubview(Button)
    }
    
    
    public func RunModal(){
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
@objc extension GZAlertController{
    private func AlertButtonClick(sender:Any){
        let Button = sender as! UIButton
        delegate.DidReceivedTouchWithButton(Title: Button.titleLabel!.text!)
        self.dismiss(animated: true, completion: nil)
    }
    private func DismissController() {
        self.dismiss(animated: true, completion: nil)
    }
}
extension GZAlertController:UIGestureRecognizerDelegate{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if(touch.view?.isDescendant(of: View) == true){
            return false
        }
        return true
    }
}
