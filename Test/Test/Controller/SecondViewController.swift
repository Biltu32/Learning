//
//  SecondViewController.swift
//  Test
//
//  Created by DAPL-Asset-210 on 19/12/23.
//

import UIKit

struct Alldetails {
    var image : UIImage?
    var email : String?
    var dateofbirth: String?
    }

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var txtfldEmail: UITextField!
    @IBOutlet weak var labelDOB: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var datepickerforDOB: UIDatePicker!
    @IBOutlet weak var btnSAVE: UIButton!
    @IBOutlet weak var imgVwDatePicker: UIImageView!      // ekhane view niye korai vlo
    @IBOutlet weak var imgVwWhite: UIImageView!          // ekhane view niye korai vlo
    
    var profiledetailsAry : [Alldetails] = []
    var profileDetails = Alldetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtfldEmail.layer.cornerRadius = 10
        txtfldEmail.layer.borderWidth = 1
        labelDOB.layer.cornerRadius = 10
        labelDOB.layer.borderWidth = 1
        btnSAVE.layer.cornerRadius = 10
        btnSAVE.layer.borderWidth = 1
        spinner.hidesWhenStopped = true
        imgVwDatePicker.isHidden = true
        datepickerforDOB.isHidden = true
        imgVwWhite.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailPred.evaluate(with: email)
        return result
    }
    
    func showAlert(title:String,message:String) {
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnforImagepick(_ sender: UIButton) {
        let imagetaken = UIImagePickerController()
        imagetaken.delegate = self
        imagetaken.sourceType = .photoLibrary
        self.present(imagetaken, animated: true, completion: nil)
    }
    
    @IBAction func btnforDOBpick(_ sender: UIButton) {
        imgVwDatePicker.isHidden = false
        datepickerforDOB.isHidden = false
        imgVwWhite.isHidden = false
        self.datepickerforDOB.maximumDate = Date()
    }
    
    @IBAction func datepickerforDOB(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = formatter.string(from: datepickerforDOB.date)
        labelDOB.text = selectedDate
        imgVwDatePicker.isHidden = true
        datepickerforDOB.isHidden = true
        imgVwWhite.isHidden = true
    }
    
    @IBAction func btnSAVE(_ sender: UIButton) {
        if isValidEmail(email: txtfldEmail.text ?? "") != true {
            showAlert(title: "EMAIL", message: "Please Enter Your Email")
        }
        else {
            let mainstbd = UIStoryboard(name: "Main", bundle: Bundle.main)
            let nextpage = mainstbd.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            profileDetails.image = imageview.image
            profileDetails.email = txtfldEmail.text!
            profileDetails.dateofbirth = labelDOB.text!
            profiledetailsAry.append(profileDetails)
            nextpage.profiledetailsArray = profiledetailsAry
            self.navigationController?.pushViewController(nextpage, animated: true)
        }
    }
}


extension SecondViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedimage = info[.originalImage] as? UIImage {
            spinner.startAnimating()
            spinner.style = .large
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.spinner.stopAnimating()
                self.imageview.image = selectedimage
            }
        }
        else {
            print("Image not founded")
        }
        self.dismiss(animated: true, completion: nil)
    }
}

