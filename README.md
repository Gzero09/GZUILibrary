# GZUILibrary

A UI Library for starters

## Getting Started

Add Extended UI Elements like Navigation bar, Floating Button, Action modals, AlertViews and Much more to your swift Code

### Prerequisites

Xcode: 10.2+     Swfift: 4.2+

#### How to Use?

##### GZNavBar
``` swift
/* 
To create Navigation Bar With Title, Background Color and Text Color.
With GZ_COLOR get access to All Materialistic colors i.e.(Primary,Secondary,Danger,etc)
*/
let NavigationBar = GZNavBar(Title: "Navigation",
                                     TextColor: GZ_COLORS.PRIMARY_LABEL_COLOR,
                                     BackgroundColor: .white)
/*
To Add Left Bar Button just Use NavigationBar Object and utilise AddLeftButton to add Button with Image
To Add Right Bar Button simply use AddRightButton to add Button with selector
*/
NavigationBar.AddLeftButton(with: UIImage(named: "BackButton_Image")!,
                        selector: #selector(BackButtonClicked))
//To Add Navigation Bar to view
self.view.addSubview(NavigationBar)
```
##### GZModalController
```swift
/*
To Create a Modal Controller and Present it on Controller
Use GZModalController with Background Color.
To add custom subviews on modal use Modal.View (use Uppercased 'V' in View).
To Run the Modal Simply Use ModalObject.RunModal() to Present your custom modal
*/
let Modal = GZModalController(BackgroundColor: .lightGray)
        //To Add Views on Modal use Modal.View (Make sure you use "Modal.View" not "Modal.view")
        let Label = UILabel(frame: CGRect(x: 0.0, y: 10.0, width: Modal.View.frame.width,
                                          height: 20.0))
        Label.text = "Modal Label"
        Label.textColor = .red
        Modal.View.addSubview(Label)
        Modal.RunModal()

```

##### GZTabBar
```swift
/*
To Create a Custom TabBar View use
GZTabBar with Background color, Shadow Height, Shadow Radius and Tint Color(Selected Icon Color)
*/
let TabBar = GZTabBar(BackgroundColor: .white,
                              ShadowHeight: 1.0, ShadowRadius: 1.0, TintColor: .red)
//To Insert Button With Icon and Background Color                              
TabBar.InsertButtonWith(Icon: UIImage(named: "Home")!, BackgroundColor: .white)
TabBar.InsertButtonWith(Icon: UIImage(named: "Settings")!, BackgroundColor: .white)
//Set Delegate to Receive Response
TabBar.delegate = self
self.view.addSubview(TabBar)


/*
To Receive Response Which Button is Clicked
*/
extension ViewController:GZTabBarDelegate{
    func DidReceivedButtonClickAt(Index: Int) {
        print("Selected Button: \(Index)")
    }
}
```
##### GZAlertController
```swift
/*
To Create alert With Title, Message and Icon
*/
let alert = GZAlertController(Title: "Alert", Message: "This is Alert Message",
                                      icon: UIImage(named: "AlertIcon")!)
        //To Insert Button with Title
        alert.InsertButtonWith(Title: "Ok")
        alert.InsertButtonWith(Title: "Cancel")
        //Set Alert Delegate
        alert.delegate = self
        alert.RunModal()

```

##### GZFloatButton
```swift
/*
To Create Floating Action Button With Background Color & Icon
*/
let FloatingButton = GZFloatButton(BackGroundColor: GZ_COLORS.SECONDARY_COLOR,
                                           Icon: UIImage(named: "AddImage")!)
// To add Target to Floating Button
FloatingButton.addTarget(self, action: #selector(FloatingButtonClicked),
                                 for: .touchUpInside)
//To add Button To View
self.view.addSubview(FloatingButton)
```
##### GZ_COLORS/GZ_FONTS
GZ_COLORS Provides Multiple Colors Access to User.
With Default it provides:
- [x] Primary Color
- [x] Secondary Color
- [x] Danger Color
- [x] Light Color
- [x] Dark Color
- [x] Primary Label Color
- [x] Secondary Label Color
- [x] Hex Color From String
- [x] SetGradientColorToView (This Function provides ease to apply gradient to view with directions and Colors Array.)


### Installing

#### Cocoapods

Go to your project Directory and Init pods using following command

```
pod init
```

Open your pod File using any text editor and add following Lines

```
target 'YourProjectName' do
  use_frameworks!
    	pod 'GZUILibrary'
end
```
