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
    @IBOutlet weak var selectDateFrameView: UIView!
    @IBOutlet weak var clickToYearBtn: UIButton!
    @IBOutlet weak var clickToMonthBtn: UIButton!
    @IBOutlet weak var dotLabel: UILabel!
    var  dataModel = CalendarModel()
    var dayList = [0,0,0,4,5,6,7,1,2,3,4,5,6,7,1,2,3,4,5,6,7,1,2,3,4,5,6,7,1,2,3,4,5,6,7,0,0,0]
    
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

    

    func  setYearView(value:Int){
        // Year에 대한 text set
    }
    
    func  setMonthView(value:Int){
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

    
    // 월 선택시 클릭 이벤트
    @IBAction func clickToMonthBtn(_ sender: UIButton) {
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 7
        }else{
            return dayList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as!
            CalendarCollectionViewCell
        if indexPath.first == 0{
            switch indexPath.row{
            case 0:
                cell.dayLabel.text = "일"
                cell.dayLabel.textColor = .red
            case 1:
                cell.dayLabel.text = "월"
            case 2:
                cell.dayLabel.text = "화"
            case 3:
                cell.dayLabel.text = "수"
            case 4:
                cell.dayLabel.text = "목"
            case 5:
                cell.dayLabel.text = "금"
            case 6:
                cell.dayLabel.text = "토"
                cell.dayLabel.textColor = .blue
            default:
                break
            }
        }else if indexPath.first == 1{
            
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (collectionView.bounds.width) / 7
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }

}

