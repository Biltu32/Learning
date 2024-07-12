//
//  SecondViewController.swift
//  LOGIN
//
//  Created by DAPL-Asset-210 on 07/05/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var profileimages: UIImageView!
    var dp : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimages.image = dp
    }
}


extension UIImageView {
    func enableZoom() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
        isUserInteractionEnabled = true
        addGestureRecognizer(pinchGesture)
    }
    
    @objc private func startZooming(_ sender: UIPinchGestureRecognizer){
        let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
        guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
        sender.view?.transform = scale
        sender.scale = 1
    }
}
