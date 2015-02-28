//
//  paymentsViewController.swift
//  Surprise
//
//  Created by Evan Baumgardner on 2/28/15.
//  Copyright (c) 2015 Fairmount Park. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController, PayPalPaymentDelegate {
    var config = PayPalConfiguration()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        PayPalMobile.preconnectWithEnvironment(PayPalEnvironmentNoNetwork)
    }
   
    @IBOutlet weak var nameField: UITextField?
    @IBOutlet weak var addressField: UITextField?
    @IBOutlet weak var addressTwoField: UITextField?
    @IBOutlet weak var cityField: UITextField?
    @IBOutlet weak var stateField: UITextField?
    @IBOutlet weak var zipField: UITextField?
    
    @IBAction func getPaid (sender: UIButton) {
        
        let amount = NSDecimalNumber(string: "9.99")
        
        //println("amount \(amount)")
        
        var payment = PayPalPayment()
        payment.amount = amount
        payment.currencyCode = "USD"
        payment.shortDescription = "Surprise Charge"
        
        var didWeGetTheMoney = payment.processable
        
        if(didWeGetTheMoney)
        {
            showSuccess()
        }
        else
        {
            showBummer()
        }
        
    }
    
    func showSuccess () {
        let alert = UIAlertController(title: "Payment Received",
            message: "Thanks a lot - SUCKER!",
            preferredStyle: .Alert)
        
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(alertAction)
        
        presentViewController(alert, animated: true, completion: nil)

        
    }
    
    func showBummer () {
        let alert = UIAlertController(title: "Payment Failed",
            message: "Thanks for nothing - Jerk!",
            preferredStyle: .Alert)
        
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(alertAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController!, didCompletePayment completedPayment: PayPalPayment!) {
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController!) {
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

