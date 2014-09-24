//
//  SignInViewController.swift
//  Carousel
//
//  Created by David Bellona on 9/22/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signInText: UIImageView!
    @IBOutlet weak var formBg: UIImageView!
    @IBOutlet weak var emailSignInTextField: UITextField!
    @IBOutlet weak var passwordSignInTextField: UITextField!
    @IBOutlet weak var signInForgetButtons: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    var signInMove:CGFloat = 90;
    var signInMoveButtons:CGFloat = 230;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get keyboard dimensions.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
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
            self.signInText.frame.origin.y = 74 - self.signInMove
            self.formBg.frame.origin.y = 158 - self.signInMove
            self.emailSignInTextField.frame.origin.y = 175 - self.signInMove
            self.passwordSignInTextField.frame.origin.y = 219 - self.signInMove
            self.signInForgetButtons.frame.origin.y = 439 - self.signInMoveButtons
            self.signInButton.frame.origin.y = 452 - self.signInMoveButtons
            self.forgotPasswordButton.frame.origin.y = 505 - self.signInMoveButtons

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
            self.signInText.frame.origin.y = 74
            self.formBg.frame.origin.y = 158
            self.emailSignInTextField.frame.origin.y = 175
            self.passwordSignInTextField.frame.origin.y = 219
            self.signInForgetButtons.frame.origin.y = 439
            self.signInButton.frame.origin.y = 452
            self.forgotPasswordButton.frame.origin.y = 505
            
            }, completion: nil)
    }
    
    // set alerts
    var alertViewReq = UIAlertView(title: "Email required", message: "Please enter your email address", delegate: nil, cancelButtonTitle: "OK")
    
    var alertViewSigningIn = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle: nil)
    
    var alertViewFailed = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password.", delegate: nil, cancelButtonTitle: "OK")
    
    func alertView(alertViewReq: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
        case 1:
            println("0")
        default:
            println("1")
        }
        
        // buttonIndex ranges from 1-n for the other buttons.
    }
    
    @IBAction func onClickSignInButton(sender: UIButton) {
        view.endEditing(true)
        if(self.emailSignInTextField.text == "") || (self.passwordSignInTextField.text == "") {
            alertViewReq.show()
        } else if (self.emailSignInTextField.text != "dbell") || (self.passwordSignInTextField.text != "pass") {
            alertViewSigningIn.show()
            delay(2, closure: { () -> () in
                self.alertViewSigningIn.dismissWithClickedButtonIndex(0, animated: true)
                self.alertViewFailed.show()
                }
            )
        } else {
            self.alertViewSigningIn.show()
            delay(2, closure: { () -> () in
                self.alertViewSigningIn.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("signInSegue", sender: self)
//                navigationController?.popToViewController(self.viewContro, animated: false)
                }
            )
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
