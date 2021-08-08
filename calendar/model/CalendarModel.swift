//
//  CalendarModel.swift
//  calendar
//
//  Created by LEEPPIZIL on 2021/08/08.
//

import Foundation

protocol CalendarProtocol {
    
    func getDateCount(month : Int) -> Int
    func getYearMonth(date : Date) -> Int
    
    //Year를 클릭했을 떄 View에 드롭박스에 뜰 값들을 반환
    func getYearList() -> Array<Int>
    //Month를 클릭했을 떄 View에 드롭박스에 뜰 값들을 반환
    func getMonthList() -> Array<Int>
    
    // 최초 Calendar를 컨트롤 할 기본 값들을 초기화 하는 펑션
    func initCalendarInstance()
        
    func setYear(value : Int)
    
    func setMonth(value : Int)
    
    func setDay(value : Int)
    
    
    func isToday(day : Int ) -> Bool
    
    func isSaturDay(day :Int) -> Bool
    
    func isSunDay(day : Int) -> Bool
    
}


class CalendarModel : CalendarProtocol{
    
    var calendarInstance : Calendar
    
    var currentYear : Int
    var currentMonth : Int
    var currentDay : Int
    
    
    
    init() {
        initCalendarInstance()
    }
        
    
    func initCalendarInstance() {
        
    }
    
    
    
    func isSaturDay(day : Int) -> Bool {
        <#code#>
    }
    
    func isSunDay(day : Int) -> Bool {
        <#code#>
    }
    
    func isToday(day : Int) -> Bool {
        <#code#>
    }
    
       
    func setYear(value: Int) {
        <#code#>
    }
    
    func setMonth(value: Int) {
        <#code#>
    }
    
    func setDay(value: Int) {
        <#code#>
    }
    
 

    
    func getYearList() -> Array<Int> {
        
    }
    
    func getMonthList() -> Array<Int> {
        <#code#>
    }
    
    func getDateCount(month: Int) -> Int {
        var month = 1
        return getDateCount(month: month)
    }
    
    func getYearMonth(date: Date) -> Int {
        return 0
    }
    
    
    
    
    
}
