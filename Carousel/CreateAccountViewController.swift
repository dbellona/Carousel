//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by David Bellona on 9/23/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var createAccountText: UIImageView!
    @IBOutlet weak var createAccountFormBg: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var termsCheckbox: UIButton!
    @IBOutlet weak var termsText: UIImageView!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var createAccountButton: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    var URLPath = "https://www.dropbox.com/terms?mobile=1"
    
    
    var createAccountMove:CGFloat = 90;
    var creatAeccountButtons:CGFloat = 200;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get keyboard dimensions.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            self.createAccountText.frame.origin.y = 74 - self.createAccountMove
            self.createAccountFormBg.frame.origin.y = 159 - self.createAccountMove
            self.firstNameTextField.frame.origin.y = 171 - self.createAccountMove
            self.lastNameTextField.frame.origin.y = 216 - self.createAccountMove
            self.emailTextField.frame.origin.y = 260 - self.createAccountMove
            self.passwordTextField.frame.origin.y = 305 - self.createAccountMove
            self.termsCheckbox.frame.origin.y = 367 - self.createAccountMove
            self.termsText.frame.origin.y = 362 - self.createAccountMove
            self.termsButton.frame.origin.y = 362 - self.createAccountMove
            self.createAccountButton.frame.origin.y = 452 - self.creatAeccountButtons
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            self.createAccountText.frame.origin.y = 74
            self.createAccountFormBg.frame.origin.y = 159
            self.firstNameTextField.frame.origin.y = 171
            self.lastNameTextField.frame.origin.y = 216
            self.emailTextField.frame.origin.y = 260
            self.passwordTextField.frame.origin.y = 305
            self.termsCheckbox.frame.origin.y = 367
            self.termsText.frame.origin.y = 362
            self.termsButton.frame.origin.y = 362
             self.createAccountButton.frame.origin.y = 452
            
            }, completion: nil)
    }
    
    @IBAction func onClickCheckboxButton(sender: UIButton) {
        checkboxButton.selected = !checkboxButton.selected
        if (checkboxButton.selected == true) {
            
        }
    }
    
    @IBAction func onClickBackButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
