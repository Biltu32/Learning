//
//  ViewController.swift
//  LOGIN
//
//  Created by DAPL-Asset-210 on 06/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldEmail: UITextField!
    @IBOutlet weak var txtfldPhonenumber: UITextField!
    @IBOutlet weak var labelforDOB: UILabel!
    @IBOutlet weak var txtfldPassword: UITextField!
    @IBOutlet weak var datepickerView: UIView!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var btnforOutsideClick: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtfldName.becomeFirstResponder()
    }
    
    func initialSetup() {
        datepickerView.isHidden = true
        datepicker.isHidden = true
        btnforOutsideClick.isHidden = true
        datepicker.maximumDate = Date()
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.layer.borderWidth = 4
        profileImage.layer.borderColor = UIColor.orange.cgColor
    }
    
    @IBAction func btnforDatepickerOPEN(_ sender: Any) {
        btnforOutsideClick.isHidden = false
        datepickerView.isHidden = false
        datepicker.isHidden = false
    }
    
    @IBAction func btnforLogIN(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nextpage = mainStoryboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        nextpage.dp = profileImage.image
        navigationController?.pushViewController(nextpage, animated: true)
    }
    
    @IBAction func btnforOutsideclick(_ sender: Any) {
        datepickerView.isHidden = true
        datepicker.isHidden = true
        btnforOutsideClick.isHidden = true
    }
    
    @IBAction func chooseDate(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: datepicker.date)
        labelforDOB.text = selectedDate
        btnforOutsideClick.isHidden = true
        datepickerView.isHidden = true
        datepicker.isHidden = true
    }
    
    
    @IBAction func btnforImagepick(_ sender: Any) {
        let imagetaken = UIImagePickerController()
        imagetaken.delegate = self
        imagetaken.sourceType = .photoLibrary
        self.present(imagetaken, animated: true, completion: nil)
    }
    
    
    
}



extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedimage = info[.originalImage] as? UIImage {
                self.profileImage.image = selectedimage
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}


