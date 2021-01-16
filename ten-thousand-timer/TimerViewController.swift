//
//  TimerViewController.swift
//  ten-thousand-timer
//
//  Created by 磯山椋太郎 on 2021/01/16.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var hours_label: UILabel!
    @IBOutlet weak var minutes_label: UILabel!
    @IBOutlet weak var seconds_label: UILabel!
    @IBOutlet weak var sub_seconds_label: UILabel!
    
    var counting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func fetchTime(){
        
    }
    
    @IBAction func tapTimer(_ sender: Any) {
        if counting {
            //止める処理
        }else{
            //動かす処理
        }
    }
    
}
