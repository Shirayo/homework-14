//
//  FillDataViewController.swift
//  homework №14
//
//  Created by Shirayo on 28.02.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

protocol FillDataViewControllerDelegate: AnyObject {
    func saveData(_ user: User)
//    func error()
}


class FillDataViewController: UIViewController {

    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    
    weak var delegate: FillDataViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var finishHandler: ((User) -> Void)?


    @IBAction func backButtonDidClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonDidClick(_ sender: Any) {
        if firstNameText.text == "" || lastNameText.text == "" {
            showError()
        } else {
            let user = User(firstName: firstNameText.text!, lastName: lastNameText.text!, profileImage: getImage())
//          finishHandler?(user)
            delegate?.saveData(user)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func getImage() -> UIImage {
        switch genderSegmentControl.selectedSegmentIndex {
        case 0:
            return UIImage(named: "male")!
        case 1:
            return UIImage(named: "female")!
        case 2:
            return UIImage(named: "helicopter")!
        default:
            return UIImage(named: "empty")!
        }
    }
}

extension UIViewController  {
    func showError() {
        let alertController = UIAlertController(title: "Error", message: "Fields are empty", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
