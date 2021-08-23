//
//  CalendarViewController.swift
//  calendar
//
//  Created by sookjeon on 2021/08/07.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var clickToBackwardBtn: UIButton!
    @IBOutlet weak var clickToForwardBtn: UIButton!
    @IBOutlet weak var clickToYearBtn: UIButton!
    var  dataModel = CalendarModel()
    let days = ["일","월","화","수","목","금","토"]
    let weekNameViewType = 0
    let dayViewType = 1
    var dateCount = 0
    var startDay = weekDay.sunday
    var currentDate = Date()
    let buttonTitle = "선택완료"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCalendarData(date: Date())
    }
    
    func getCalendarData(date : Date){
        setYearMonthView(value: dataModel.setYearMonth(value: date))
        collectionView.reloadData()
    }
    
    func  setYearMonthView(value:String) {
        // Year에 대한 text set
        clickToYearBtn.setTitle(value, for: .normal)
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


    
    // 이전달 버튼 클릭
    //재강 : 동일한 성격의 이벤트는 네이밍을 최대한 통일
    @IBAction func clickToBackwardBtn(_ sender: UIButton) {
        currentDate = dataModel.updateDate(date: currentDate, month: -1)
        getCalendarData(date: currentDate)
    }
    
    
    // 다음달 버튼 클릭
    //재강 : 동일한 성격의 이벤트는 네이밍을 최대한 통일
    @IBAction func clickToForwardBtn(_ sender: UIButton) {
        currentDate = dataModel.updateDate(date: currentDate, month: 1)
        getCalendarData(date: currentDate)
    }
 
    // 년도 선택시 클릭 이벤트
    @IBAction func clickToYearBtn(_ sender: UIButton) {
        makeDatePicker()
    }

    func makeDatePicker(){
        let dateChooserAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let datePicker = UIDatePicker()
        print(currentDate)
        datePicker.date = currentDate
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.locale = NSLocale(localeIdentifier: "ko_KO") as Locale
        dateChooserAlert.view.addSubview(datePicker)
        dateChooserAlert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        // constraint
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.centerXAnchor.constraint(equalTo: dateChooserAlert.view.centerXAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: dateChooserAlert.view.centerYAnchor).isActive = true
        dateChooserAlert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { [weak self] (action) in
            self?.getCalendarData(date: datePicker.date)
            self?.currentDate = datePicker.date
        }))
        self.present(dateChooserAlert, animated: true, completion: nil)
    }
    
    // 컬렉션뷰 생성
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return days.count
        }else{
            return dataModel.getDayList(date : currentDate).count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as!
            CalendarCollectionViewCell
        cell.dayLabel.text = ""
        cell.dayLabel.textColor = .black
        cell.backgroundColor = .clear
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

