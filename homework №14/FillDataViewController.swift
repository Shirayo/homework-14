//
//  FillDataViewController.swift
//  homework №14
//
//  Created by Shirayo on 28.02.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class FillDataViewController: UIViewController {

    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var finishHandler: ((String, String, UIImage) -> Void)?


    @IBAction func backButtonDidClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonDidClick(_ sender: Any) {
        if firstNameText.text == "" || lastNameText.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Fields are empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default) { (action) in }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else {
            let image = getImage()
            finishHandler?(firstNameText.text!, lastNameText.text!, image)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func getImage() -> UIImage{
        switch genderSegmentControl.selectedSegmentIndex {
        case 0:
            return UIImage(named: "male")!
        case 1:
            return UIImage(named: "female")!
        case 2:
            return UIImage(named: "helicopter")!
        default:
            return UIImage(named: "male")!
        }
        
    }
}
