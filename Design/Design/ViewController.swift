//
//  ViewController.swift
//  Design
//
//  Created by DAPL-Asset-210 on 16/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblBorderStartDate: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelforCardDetails: UILabel!
    @IBOutlet weak var labelforCoupon: UILabel!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var btnforApply: UIButton!
    @IBOutlet weak var btnforPay: UIButton!
    @IBOutlet weak var labelDateupdate: UILabel!
    @IBOutlet weak var labelChoosedate: UILabel!
    @IBOutlet weak var viewforbackgroundDate: UIView!
    @IBOutlet weak var chooseDate: UIDatePicker!
    @IBOutlet weak var labelforTODAY: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialShow ()
        changeDateafterSevenPM ()
    }
    
    func initialShow () {
        labelSetup(labels: lblBorderStartDate)
        labelSetup(labels: labelDateupdate)
        labelSetup(labels: labelforCardDetails)
        labelSetup(labels: labelforCoupon)
        buttonSetup(buttons: btnChange)
        buttonSetup(buttons: btnforPay)
        btnforApply.layer.cornerRadius = 3
        btnforApply.layer.borderWidth = 1
        btnforApply.layer.borderColor = UIColor.gray.cgColor
        viewforbackgroundDate.isHidden = true
        chooseDate.isHidden = true
    }
    
    func changeDateafterSevenPM () {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "dd-MM-yyyy"
        chooseDate.minimumDate = Date()
        let currentCalendar = Calendar.current
//        let currentComponents = currentCalendar.dateComponents([.hour, .minute], from: Date())
//        if currentComponents.hour == 16 && currentComponents.minute == 00 {
        let currentComponents = currentCalendar.dateComponents([.hour], from: Date())
        if currentComponents.hour ?? 00 >= 14  {
            if let tomorrow = currentCalendar.date(byAdding: .day, value: 1, to: Date()) {
                chooseDate.minimumDate = tomorrow
                labelDate.text = dateformat.string(from: tomorrow)
                labelforTODAY.text = dateformat.string(from: tomorrow)
                if let dayAftertomorrow = currentCalendar.date(byAdding: .day, value: 1, to:tomorrow ) {
                    chooseDate.minimumDate = dayAftertomorrow
                }
            }
        }
        else {
            labelDate.text = dateformat.string(from: Date())
            labelforTODAY.text = dateformat.string(from: Date())
            let calendar = Calendar.current
            if let nextDate = calendar.date(byAdding: .day, value: 1, to: Date()) {
                chooseDate.minimumDate = nextDate
            }
        }
    }
    
    func labelSetup(labels: UILabel) {
        labels.layer.cornerRadius = 10
        labels.layer.borderWidth = 2
        labels.layer.borderColor = UIColor.gray.cgColor
    }
    
    func buttonSetup (buttons: UIButton) {
        buttons.layer.cornerRadius = 10
        buttons.layer.borderWidth = 1
        buttons.layer.borderColor = UIColor.orange.cgColor
    }
    
    @IBAction func btnforDatepicker(_ sender: UIButton) {
        viewforbackgroundDate.isHidden = false
        chooseDate.isHidden = false
        chooseDate.layer.cornerRadius = 10
        chooseDate.layer.borderWidth = 2
        chooseDate.layer.borderColor = UIColor.orange.cgColor
    }
    
    @IBAction func btnforDatetaken(_ sender: UIDatePicker) {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "dd-MM-yyyy"
        let choosedate = dateformat.string(from: chooseDate.date)
        labelChoosedate.text = choosedate
        viewforbackgroundDate.isHidden = true
        chooseDate.isHidden = true
    }
    
    @IBAction func btnDismissDatePckr(_ sender: UIButton) {
        viewforbackgroundDate.isHidden = true
    }
    
}

