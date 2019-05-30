//
//  SMFonts.swift
//  SMUILibrary
//
//  Created by Ground Zero on 28/05/19.
//  Copyright © 2019 Ground Zero Development. All rights reserved.
//

import UIKit
public class GZ_FONTS{
    
    
    //MARK: FONTS
    static let HELVETICA_MEDIUM = UIFont(name: "HelveticaNeue-Medium", size: CGFloat(18))!
    static let HELVETICA_LIGHT = UIFont(name: "HelveticaNeue-Light", size: CGFloat(18))!
    static let HELVETICA_REGULAR = UIFont(name: "HelveticaNeue", size: CGFloat(18))!
    static let HELVETICA_BOLD = UIFont(name: "HelveticaNeue-Bold", size: CGFloat(18))!
    
    class func GetFontWith(Type:FontType, Size:CGFloat) -> UIFont{
        let returnFont:UIFont!
        switch Type {
        case .BOLD:
            returnFont = UIFont(name: "HelveticaNeue-Bold", size: Size)
        case .LIGHT:
            returnFont = UIFont(name: "HelveticaNeue-Light", size: Size)
        case .MEDIUM:
            returnFont = UIFont(name: "HelveticaNeue-Medium", size: Size)
        default:
            returnFont = UIFont(name: "HelveticaNeue", size: Size)
        }
        return returnFont
    }
}
enum FontType {
    case BOLD
    case LIGHT
    case MEDIUM
    case REGULAR
}
