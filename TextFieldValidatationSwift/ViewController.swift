//
//  ViewController.swift
//  TextFieldValidatationSwift
//
//  Created by Bhumika Patel on 19/12/22.
//

import UIKit

class ViewController: UIViewController {
    //TextField
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtMobileNo: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    //errormsg
    @IBOutlet var lblErrorName: UILabel!
    @IBOutlet var lblErrorEmail: UILabel!
    @IBOutlet var lblErrorMobileNo: UILabel!
    @IBOutlet var lblErrorPassword: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func name_act(_ sender: Any){
        let textName = txtName.text ?? ""
        if textName.isValidName() {
           txtName.textColor = UIColor.black
            lblErrorName.text = ""
        } else {
            txtName.textColor = UIColor.red
            lblErrorName.text = "not valid name"
        }
    }
    @IBAction func email_act(_ sender: Any){
        let textEmail = txtEmail.text ?? ""
        if textEmail.isValidEmail() {
            txtEmail.textColor = UIColor.black
            lblErrorEmail.text = ""
        } else {
            txtEmail.textColor = UIColor.red
            lblErrorEmail.text = "not valid email"
        }
    }

    @IBAction func phone_act(_ sender: Any){
        let textMobileNo = txtMobileNo.text ?? ""
        if textMobileNo.filterPhoneNumber().isValidPhone() {
            txtMobileNo.textColor = UIColor.black
            lblErrorMobileNo.text = ""
        } else {
            txtMobileNo.textColor = UIColor.red
            lblErrorMobileNo.text = "not valid phone"
        }
    }

    @IBAction func pass_act(_ sender: Any){
        let textPass = txtPassword.text ?? ""
        if textPass.isValidPassword() {
            txtPassword.textColor = UIColor.black
            lblErrorPassword.text = "Strong Password"
            lblErrorPassword.textColor = UIColor.green
        } else {
            txtPassword.textColor = UIColor.red
            lblErrorPassword.text = "Weak password"
            lblErrorPassword.textColor = UIColor.red
        }
    }


    @IBAction func btnSave(_ sender: Any) {
        let textName = txtName.text ?? ""
        if textName.isValidName() {
           txtName.textColor = UIColor.black
            lblErrorName.text = ""
        } else {
            txtName.textColor = UIColor.red
            lblErrorName.text = "not valid name"
        }
        let textEmail = txtEmail.text ?? ""
        if textEmail.isValidEmail() {
            txtEmail.textColor = UIColor.black
            lblErrorEmail.text = ""
        } else {
            txtEmail.textColor = UIColor.red
            lblErrorEmail.text = "not valid email"
        }
        let textMobileNo = txtMobileNo.text ?? ""
        if textMobileNo.filterPhoneNumber().isValidPhone() {
            txtMobileNo.textColor = UIColor.black
            lblErrorMobileNo.text = ""
        } else {
            txtMobileNo.textColor = UIColor.red
            lblErrorMobileNo.text = "not valid phone"
        }
        let textPass = txtPassword.text ?? ""
        if textPass.isValidPassword() {
            txtPassword.textColor = UIColor.black
            lblErrorPassword.text = "Strong Password"
            lblErrorPassword.textColor = UIColor.green
        } else {
            txtPassword.textColor = UIColor.red
            lblErrorPassword.text = "Weak password"
            lblErrorPassword.textColor = UIColor.red
        }
        
    }
    

}


extension String {
    func isValidName() -> Bool {
        let inputRegEx = "^[a-zA-Z\\_]{2,25}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    func isValidEmail() -> Bool {
        let inputRegEx = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,64}"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    func isValidPhone() -> Bool {
        let inputRegEx = "^((\\+)|(00))[0-9]{6,14}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    func isValidPassword() -> Bool {
        let inputRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()-_+={}?>.<,:;~`']{8,}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    
    public func filterPhoneNumber() -> String {
        return String(self.filter {!" ()._-\n\t\r".contains($0)})
    }
}

