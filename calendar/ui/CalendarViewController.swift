//
//  CalendarViewController.swift
//  calendar
//
//  Created by sookjeon on 2021/08/07.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var clickToBackwardBtn: UIButton!
    @IBOutlet weak var clickToForwardBtn: UIButton!
    @IBOutlet weak var clickToYearBtn: UIButton!
    var  dataModel = CalendarModel()
    let days = ["일","월","화","수","목","금","토"]
    let weekNameViewType = 0
    let dayViewType = 1
    var dateCount = 0
    var startDay = weekDay.sunday
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setYearMonthView(value: dataModel.setYearMonth(value: testDate()))
        startDay = dataModel.getStartDay(date: testDate())
        dateCount = dataModel.getDateCount(month: testDate())
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func testDate() -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMM"
        return formatter.date(from: "202108")!
    }

    func  setYearMonthView(value:String) {
        // Year에 대한 text set
        clickToYearBtn.setTitle(value, for: .normal)
    }
    
//    func  setMonthView(value:String){
//        //month에 대한 text  set
//    }
    
    
    // 이전달 버튼 클릭
    //재강 : 동일한 성격의 이벤트는 네이밍을 최대한 통일
    @IBAction func clickToBackwardBtn(_ sender: UIButton) {
    }
    
    
    // 다음달 버튼 클릭
    //재강 : 동일한 성격의 이벤트는 네이밍을 최대한 통일
    @IBAction func clickToForwardBtn(_ sender: UIButton) {
    }
 
    // 년도 선택시 클릭 이벤트
    @IBAction func clickToYearBtn(_ sender: UIButton) {
    }

    
//    // 월 선택시 클릭 이벤트
//    @IBAction func clickToMonthBtn(_ sender: UIButton) {
//    }
    
    
    
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 7
        }else{
            return dataModel.getDayList(dayCount: dateCount, startDay: startDay).count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as!
            CalendarCollectionViewCell
        if indexPath.first == weekNameViewType{
            setWeekDay(row: indexPath.row, label: cell.dayLabel)
        }else if indexPath.first == dayViewType{
            setDay(row: indexPath.row, label: cell.dayLabel, cell: cell)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (collectionView.bounds.width) / 7 // 디바이스 크기에 따라 가변적으로 컬렉션뷰 셀의 크기를 정하기 위해 CollectionView의 가로 길이를 구해서 7로 나눔
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }

    // 컬렉션뷰 요일
    func setWeekDay(row : Int, label : UILabel){
        switch days[row]{
        case "일":
            label.text = days[row]
            label.textColor = .red
        case "월":
            label.text = days[row]
        case "화":
            label.text = days[row]
        case "수":
            label.text = days[row]
        case "목":
            label.text = days[row]
        case "금":
            label.text = days[row]
        case "토":
            label.text = days[row]
            label.textColor = .blue
        default:
            break
        }
    }
    // 컬렉션뷰 날짜
    func setDay(row : Int, label : UILabel, cell : UICollectionViewCell){
        switch dataModel.dayTypeList[row]{
        case .blank:
            label.text = ""
        case .normal:
            label.text = "\(dataModel.days[row])"
        case .saturday:
            label.text = "\(dataModel.days[row])"
            label.textColor = .blue
        case .sunday:
            label.text = "\(dataModel.days[row])"
            label.textColor = .red
        case .today:
            label.text = "\(dataModel.days[row])"
            label.textColor = .white
            cell.layer.cornerRadius = (cell.bounds.width) / 2 // 정사각형을 원으로 만들기 위해 한변의 길이의 반을 radius 값으로 주었음
            cell.backgroundColor = .black
        }
    }
}

