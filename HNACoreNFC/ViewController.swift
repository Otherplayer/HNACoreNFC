//
//  ViewController.swift
//  HNACoreNFC
//
//  Created by __无邪_ on 2017/8/14.
//  Copyright © 2017年 __无邪_. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var btnDetect: UIButton!
    @IBOutlet weak var labResult: UILabel!
    
    let helper = HNANFCHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    func onNFCResult(success: Bool, msg: String) {
        DispatchQueue.main.async {
            self.labResult.text = "\(self.labResult.text!)\n\(msg)"
        }
    }
    
    @IBAction func didTapDetectAction(_ sender: Any) {
        self.labResult.text = ""
        helper.onNFCResult = onNFCResult(success:msg:)
        helper.restartSession()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

