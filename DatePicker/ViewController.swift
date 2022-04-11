//
//  ViewController.swift
//  DatePicker
//
//  Created by macbook on 2022/04/12.
//
/**
 printing current time and the time that i select on label
 add timer function
 
 사용한 명령문:
 DateFormatter() : 날짜의 포맷을 정햊주는 함수
 이렇게 사용 -> formatter.dateFormat = "yyyy(년)-MM(월)-dd(일) HH(시간) : mm(분) EEE(요일)"
 
-NSDate() : 현재 시간 데이터를 가져오는 함수, 이 함수를 변수에 인가하고 사용할때 "as Date"가 필요하다.. "as Date"를 빼고 실행했을때 에러 : 'NSDate' is not implicitly convertible to 'Date' : 'NSDate'는 'Date'로 암묵적으로 변환할 수 없습니다.

 timeInterval : 타이머 간격, target : 동작될 view, selector : 타이머가 동작될 때 실행할 함수, userInfo : 사용자 정보, repeat : 반복 여부

 -ViewController클래스 안에 updateTime 함수를 사용하기 위해 ViewController.updateTime 요렇게 #selector 요건 뭐냐?
*/
import UIKit

class ViewController: UIViewController {
    let timeSelector : Selector = #selector(ViewController.updateTime)
    
    let interval = 1.0
    var count = 0
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let dataPickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm EEE yyyy-MMMM-dd "
        lblPickerTime.text = "선택시간: " + formatter.string(from: dataPickerView.date)
        
    }
    
    @objc func updateTime(){
        //lblCurrentTime.text = String(count)
        //count += 1
        let date = NSDate()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm s"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
}
