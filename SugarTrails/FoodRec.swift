//
//  FoodRec.swift
//  SugarTrails
//
//  Created by Jessica Joseph on 1/23/16.
//  Copyright © 2016 Jessica Joseph. All rights reserved.
//

import UIKit
import Alamofire

class FoodRec: UIViewController, UITextFieldDelegate{
    
    @IBAction func submit(sender: AnyObject) {
    }
    let serverURL = "https://jnj-dev.apigee.net/otr/v1/patient/-/healthdata/search?type=bloodGlucose,bolusInsulin,exercise,food&startDate=2016-01-03T00%3A00%3A00&endDate=2016-01-23T03%3A46%3A48&limit=5000&offset=0"
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        username.delegate = self
        password.delegate = self
        
        
        let headers = [
            "Authorization": "Bearer 7obv5AlUXBlrAz8VnHv7vhIr16SG"
        ]
        
        //Server Request
        Alamofire.request(.GET, serverURL, headers:headers)
            .responseJSON { response in

                if let JSON = response.result.value {
                    print("JSON: \n \(JSON["bloodGlucose"]!)")
                }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
}
