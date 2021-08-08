//
//  CalendarViewController.swift
//  calendar
//
//  Created by sookjeon on 2021/08/07.
//

import UIKit

class CalendarViewController: UIViewController {

    var  dataModel : CalendarModel
    
    
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
    
    
    init() {
        dataModel = CalendarModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 해당 월 표시 및 버튼 생성
    func headerLayout(){
        
    }
    
    func  setYearView(value:Int){
        // Year에 대한 text set
    }
    
    func  setMonthView(value:Int){
        //month에 대한 text  set
    }
    
    
    // 이전달 버튼 클릭
    //재강 : 동일한 성격의 이벤트는 네이밍을 최대한 통일
    func clickToBackwardBtn(){
        
    }
    
    // 다음달 버튼 클릭
    //재강 : 동일한 성격의 이벤트는 네이밍을 최대한 통일
    func clickToForwardBtn(){
        
    }
 
    // 년도 선택시 클릭 이벤트
    func clickToYearBtn(){
        // getYearMonth(date: Date())
    }
    
    // 월 선택시 클릭 이벤트
    func clickToMonthBtn(){
        // getYearMonth(date: Date())
    }
    
    
    //각 칸의 리스트를 그리기 위한 펑션
    func drawEachDayView(){
        
    }
    
    //해당 칸의 버튼 ? 또는 텍스트뷰? 를 전달해서 그 컬러나 상태값을 세팅
    // Any로 뷰의 타입을 둔건, 제가 IOS의 컴포넌트를 몰라서 그러니 추후에 변경 바람
    func setTodayViewState(view : Any, day : Int){
        //오늘
    }
    
    func setSaturDayViewState(view : Any, day : Int){
        
    }
    
    func setSundayViewState(view : Any , day : Int){
        
        
    }
    
    
    // 컬렉션뷰 생성
    

}

