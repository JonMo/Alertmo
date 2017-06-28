//
//  ViewController.swift
//  Alertmo
//
//  Created by JonMo on 06/27/2017.
//  Copyright (c) 2017 JonMo. All rights reserved.
//

import UIKit
import Alertmo

class ViewController: UIViewController, AlertmoViewControllerDelegate {
    
    var alertViewController: Alertmo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toggleButton = UIButton(frame: CGRect(x: 10, y: 20, width: 200, height: 30))
        toggleButton.setTitle("Show Alert", for: .normal)
        toggleButton.setTitleColor(UIColor.red, for: .normal)
        toggleButton.addTarget(self, action:#selector(showEmailAlreadyExistAlert), for: .touchUpInside)
        view.addSubview(toggleButton)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showEmailAlreadyExistAlert() {
        alertViewController = Alertmo()
        alertViewController.titleText = "Do you want to reset your password?"
        alertViewController.messageText = "We will guide you through the process"
        alertViewController.firstButtonText = "Yes, reset"
        alertViewController.secondButtonText = "Skip for now"
        alertViewController.minimizeSecondButton = true
        alertViewController.delegate = self
//        alertViewController.image = UIImage(named: "lock.png")
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func onAlertFirstButton() {
        self.alertViewController.dismiss(animated: true, completion: nil)
    }
    
    func onAlertSecondButton() {
        self.alertViewController.dismiss(animated: true, completion: nil)
    }
}

