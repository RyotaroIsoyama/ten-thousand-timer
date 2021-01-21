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
    var hours:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0
    var sub_seconds:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchTime()
        firstSetLabel()
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
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(TimerViewController.updateTimeLabel), userInfo: nil, repeats: true)
        }else{
            //止める処理
            timer.invalidate()
            saveUserDefault()
        }
    }
    @objc func updateTimeLabel(){
        sub_seconds += 1
        if sub_seconds >= 100 {
            sub_seconds = 0
            seconds += 1
            if seconds >= 60{
                seconds = 0
                minutes += 1
                if minutes >= 60{
                    minutes = 0
                    hours += 1
                    hours_label.text = "\(hours)"
                }
                let minutes_label_text = makeLabelText(num: minutes)
                minutes_label.text = minutes_label_text
            }
            let seconds_label_text = makeLabelText(num: seconds)
            seconds_label.text = seconds_label_text
        }
        let sub_seconds_label_text = makeLabelText(num: sub_seconds)
        sub_seconds_label.text = sub_seconds_label_text
    }
    
    func firstSetLabel(){
        let sub_seconds_label_text = makeLabelText(num: sub_seconds)
        sub_seconds_label.text = sub_seconds_label_text
        let seconds_label_text = makeLabelText(num: seconds)
        seconds_label.text = seconds_label_text
        let minutes_label_text = makeLabelText(num: minutes)
        minutes_label.text = minutes_label_text
        hours_label.text = "\(hours)"
    }
    
    func saveUserDefault(){
        UserDefaults.standard.setValue(hours, forKey: "hours")
        UserDefaults.standard.setValue(minutes, forKey: "minutes")
        UserDefaults.standard.setValue(seconds, forKey: "seconds")
        UserDefaults.standard.setValue(sub_seconds, forKey: "sub_seconds")
    }
    
    func makeLabelText(num:Int) -> String{
        var labelText = "\(num)"
        if num/10 < 1 {
            labelText = "0\(num)"
        }
        return labelText
    }
}
