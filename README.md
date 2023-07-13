# Swift-VPSwitchToggle

This package is the alternative of "https://github.com/VansonLeung/SwiftUI-VPSwitchToggle" but written in Swift UIKit.

Fully customizable UISwitch alternative.

Supports iOS 11 or above

Supports the following background transition animations:
 - Fade
 - Horizontal
 - HorizontalReverse
 - Vertical
 - VerticalReverse


## Demo Video



https://github.com/VansonLeung/Swift-VPSwitchToggle/assets/1129695/2d2487b0-d38e-4acc-bc6a-0d160eea48a3





## Installation

Install Swift Package in SPM:

`.package(url: "https://github.com/VansonLeung/Swift-VPSwitchToggle.git", from: "1.0.1")`


## Usage

### Create UI by interface builder:

<img width="376" alt="image" src="https://github.com/VansonLeung/Swift-VPSwitchToggle/assets/1129695/aa801c1f-02ec-4ffb-9be7-f5cd32288544">
<img width="376" alt="image" src="https://github.com/VansonLeung/Swift-VPSwitchToggle/assets/1129695/e374e4e6-dbfa-40d3-9636-01eaa01382f9">


### Create UI by code:

```swift

        let tg = VPSwitchToggle(frame: CGRect(x: 0, y: 0, width: 0, height: csv?.frame.height ?? 0))
        tg.isOn = true
        tg.widgetForegroundMargin = 6
        tg.state_on_backgroundImage = .init(named: "f_switch_bg_moon")
        tg.state_on_backgroundColor = .init(red: 29.0/255.0, green: 32.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        tg.state_on_foregroundImage = .init(named: "f_switch_button_moon")
        tg.state_on_foregroundColor = .init(red: 203.0/255.0, green: 207.0/255.0, blue: 215.0/255.0, alpha: 1.0)
        tg.state_off_backgroundImage = .init(named: "f_switch_bg_sun")
        tg.state_off_backgroundColor = .init(red: 71.0/255.0, green: 125.0/255.0, blue: 182.0/255.0, alpha: 1.0)
        tg.state_off_foregroundImage = .init(named: "f_switch_button_sun")
        tg.state_off_foregroundColor = .init(red: 244.0/255.0, green: 201.0/255.0, blue: 81.0/255.0, alpha: 1.0)
        tg.backgroundImageOrder = VPSwitchToggle.BackgroundImageOrder.verticalReversed.rawValue
        tg.addTarget(self, action: #selector(onVPSwitchToggleValueChanged(me: )), for: .valueChanged)
        stackView?.addArrangedSubview(tg)

```


