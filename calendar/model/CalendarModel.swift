//
//  CalendarModel.swift
//  calendar
//
//  Created by LEEPPIZIL on 2021/08/08.
//

import Foundation

protocol CalendarProtocol {
    
    func getDateCount(month : Date) -> Int
    func getYearMonth(date : Date) -> Int
    
    //Year를 클릭했을 떄 View에 드롭박스에 뜰 값들을 반환
    func getYearList() -> Array<Int>
    //Month를 클릭했을 떄 View에 드롭박스에 뜰 값들을 반환
    func getMonthList() -> Array<Int>
    
    // 최초 Calendar를 컨트롤 할 기본 값들을 초기화 하는 펑션
    func initCalendarInstance()
        
    func setYearMonth(value : Date) -> String
    
//    func setMonth(value : Int)
    
    func setDay(value : Int)
    
    
    func isToday(day : String ) -> Bool
    
    func isSaturDay(day :Int) -> Bool
    
    func isSunDay(day : Int) -> Bool
    
}


class CalendarModel : CalendarProtocol{
    enum dayType {
        case blank
        case today
        case saturday
        case sunday
        case normal
    }
//    var calendarInstance : Calendar
    var currentYear : Int = 0
    var currentMonth : Int = 0
    var currentDay : Int = 0
    let dateFormat = "yyyy . MM"
    
    var cal = Calendar.current
    let formatter = DateFormatter()
    var components = DateComponents()
    var dayTypeList: [dayType] = []
    var days:[Int] = []
    var daysCountInMonth = 0 // 해당 월이 며칠까지 있는지
    var weekdayAdding = 0 // 시작일
    var isToday = true
    
    init() {
        initCalendarInstance()
    }

    func initCalendarInstance() {
        print("initCalendarInstance")
        formatter.dateFormat = dateFormat
    }
    
    func isSaturDay(day : Int) -> Bool {
        return true
    }
    
    func isSunDay(day : Int) -> Bool {
        return true
    }
    

    
    func setYearMonth(value: Date) -> String{
        let dateString = formatter.string(from: value)
        isToday = isToday(day: dateString)
        getFirstDay(date: dateString)
        return dateString
    }
    
//    func setMonth(value: Int) {
//
//    }
    
    func setDay(value: Int) {
        
    }
    
    func getFirstDay(date : String) -> Int {
        let date = formatter.date(from: date)
        components.day = 1
        components.year = cal.component(.year, from: date!)
        components.month = cal.component(.month, from: date!)
        let firstDayOfMonth = cal.date(from: components)
        let firstWeekday = cal.component(.weekday, from: firstDayOfMonth!)
        weekdayAdding = firstWeekday
        getDateCount(month: firstDayOfMonth!)
        return firstWeekday
    }
    
//    func getLastDay(dayCount : Int, date : Date) -> Int{
//        components.day = dayCount
//        components.year = cal.component(.year, from: date)
//        components.month = cal.component(.month, from: date)
//        let lastDayInMonth = cal.date(from: components)
//        let lastWeekday = cal.component(.weekday, from: lastDayInMonth!)
//        print(lastWeekday)
//        return lastWeekday
//    }
    
    func getToday()->Int{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return Int(formatter.string(from: Date()))!
    }
    
    func isToday(day : String) -> Bool {
        if day == formatter.string(from: Date()){
            return true
        }
        return false
    }
    
    func getYearList() -> Array<Int> {
        return []
    }
    
    func getMonthList() -> Array<Int> {
        return []
    }
    
    func getDateCount(month: Date) -> Int {
        daysCountInMonth = cal.range(of: .day, in: .month, for: month)!.count
        getDayList(dayCount: daysCountInMonth, firstDay: weekdayAdding)
        return daysCountInMonth
    }
    
    func getDayList(dayCount : Int, firstDay : Int) -> Array<dayType>{
        if 7 - firstDay != 6{
            for _ in 1...firstDay-1{
                days.append(0)
            }
        }
        for i in 1...dayCount{
            days.append(i)
        }
        print(days)
        for (index, day) in days.enumerated(){
            if day == 0{
                dayTypeList.append(dayType.blank)
            }else if day == getToday() && isToday == true{
                dayTypeList.append(dayType.today)
            }else if (index + 1) % 7 == 0{
                dayTypeList.append(dayType.saturday)
            }else if (index + 1) % 7 == 1{
                dayTypeList.append(dayType.sunday)
            }else{
                dayTypeList.append(dayType.normal)
            }
        }
        print(dayTypeList)
        return dayTypeList
    }

    func getYearMonth(date: Date) -> Int {
        return 0
    }
    
}
