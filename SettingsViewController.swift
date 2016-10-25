//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Stephan Charbit on 10/23/16.
//  Copyright © 2016 Stephan Charbit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapSignOut(_ sender: AnyObject) {
        let signoutAlertController = UIAlertController(title: "", message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        // create an OK action
        let OKAction = UIAlertAction(title: "Log Out", style: .default) { (action) in
            self.performSegue(withIdentifier: "logoutSegue", sender: nil)
        }
        // add the OK action to the alert controller
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
        }
        signoutAlertController.addAction(OKAction)
        signoutAlertController.addAction(cancelAction)
        self.present(signoutAlertController, animated: true)
        // optional code for what happens after the alert controller has finished presenting
    }
    
    @IBAction func didTapCancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
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
