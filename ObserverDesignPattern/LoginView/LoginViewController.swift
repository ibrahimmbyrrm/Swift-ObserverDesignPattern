//
//  ViewController.swift
//  ObserverDesignPattern
//
//  Created by İbrahim Bayram on 9.05.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBinders()
    }
    
    private func setupBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print("asd")
                print(error)
            }else {
                self?.goToHomePage()
            }
        }
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true)
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let email = emailField.text , let password = passwordField.text else {return}
        viewModel.login(email: email, passsword: password)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

