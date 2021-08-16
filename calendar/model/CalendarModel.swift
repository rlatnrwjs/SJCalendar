//
//  CalendarModel.swift
//  calendar
//
//  Created by LEEPPIZIL on 2021/08/08.
//

import Foundation

enum dayType {
    case blank
    case today
    case saturday
    case sunday
    case normal
}

enum weekDay : Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
    case blank = 0
}

protocol CalendarProtocol {
    
    func getDateCount(month : Date) -> Int
    
    //Year를 클릭했을 떄 View에 드롭박스에 뜰 값들을 반환
    func getYearList() -> Array<Int>
    
    //Month를 클릭했을 떄 View에 드롭박스에 뜰 값들을 반환
    func getMonthList() -> Array<Int>
    
    // 최초 Calendar를 컨트롤 할 기본 값들을 초기화 하는 펑션
    func initCalendarInstance()
        
    func setYearMonth(value : Date) -> String
    
    func getStartDay(date : Date) -> weekDay
    
    func isToday(day : Int ) -> Bool
    
    func isSaturDay(day :Int) -> Bool
    
    func isSunDay(day : Int) -> Bool
    
    func getDayList(dayCount : Int, startDay : weekDay) -> Array<dayType>
    
//    func getYearMonth(date : Date) -> Int
    
//    func setMonth(value : Int)
    
//    func setDay(value : Int)
}


class CalendarModel : CalendarProtocol{
//    var currentYear : Int = 0
//    var currentMonth : Int = 0
//    var currentDay : Int = 0
    
    var cal = Calendar.current
    let formatter = DateFormatter()
    var components = DateComponents()
    let dateFormat = "yyyy . MM"
    let weekDays:[weekDay] = [.sunday,.monday,.tuesday,.wednesday,.thursday,.friday,.saturday]
    
    var dayTypeList: [dayType] = []
    var days:[Int] = []
    var daysCountInMonth = 0 // 해당 월이 며칠까지 있는지
    var startDay:weekDay = .sunday // 시작일
    var currentYearMonth = "" // 현재 년,월
    
    var today : Int{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return Int(formatter.string(from: Date()))!
    }
    
    init() {
        initCalendarInstance()
        formatter.dateFormat = dateFormat
    }

    func initCalendarInstance() {
        print("initCalendarInstance")
    }
    
    func isToday(day : Int) -> Bool {
        if currentYearMonth == formatter.string(from: Date()) && day == today{
            return true
        }else{
            return false
        }
    }
    
    func isSaturDay(day : Int) -> Bool {
        if (day + 1) % 7 == 0{
            return true
        }else{
            return false
        }
    }
    
    func isSunDay(day : Int) -> Bool {
        if (day + 1) % 7 == weekDay.sunday.rawValue{
            return true
        }else{
            return false
        }
    }
    
    func setYearMonth(value: Date) -> String{
        let dateString = formatter.string(from: value)
        currentYearMonth = dateString // 현재 년, 월 저장
        return dateString
    }
    
    func getStartDay(date : Date) -> weekDay {
        components.day = 1
        components.year = cal.component(.year, from: date)
        components.month = cal.component(.month, from: date)
        let startDayOfMonth = cal.date(from: components)
        let startWeekday = cal.component(.weekday, from: startDayOfMonth!) - 1 // [1:일,2:월,3:화,4:수,5:목,6:금,7:토]
        startDay = weekDays[startWeekday]
        printLog(location: "getStartDay", value: startDay)
        return startDay
    }
    
    func getDateCount(month: Date) -> Int {
        daysCountInMonth = cal.range(of: .day, in: .month, for: month)!.count
        return daysCountInMonth
    }
    
    func getDayList(dayCount : Int, startDay : weekDay) -> Array<dayType>{
        if startDay != weekDay.sunday{
            for _ in 1...(startDay.rawValue - 1){
                days.append(0)
            }
        }
        for i in 1...dayCount{
            days.append(i)
        }
        printLog(location: "getDayList", value: days)
        for (index, day) in days.enumerated(){
            if day == weekDay.blank.rawValue {
                dayTypeList.append(dayType.blank)
            }else if isToday(day: day) {
                dayTypeList.append(dayType.today)
            }else if isSaturDay(day: index) {
                dayTypeList.append(dayType.saturday)
            }else if isSunDay(day: index) {
                dayTypeList.append(dayType.sunday)
            }else {
                dayTypeList.append(dayType.normal)
            }
        }
        printLog(location: "getDayList", value: dayTypeList)
        return dayTypeList
    }

    func getYearList() -> Array<Int> {
        return []
    }
    
    func getMonthList() -> Array<Int> {
        return []
    }
    
    func printLog(location : String, value : Any){
        print("\(location) : \(value)")
    }

//    func getYearMonth(date: Date) -> Int {
//        return 0
//    }
    
//    func setMonth(value: Int) {
//
//    }
    
//    func getLastDay(dayCount : Int, date : Date) -> Int{
//        components.day = dayCount
//        components.year = cal.component(.year, from: date)
//        components.month = cal.component(.month, from: date)
//        let lastDayInMonth = cal.date(from: components)
//        let lastWeekday = cal.component(.weekday, from: lastDayInMonth!)
//        print(lastWeekday)
//        return lastWeekday
//    }
    
    
//    func setDay(value: Int) {
//
//    }
    
}
