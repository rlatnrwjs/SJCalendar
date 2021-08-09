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
    
//    var calendarInstance : Calendar
    var currentYear : Int = 0
    var currentMonth : Int = 0
    var currentDay : Int = 0
    
    
    
    init() {
        initCalendarInstance()
    }
        
    
    func initCalendarInstance() {
        
    }
    
    
    
    func isSaturDay(day : Int) -> Bool {
        return true
    }
    
    func isSunDay(day : Int) -> Bool {
        return true
    }
    
    func isToday(day : Int) -> Bool {
        return true
    }
    
       
    func setYear(value: Int) {
        
    }
    
    func setMonth(value: Int) {
        
    }
    
    func setDay(value: Int) {
        
    }
    
 

    
    func getYearList() -> Array<Int> {
        return []
    }
    
    func getMonthList() -> Array<Int> {
        return []
    }
    
    func getDateCount(month: Int) -> Int {
        var month = 1
        return getDateCount(month: month)
    }
    
    func getYearMonth(date: Date) -> Int {
        return 0
    }
    
    
    
    
    
}
