//
//  Alertmo.swift
//  Pods
//
//  Created by Jonathan Moraly on 6/27/17.
//
//

import UIKit

public protocol AlertmoViewControllerDelegate {
    func onAlertFirstButton()
    func onAlertSecondButton()
}

public class Alertmo: UIViewController {
    
    var alertView: AlertmoView!
    
    public var titleText: String?
    public var messageText: String?
    public var firstButtonText: String?
    public var secondButtonText: String?
    public var minimizeSecondButton = false
    public var image: UIImage?
    
    public var delegate: AlertmoViewControllerDelegate?
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.40)
        
        alertView = AlertmoView()
        alertView.titleLabel.text = titleText
        alertView.messageLabel.text = messageText
        alertView.firstButton.setTitle(firstButtonText, for: .normal)
        alertView.secondButton.setTitle(secondButtonText, for: .normal)
        alertView.firstButton.addTarget(self, action:#selector(onFirstButton), for: .touchUpInside)
        alertView.secondButton.addTarget(self, action:#selector(onSecondButton), for: .touchUpInside)
        
        alertView.imageView.image = image
        
        if minimizeSecondButton {
            alertView.minimizeSecondButton()
        }
        
        if secondButtonText == nil {
            alertView.hideSecondButton()
        }
        
        if image != nil {
            alertView.showImage()
        }
        
        
        view.addSubview(alertView)
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        alertView.translatesAutoresizingMaskIntoConstraints = false
        setUIConstraints()
    }
    
    func setUIConstraints() {
        alertView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let alertWidth = min(UIScreen.main.bounds.width * 0.80, 280)
        alertView.widthAnchor.constraint(equalToConstant: alertWidth).isActive = true
        
        if minimizeSecondButton {
            alertView.bottomAnchor.constraint(equalTo: alertView.secondButton.bottomAnchor, constant: 20).isActive = true
        } else {
            alertView.bottomAnchor.constraint(equalTo: alertView.secondButton.bottomAnchor, constant: 30).isActive = true
        }
    }
    
    func onFirstButton() {
        self.delegate?.onAlertFirstButton()
    }
    
    func onSecondButton() {
        self.delegate?.onAlertSecondButton()
    }
}
