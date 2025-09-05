//
//  LoginViewController.swift
//  HackerNews_MVVM
//
//  Created by Koushik Reddy Kambham on 9/4/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginViewModel = LoginViewModel()
    
    var LogInToYourAccountLabel: UILabel!
    var EmailLabel: UILabel!
    var EmailTextField: UITextField!
    var PasswordLabel: UILabel!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    var ForgotPasswordButton: UIButton!
    var DontHaveAnAccountLabel: UILabel!
    var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = .black
        
        LogInToYourAccountLabel = UILabel()
        LogInToYourAccountLabel.text = "Log In To Your Account"
        LogInToYourAccountLabel.textColor = .white
        LogInToYourAccountLabel.font = .systemFont(ofSize: 30, weight: .bold)
        LogInToYourAccountLabel.textAlignment = .center
        LogInToYourAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(LogInToYourAccountLabel)
        
        EmailLabel = UILabel()
        EmailLabel.text = "Email"
        EmailLabel.textColor = .white
        EmailLabel.textAlignment = .center
        EmailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(EmailLabel)
        
        EmailTextField = UITextField()
        EmailTextField.placeholder = "Enter Email"
        EmailTextField.textAlignment = .left
        EmailTextField.borderStyle = .roundedRect
        EmailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(EmailTextField)
        
        PasswordLabel = UILabel()
        PasswordLabel.text = "Password"
        PasswordLabel.textColor = .white
        PasswordLabel.textAlignment = .center
        PasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(PasswordLabel)
        
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.textAlignment = .left
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        ForgotPasswordButton = UIButton()
        ForgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        ForgotPasswordButton.setTitleColor(UIColor.blue, for: .normal)
        ForgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ForgotPasswordButton)
        
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.backgroundColor = .systemRed
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(LoginTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        DontHaveAnAccountLabel = UILabel()
        DontHaveAnAccountLabel.text = "Don't have an Account?"
        DontHaveAnAccountLabel.textColor = .white
        DontHaveAnAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(DontHaveAnAccountLabel)
        
        SignUpButton = UIButton(type: .system)
        SignUpButton.setTitle("Sign Up", for: .normal)
        SignUpButton.setTitleColor(UIColor.blue, for: .normal)
        SignUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SignUpButton)
        
        

        NSLayoutConstraint.activate([
            LogInToYourAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LogInToYourAccountLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
            
            
            EmailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -150),
            EmailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            EmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            EmailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            EmailTextField.widthAnchor.constraint(equalToConstant: 350),
            EmailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            PasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -140),
            PasswordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),

            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalTo: EmailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            ForgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 110),
            ForgotPasswordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            loginButton.widthAnchor.constraint(equalTo: EmailTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            DontHaveAnAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            DontHaveAnAccountLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            
            SignUpButton.leadingAnchor.constraint(equalTo: DontHaveAnAccountLabel.trailingAnchor, constant: 10),
            SignUpButton.centerYAnchor.constraint(equalTo: DontHaveAnAccountLabel.centerYAnchor),
        ])
    }
    
    @objc func LoginTapped() {
        let email = EmailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if !loginViewModel.validateLoginEmail(email: email) || !loginViewModel.validateLoginPassword(password: password) {
            return
        }
        
        loginViewModel.credentials = User(email: email, password: password)
        
        navigateToHome()
    }
    
    func navigateToHome() {

        let homeVC = HomeScreenViewController()
        let navigationController = UINavigationController(rootViewController: homeVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
}
