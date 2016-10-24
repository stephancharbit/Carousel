//
//  ConversationsViewController.swift
//  Carousel
//
//  Created by Stephan Charbit on 10/23/16.
//  Copyright © 2016 Stephan Charbit. All rights reserved.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDismiss(_ sender: AnyObject) {
        navigationController?.popToRootViewController(animated: true)
    }

    /*
    // MARK: - Navigationz

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
