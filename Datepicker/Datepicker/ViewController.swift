//
//  ViewController.swift
//  Datepicker
//
//  Created by DAPL-Asset-210 on 11/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelDOB: UILabel!
    @IBOutlet weak var btnforDatepicker: UIButton!
    @IBOutlet weak var imageforbackground: UIImageView!
    @IBOutlet weak var imagevwfordatepicker: UIImageView!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialShow ()
    }

    func initialShow () {
        labelDOB.layer.cornerRadius = 10
        labelDOB.layer.borderWidth = 2
        labelDOB.layer.borderColor = UIColor.orange.cgColor
        imagevwfordatepicker.layer.cornerRadius = 20
        imageforbackground.isHidden = true
        imagevwfordatepicker.isHidden = true
        datepicker.isHidden = true
        datepicker.maximumDate = Date()
    }
    @IBAction func btnfordateChoose(_ sender: UIButton) {
        imageforbackground.isHidden = false
        imagevwfordatepicker.isHidden = false
        datepicker.isHidden = false
    }
    @IBAction func dateChoose(_ sender: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        let choosedate = format.string(from: datepicker.date)
        labelDOB.text = choosedate
        imageforbackground.isHidden = true
        imagevwfordatepicker.isHidden = true
        datepicker.isHidden = true
    }
}

