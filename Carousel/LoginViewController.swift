//
//  LoginViewController.swift
//  Carousel
//
//  Created by Stephan Charbit on 10/18/16.
//  Copyright © 2016 Stephan Charbit. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var login: UIImageView!
    @IBOutlet weak var loginNavBar: UIImageView!
    
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        // Set the scroll view content size
        scrollView.contentSize = scrollView.frame.size
        // Set the content insets
        scrollView.contentInset.bottom = 100
        // Do any additional setup after loading the view.
        activityIndicator.stopAnimating()
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
            // Move the button up above keyboard
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            // Scroll the scrollview up
            self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
            self.buttonParentView.frame.origin.y = self.buttonInitialY
            // Scroll the scrollview up
            self.scrollView.contentOffset.y = 0
        }
        
        
        
    }
    
    
    // The scrollView is in the process of scrolling...
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    // The keyboard is about to be hidden...
    func keyboardWillHide(notification: NSNotification) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    
    // The main view is about to appear...
    override func viewWillAppear(_ animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animate(withDuration: 0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.loginNavBar.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    @IBAction func didTapBackBtn(_ sender: AnyObject) {
            navigationController!.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLoginButton(_ sender: AnyObject) {
        if (passwordField.text?.isEmpty)! || (emailField.text?.isEmpty)! {
            let emailAlertController = UIAlertController(title: "Email and Password Required", message: "Please enter an email and password", preferredStyle: .alert)
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            // add the OK action to the alert controller
            emailAlertController.addAction(OKAction)
            self.present(emailAlertController, animated: true)
            // optional code for what happens after the alert controller has finished presenting
        }
        else {
            activityIndicator.startAnimating()
            if emailField.text == "kingsley" && passwordField.text == "password" {
                // Delay for 2 second.
                delay(2, closure: { () -> () in
                    // Stop animating the activity indicator.
                    self.activityIndicator.stopAnimating()
                    //self.performSegueWithIdentifier("yourSegue", sender: nil)
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let tutorialVC = mainStoryboard.instantiateViewController(withIdentifier: "tutorialVC")
                    self.present(tutorialVC, animated: true, completion: nil)
                })
                // Otherwise, email or password are incorrect so...
            } else {
                // Delay for 2 second
                delay(2, closure: { () -> () in
                    // Stop animating the activity indicator.
                    self.activityIndicator.stopAnimating()
                    // Create and Show UIAlertController...see guide, Using UIAlertController
                    let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid email and pasword", preferredStyle: .alert)
                    // create a cancel action
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                })
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
