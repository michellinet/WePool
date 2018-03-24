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
    }

    @IBAction func signUpWithPhoneNumberButtonPressed(_ sender: Any) {
        signUpFieldsStackView.isHidden = true
        spinner.isHidden = false
        spinner.startAnimating()

//        PhoneAutho


    }
}
