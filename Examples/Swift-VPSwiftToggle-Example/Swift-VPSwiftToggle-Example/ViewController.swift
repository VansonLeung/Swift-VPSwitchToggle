//
//  ViewController.swift
//  VPSwitchToggle-Swift-Demo
//
//  Created by Vanson Leung on 12/7/2023.
//

import UIKit
import Swift_VPSwitchToggle

class ViewController: UIViewController {

    @IBOutlet weak var sv: UIStackView?
    @IBOutlet weak var csv: UIStackView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sv = sv {
            for its in sv.subviews ?? [] {
                for it in its.subviews {
                    if let tg = it as? VPSwitchToggle {
                        tg.addTarget(self, action: #selector(onVPSwitchToggleValueChanged(me: )), for: .valueChanged)
                    }
                }
            }
        }
        
        
//        var tg = VPSwitchToggle(frame: <#T##CGRect#>, primaryAction: .none)
        var tg = VPSwitchToggle(frame: CGRect(x: 0, y: 0, width: 0, height: csv?.frame.height ?? 0))
        tg.isOn = false
        tg.state_off_backgroundColor = .lightGray
        tg.state_on_backgroundColor = .lightGray
        tg.state_off_foregroundColor = .white
        tg.state_on_foregroundColor = .green
        tg.addTarget(self, action: #selector(onVPSwitchToggleValueChanged(me: )), for: .valueChanged)
        csv?.addArrangedSubview(tg)

        tg = VPSwitchToggle(frame: CGRect(x: 0, y: 0, width: 0, height: csv?.frame.height ?? 0))
        tg.isOn = true
        tg.state_off_backgroundColor = .lightGray
        tg.state_on_backgroundColor = .blue
        tg.state_off_foregroundColor = .white
        tg.state_on_foregroundColor = .white
        tg.addTarget(self, action: #selector(onVPSwitchToggleValueChanged(me: )), for: .valueChanged)
        csv?.addArrangedSubview(tg)

        tg = VPSwitchToggle(frame: CGRect(x: 0, y: 0, width: 0, height: csv?.frame.height ?? 0))
        tg.isOn = false
        tg.state_off_backgroundColor = .systemBlue
        tg.state_on_backgroundColor = .systemRed
        tg.state_off_foregroundColor = .yellow
        tg.state_on_foregroundColor = .black
        tg.addTarget(self, action: #selector(onVPSwitchToggleValueChanged(me: )), for: .valueChanged)
        csv?.addArrangedSubview(tg)

        tg = VPSwitchToggle(frame: CGRect(x: 0, y: 0, width: 0, height: csv?.frame.height ?? 0))
        tg.isOn = true
        tg.state_off_backgroundColor = .lightGray
        tg.state_on_backgroundColor = .blue
        tg.state_off_foregroundColor = .white
        tg.state_on_foregroundColor = .white
        tg.addTarget(self, action: #selector(onVPSwitchToggleValueChanged(me: )), for: .valueChanged)
        csv?.addArrangedSubview(tg)
        
        
        tg = VPSwitchToggle(frame: CGRect(x: 0, y: 0, width: 0, height: csv?.frame.height ?? 0))
        tg.isOn = true
        tg.widgetForegroundMargin = 4
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
        csv?.addArrangedSubview(tg)
        
        


        
        //        tg.isOn = true
        
        
        // Do any additional setup after loading the view.
        
        
//        let draggableSwitch = VPSwitchToggle(
//            frame: CGRect(x: 50, y: 200, width: 300, height: 50)
//        )
//        view.addSubview(draggableSwitch)
    }


    @objc func onVPSwitchToggleValueChanged(me: VPSwitchToggle?) {
        if let me = me {
            for its in me.superview?.superview?.subviews ?? [] {
                for it in its.subviews {
                    if let tg = it as? VPSwitchToggle {
                        tg.isOn = me.isOn
                    }
                }
            }
        }
    }
}

