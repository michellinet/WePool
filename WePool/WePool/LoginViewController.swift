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

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var signUpFieldsStackView: UIStackView!
    @IBOutlet weak var enterPhoneNumberView: UIView!

    @IBOutlet weak var phoneNumberTextField: UITextField!
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
        PhoneAuthProvider.provider().verifyPhoneNumber(text) { (verificationID, error) in
//         DO SOMETHIN
        }


    }
}
