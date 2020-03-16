//
//  PaymentViewController.swift
//  Runner
//
//  Created by SunarcMac2 on 12/12/1398 AP.
//

import UIKit
import Flutter

class PaymentViewController: UIViewController {

    
    var flutterResult: FlutterResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Make payment"
    }
    
    
    @IBAction func success() {
        flutterResult("Payment successful")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func failed() {
        flutterResult("Payment Failed")
        self.navigationController?.popViewController(animated: true)
    }
    
}
