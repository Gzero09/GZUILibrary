//
//  SMColorLibrary.swift
//  SMUILibrary
//
//  Created by Ground Zero on 28/05/19.
//  Copyright © 2019 Ground Zero Development. All rights reserved.
//

import UIKit
@objc public class GZ_COLORS:NSObject{
    
    //MARK: COLORS
    public static let PRIMARY_COLOR = UIColor(red: 72.0/255.0, green: 138.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    public static let SECONDARY_COLOR = UIColor(red: 50.0/255.0, green: 219.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    public static let DANGER_COLOR = UIColor(red: 245.0/255.0, green: 61.0/255.0, blue: 61.0/255.0, alpha: 1.0)
    public static let LIGHT_COLOR = UIColor(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 1.0)
    public static let DARK_COLOR = UIColor(red: 34.0/255.0, green: 34.0/255.0, blue: 34.0/255.0, alpha: 1.0)
    
    public static let PRIMARY_LABEL_COLOR = UIColor(red: 18.0/255.0, green: 18.0/255.0, blue: 18.0/255.0, alpha: 1.0)
    public static let SECONDARY_LABEL_COLOR = UIColor(red: 81.0/255.0, green: 81.0/255.0, blue: 81.0/255.0, alpha: 1.0)
    
/**
     Set Gradient Color To View With Colors & Direction
     */
    public class func SetGradientColorToView(view:UIView, Colors:[UIColor],Direction:GRADIENT_DIRECTION){
        let gradientLayer = CAGradientLayer()
        var cgArray:[CGColor] = [CGColor]()
        for color in Colors{
            cgArray.append(color.cgColor)
        }
        gradientLayer.colors = cgArray
        switch Direction {
        case .LEFT:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .RIGHT:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .LEFT_CORNER:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        case .RIGHT_CORNER:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        case .UP_RIGHT_CORNER:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .UP_LEFT_CORNER:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        default:
            gradientLayer.locations = [0.0,1.0]
        }
        gradientLayer.frame = view.bounds
        view.backgroundColor = .none
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }

/**
     Get HEX Color From Hex String Ex. #ffffff
     */
    public class func HEX_COLOR(HEX:String) -> UIColor {
        
        var cString:String = HEX.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.black
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

public enum GRADIENT_DIRECTION {
    case LEFT
    case RIGHT
    case VERICAL
    case LEFT_CORNER
    case RIGHT_CORNER
    case UP_RIGHT_CORNER
    case UP_LEFT_CORNER
}
