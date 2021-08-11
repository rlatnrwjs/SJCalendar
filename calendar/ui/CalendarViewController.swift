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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clickToYearBtn.setTitle(dataModel.setYearMonth(value: testDate(date: "202109")), for: .normal)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func testDate(date : String) -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMM"
        return formatter.date(from: date)!
    }

    func  setYearView(value:String) {
        // Year에 대한 text set
    }
    
    func  setMonthView(value:String){
        //month에 대한 text  set
    }
    
    
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
            return dataModel.dayTypeList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as!
            CalendarCollectionViewCell
        if indexPath.first == 0{
            switch days[indexPath.row]{
            case "일":
                cell.dayLabel.text = days[indexPath.row]
                cell.dayLabel.textColor = .red
            case "월":
                cell.dayLabel.text = days[indexPath.row]
            case "화":
                cell.dayLabel.text = days[indexPath.row]
            case "수":
                cell.dayLabel.text = days[indexPath.row]
            case "목":
                cell.dayLabel.text = days[indexPath.row]
            case "금":
                cell.dayLabel.text = days[indexPath.row]
            case "토":
                cell.dayLabel.text = days[indexPath.row]
                cell.dayLabel.textColor = .blue
            default:
                break
            }
        }else if indexPath.first == 1{
            switch dataModel.dayTypeList[indexPath.row]{
            case .blank:
                cell.dayLabel.text = ""
            case .normal:
                cell.dayLabel.text = "\(dataModel.days[indexPath.row])"
            case .saturday:
                cell.dayLabel.text = "\(dataModel.days[indexPath.row])"
                cell.dayLabel.textColor = .blue
            case .sunday:
                cell.dayLabel.text = "\(dataModel.days[indexPath.row])"
                cell.dayLabel.textColor = .red
            case .today:
                cell.dayLabel.text = "\(dataModel.days[indexPath.row])"
                cell.dayLabel.textColor = .white
                cell.layer.cornerRadius = ((collectionView.bounds.width) / 7) / 2
                cell.backgroundColor = .black
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (collectionView.bounds.width) / 7
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }

}

