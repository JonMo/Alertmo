//
//  AlertmoView.swift
//  Pods
//
//  Created by Jonathan Moraly on 6/27/17.
//
//

import UIKit

class AlertmoView: UIView {
    
    var titleLabel: UILabel!
    var messageLabel: UILabel!
    var firstButton: AlertmoButton!
    var secondButton: AlertmoButton!
    var secondButtonHeightConstraint: NSLayoutConstraint!
    var secondButtonBottomConstraint: NSLayoutConstraint!
    var imageView: UIImageView!
    var imageViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    // MARK: - View Setup
    
    func setupView() {
        self.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.layer.shadowOpacity = 0.2
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 12.0
        
        titleLabel = UILabel()
        titleLabel.font = UIFont(name:"Helvetica-Bold", size: 18.0)
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.lineBreakMode = .byWordWrapping
        addSubview(titleLabel)
        
        messageLabel = UILabel()
        messageLabel.font = UIFont(name:"Helvetica", size: 16.0)
        messageLabel.textColor = UIColor.gray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.sizeToFit()
        addSubview(messageLabel)
        
        firstButton = AlertmoButton(frame: .zero)
        firstButton.isEnabled = true
        addSubview(firstButton)
        
        secondButton = AlertmoButton(frame: .zero)
        secondButton.setBackgroundColor(UIColor.white, forState: .normal)
        secondButton.setTitleColor(UIColor(red: 0.0, green: 49.0 / 255.0, blue: 64.0 / 255.0, alpha: 1.0), for: .normal)
        secondButton.setTitleColor(UIColor(red: 0.0, green: 49.0 / 255.0, blue: 64.0 / 255.0, alpha: 0.2), for: .highlighted)
        secondButton.layer.borderColor = UIColor(red: 0.0, green: 49.0 / 255.0, blue: 64.0 / 255.0, alpha: 1.0).cgColor
        secondButton.layer.borderWidth = 1
        secondButton.isEnabled = true
        secondButtonHeightConstraint = secondButton.heightAnchor.constraint(equalToConstant: 50)
        
        addSubview(secondButton)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 0)
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.setUIConstraints()
    }
    
    func setUIConstraints(){
        let frameWidth = self.frame.width
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 26).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: frameWidth * 0.85).isActive = true
        imageViewHeightConstraint.isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: frameWidth * 0.85).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        messageLabel.widthAnchor.constraint(equalToConstant: frameWidth * 0.75).isActive = true
        
        firstButton.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 25).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        firstButton.widthAnchor.constraint(equalToConstant: frameWidth * 0.79).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        secondButton.topAnchor.constraint(equalTo: self.firstButton.bottomAnchor, constant: 10).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: frameWidth * 0.79).isActive = true
        secondButtonHeightConstraint.isActive = true
    }
    
    func minimizeSecondButton() {
        secondButton.setBackgroundColor(UIColor.clear, forState: .normal)
        secondButton.setTitleColor(UIColor.gray, for: .normal)
        secondButton.setTitleColor(UIColor.lightGray, for: .highlighted)
        secondButton.layer.borderWidth = 0
        secondButton.titleLabel?.font = UIFont(name:"GothamNarrow-Book", size: 14.0)
        secondButtonHeightConstraint.constant = 20
    }
    
    func hideSecondButton() {
        secondButton.isHidden = true
        secondButtonHeightConstraint.constant = 0
    }
    
    func showImage() {
        imageView.isHidden = false
        imageViewHeightConstraint.constant = 120
    }
}
