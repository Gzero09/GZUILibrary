//
//  SMModalController.swift
//  SMUILibrary
//
//  Created by Ground Zero on 28/05/19.
//  Copyright © 2019 Ground Zero Development. All rights reserved.
//

import UIKit

public class GZModalController: UIViewController {
    
    public let View:UIView = UIView()
    private let MainScreen = UIScreen.main.bounds
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
/**
     Instantiate Controller With Background Color
     */
    public init(BackgroundColor:UIColor) {
        super.init(nibName: nil, bundle: nil)
        View.frame = CGRect(x: 3.0, y: MainScreen.height/3, width: MainScreen.width-6, height: MainScreen.height*3/4)
        View.backgroundColor = BackgroundColor
        View.layer.cornerRadius = 18.0
        AddShadow(To: View)
        self.view.addSubview(View)
        let Gesture = UISwipeGestureRecognizer(target: self, action: #selector(DismissController))
        Gesture.direction = .down
        self.view.addGestureRecognizer(Gesture)
    }

    private func AddShadow(To View:UIView) {
        View.layer.masksToBounds = false
        View.layer.shadowColor = UIColor.black.cgColor
        View.layer.shadowOpacity = 0.1
        View.layer.shadowOffset = CGSize(width: -1, height: -2)
        View.layer.shadowRadius = 7
    }
/**
     Present Alert On View
     */
    public func RunModal(){
        DispatchQueue.main.async {
            self.modalPresentationStyle = .overCurrentContext
            UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
@objc extension GZModalController{
    private func DismissController(){
        self.dismiss(animated: true, completion: nil)
    }
}
