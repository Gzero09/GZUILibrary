//
//  ViewController.swift
//  ExampleProject
//
//  Created by Ground Zero on 29/05/19.
//  Copyright © 2019 GZUILibrary. All rights reserved.
//

import UIKit
import GZUILibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SetupViews()
    }

    func SetupViews() {
        
        // Create Navigation Bar With Title, Background Color and Text Color.
        let NavigationBar = GZNavBar(Title: "Navigation",
                                     TextColor: GZ_COLORS.PRIMARY_COLOR,
                                     BackgroundColor: .white)
        NavigationBar.AddLeftButton(with: UIImage(named: "BackButton_Image")!,
                                    selector: #selector(BackButtonClicked))
        
        // In Similar Way Right Navigation Button Can be added
        /*
         NavigationBar.AddRightButton(with: UIImage(named: "front")!,
         selector: #selector(FrontButtonClick))
         */
        self.view.addSubview(NavigationBar)
        
        let FloatingButton = GZFloatButton(BackGroundColor: GZ_COLORS.PRIMARY_COLOR,
                                           Icon: UIImage(named: "ImageName")!)
        FloatingButton.addTarget(self, action: #selector(FloatingButtonClicked),
                                 for: .touchUpInside)
        
        self.view.addSubview(FloatingButton)
        
        //To Open Modal
        let ModalButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 40.0))
        ModalButton.center = self.view.center
        ModalButton.setTitle("Open Modal", for: .normal)
        ModalButton.setTitleColor(.black, for: .normal)
        ModalButton.addTarget(self, action: #selector(OpenModal), for: .touchUpInside)
        self.view.addSubview(ModalButton)
        
    }
    

}

@objc extension ViewController{
    func BackButtonClicked() {
        print("Back Button Clicked")
    }
    func FloatingButtonClicked() {
        print("Floating Button Clicked")
        
        let alert = GZAlertController(Title: "Alert", Message: "This is Alert Message",
                                      icon: UIImage(named: "AlertIcon")!)
        //To Insert Button with Title
        alert.InsertButtonWith(Title: "Ok")
        alert.InsertButtonWith(Title: "Cancel")
        //Set Alert Delegate
        alert.delegate = self
        alert.RunModal()
    }
    
    func OpenModal() {
        let Modal = GZModalController(BackgroundColor: .lightGray)
        //To Add Views on Modal use Modal.View (Make sure you use "Modal.View" not "Modal.view")
        let Label = UILabel(frame: CGRect(x: 0.0, y: 10.0, width: Modal.View.frame.width,
                                          height: 20.0))
        Label.text = "Modal Label"
        Label.textColor = .red
        Modal.View.addSubview(Label)
        Modal.RunModal()
    }
}
extension ViewController:GZAlertDelegate{
    func DidReceivedTouchWithButton(Title: String) {
        print("Button With Title: \(Title) Clicked")
    }
}
