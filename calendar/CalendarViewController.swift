//
//  CalendarViewController.swift
//  calendar
//
//  Created by sookjeon on 2021/08/07.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // 해당 월 표시 및 버튼 생성
    func headerLayout(){
        
    }
    
    // 년, 월 계산
    func getYearMonth(date : Date) -> Int{
        var month = 1
        return getDateCount(month: month)
    }
    
    // 계산된 년, 월로 일수 계산
    func getDateCount(month : Int) -> Int{
        return 0
    }
    
    // 이전달 버튼 클릭
    func preButtonClickEvent(){
        
    }
    
    // 다음달 버튼 클릭
    func nextButtonClickEvent(){
        
    }
    
    // 오늘 표시
    func today(){
        
    }
    
    // 년도 선택시 클릭 이벤트
    func selectYear(){
        // getYearMonth(date: Date())
    }
    
    // 월 선택시 클릭 이벤트
    func selectMonth(){
        // getYearMonth(date: Date())
    }
    
    // 컬렉션뷰 생성
    

}

