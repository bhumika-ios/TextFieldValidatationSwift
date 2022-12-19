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
    
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func resetForm(){
        saveButton.isEnabled = false
        
        lblErrorEmail.isHidden = false
        lblErrorName.isHidden = false
        lblErrorMobileNo.isHidden = false
        lblErrorPassword.isHidden = false
        
        lblErrorName.text = "Required"
        lblErrorEmail.text = "Required"
        lblErrorMobileNo.text = "Required"
        lblErrorPassword.text = "Required"
        
        txtName.text = ""
        txtEmail.text = ""
        txtMobileNo.text = ""
        txtPassword.text = ""
        
        
    }
    @IBAction func name_act(_ sender: Any){
        if let textName = txtName.text{
            if let errorMessage = invalidName(textName)
            {
                lblErrorName.text = errorMessage
               // lblErrorName.textColor = UIColor.red
                lblErrorName.isHidden = false
            }
            else
            {
                lblErrorName.isHidden = true
            }
        }
        checkForValidForm()
    }
    func invalidName(_ value: String) -> String?
    {
        let reqularExpression = "^[a-zA-Z\\_]{2,25}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Name"
        }
        
        return nil
    }

    func isValidName() -> Bool {
        let inputRegEx = "^[a-zA-Z\\_]{2,25}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    @IBAction func email_act(_ sender: Any){
        if let textEmail = txtEmail.text{
            if let errorMessage = invalidEmail(textEmail)
            {
                lblErrorEmail.text = errorMessage
                lblErrorEmail.isHidden = false
            }
            else
            {
                lblErrorEmail.isHidden = true
            }
        }
        checkForValidForm()
    }
    func invalidEmail(_ value: String) -> String?
    {
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        
        return nil
    }

    @IBAction func phone_act(_ sender: Any){
        if let textMobileNo = txtMobileNo.text{
            if let errorMessage = invalidPhoneNumber(textMobileNo)
            {
                lblErrorMobileNo.text = errorMessage
                lblErrorMobileNo.isHidden = false
            }
            else
            {
                lblErrorMobileNo.isHidden = true
            }
        }
        checkForValidForm()
    }
    func invalidPhoneNumber(_ value: String) -> String?
    {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set)
        {
            return "Phone Number must contain only digits"
        }
        
        if value.count != 10
        {
            return "Phone Number must be 10 Digits in Length"
        }
        return nil
    }

    @IBAction func pass_act(_ sender: Any){
        if let textPass = txtPassword.text{
            if let errorMessage = invalidPassword(textPass)
            {
                lblErrorPassword.text = errorMessage
                lblErrorPassword.isHidden = false
            }
            else
            {
                lblErrorPassword.isHidden = true
            }

        }
        checkForValidForm()
    }
    func invalidPassword(_ value: String) -> String?
    {
        if value.count < 8
        {
            return "Password must be at least 8 characters"
        }
        if containsDigit(value)
        {
            return "Password must contain at least 1 digit"
        }
        if containsLowerCase(value)
        {
            return "Password must contain at least 1 lowercase character"
        }
        if containsUpperCase(value)
        {
            return "Password must contain at least 1 uppercase character"
        }
        return nil
    }
    func containsDigit(_ value: String) -> Bool
    {
        let reqularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    func checkForValidForm(){
        if lblErrorName.isHidden && lblErrorEmail.isHidden && lblErrorMobileNo.isHidden && lblErrorPassword.isHidden{
            saveButton.isEnabled = true
        }
        else{
            saveButton.isEnabled = false
        }
    }


    @IBAction func btnSave(_ sender: Any) {
        resetForm()
//        if let textName = txtName.text, let textEmail = txtEmail.text,  let textMobileNo = txtMobileNo.text, let textPass = txtPassword.text{
//            if textName.isValidName() {
//               txtName.textColor = UIColor.black
//                lblErrorName.text = ""
//            } else {
//                txtName.textColor = UIColor.red
//                lblErrorName.text = "not valid name"
//            }
//            if textEmail.isValidEmail() {
//                txtEmail.textColor = UIColor.black
//                lblErrorEmail.text = ""
//            } else {
//                txtEmail.textColor = UIColor.red
//                lblErrorEmail.text = "not valid email"
//            }
//            if textMobileNo.filterPhoneNumber().isValidPhone() {
//                txtMobileNo.textColor = UIColor.black
//                lblErrorMobileNo.text = ""
//            } else {
//                txtMobileNo.textColor = UIColor.red
//                lblErrorMobileNo.text = "not valid phone"
//            }
//            if textPass.isValidPassword() {
//                txtPassword.textColor = UIColor.black
//                lblErrorPassword.text = "Strong Password"
//                lblErrorPassword.textColor = UIColor.green
//            } else {
//                txtPassword.textColor = UIColor.red
//                lblErrorPassword.text = "Weak password"
//                lblErrorPassword.textColor = UIColor.red
//            }
//        } else {
//
//        }
//
        
        
       
        
        
       
        
    }
    

}


extension String {
    
    
   
    
    
    
//    public func filterPhoneNumber() -> String {
//        return String(self.filter {!" ()._-\n\t\r".contains($0)})
//    }
}

