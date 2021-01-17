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
    
    var timer = Timer()
    var count:float = 0
    var hours:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0
    var sub_seconds:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func fetchTime(){
        hours = UserDefaults.standard.integer(forKey: "hours")
        minutes = UserDefaults.standard.integer(forKey: "minutes")
        seconds = UserDefaults.standard.integer(forKey: "seconds")
        sub_seconds = UserDefaults.standard.integer(forKey: "sub_seconds")
    }
    
    @IBAction func tapTimer(_ sender: Any) {
        if !timer.isValid {
            //動かす処理
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: <#T##Selector#>, userInfo: nil, repeats: true)
        }else{
            //止める処理
        }
    }
    @objc func updateTimeLabel(){
        count += 0.01
        
    }
}
