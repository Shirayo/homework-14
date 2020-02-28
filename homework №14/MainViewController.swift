//
//  ViewController.swift
//  homework №14
//
//  Created by Shirayo on 27.02.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, FillDataViewControllerDelegate {

    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = UserDefaults.standard.value(forKey: "createUser") as? User
        if let user = user {
            firstNameLabel.text = user.firstName
            lastNameLabel.text = user.lastName
            genderImage.image = user.profileImage
        } else {
            genderImage.image = UIImage(named: "empty")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fillDataViewController = segue.destination as! FillDataViewController
        fillDataViewController.modalPresentationStyle = .fullScreen
        fillDataViewController.delegate = self
    }
    
    func saveData(_ user: User) {
        firstNameLabel.text = user.firstName
        lastNameLabel.text = user.lastName
        genderImage.image = user.profileImage
    }
}


