//
//  RegisterView.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import UIKit

class RegisterNameView: UIView {
    
    // MARK: ElementsVisual
    
    private lazy var backgroundHeaderView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "easyBankBackground"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoHeaderView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "EasyBankLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    lazy var customView: CustomViewRegisterName = {
        let element = CustomViewRegisterName()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .white
        element.layer.cornerRadius = 20
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowOpacity = 0.5
        element.layer.shadowOffset = CGSize(width: 0, height: 4)
        element.layer.shadowRadius = 4
        return element
    }()
    
    private lazy var alreadyHaveAccountLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Já possui uma conta?"
        element.font = .customSegoeUIFont(type: .bold, size: 16)
        element.textColor = .cinzaEscuro
        return element
    }()
    
    lazy var loginButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        element.setTitle("FAÇA LOGIN", for: .normal)
        element.setTitleColor(UIColor.blue, for: .normal)
        element.titleLabel?.font = .customSegoeUIFont(type: .bold, size: 16)
        return element
    }()
   
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterNameView: ViewCodeUIView {
    // MARK: Add Elements e Constraints
    
    func addElementsView() {
        self.addSubview(backgroundHeaderView)
        self.addSubview(logoHeaderView)
        self.addSubview(customView)
        self.addSubview(alreadyHaveAccountLabel)
        self.addSubview(loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundHeaderView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundHeaderView.heightAnchor.constraint(equalToConstant: 250),
            
            logoHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            logoHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            logoHeaderView.widthAnchor.constraint(equalToConstant: 100),
            logoHeaderView.heightAnchor.constraint(equalToConstant: 100),
            
            customView.topAnchor.constraint(equalTo: logoHeaderView.bottomAnchor, constant: 20),
            customView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            customView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            customView.heightAnchor.constraint(equalToConstant: 350),
            
            alreadyHaveAccountLabel.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 15),
            alreadyHaveAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            loginButton.centerYAnchor.constraint(equalTo: alreadyHaveAccountLabel.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: alreadyHaveAccountLabel.trailingAnchor, constant: 5),
        ])
    }
    
    func applyConditionSpecial() {
        self.backgroundColor = .white
    }
}