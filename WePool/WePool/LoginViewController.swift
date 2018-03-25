//
//  LoginViewController.swift
//  WePool
//
//  Created by Michelline Tran on 2/10/18.
//  Copyright © 2018 WePoolTeam. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signUpTitleLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var signUpFieldsStackView: UIStackView!
    @IBOutlet weak var enterPhoneNumberView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!

    private var verificationID: String?

    @IBAction func signUpButtonPressed(_ sender: Any) {
        enterPhoneNumberView.isHidden = false
        spinner.isHidden = true
    }

    @IBAction func signUpWithPhoneNumberButtonPressed(_ sender: Any) {
        signUpFieldsStackView.isHidden = true
        spinner.isHidden = false
        spinner.startAnimating()

        guard let phoneNumberText = phoneNumberTextField.text else { return }
        let charsToKeep = "1234567890"
        let text = "+1" + String(phoneNumberText.lazy.filter(charsToKeep.contains))
        PhoneAuthProvider.provider().verifyPhoneNumber(text) { [weak self] (verificationID, error) in
            if let _ = error {
                let alertController = UIAlertController(title: "Error", message: "Invalid Phone Number", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Sad Dog", style: .cancel, handler: nil))
                self?.present(alertController, animated: true, completion: nil)
                self?.signUpFieldsStackView.isHidden = false
                self?.spinner.isHidden = true
                self?.spinner.stopAnimating()
                return
            }
            self?.signUpFieldsStackView.isHidden = false
            self?.signUpButton.isHidden = true
            self?.signInButton.isHidden = false
            self?.signUpTitleLabel.text = "Enter Verification Code"
            self?.spinner.isHidden = true
            self?.verificationID = verificationID
            self?.phoneNumberTextField.text = nil
            UserDefaults.standard.setValue(verificationID, forKey: "verificationID")
        }


    }

    @IBAction func signInButtonPressed(_ sender: Any) {
        guard let verificationID = verificationID, let verificationCode = phoneNumberTextField.text  else { return }
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                // ...
                return
            }
            // User is signed in
            // ...
        }
    }
}
