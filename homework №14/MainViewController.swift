//
//  ViewController.swift
//  homework №14
//
//  Created by Shirayo on 27.02.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderImage.image = UIImage(named: "empty")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fillDataViewController = segue.destination as! FillDataViewController
        fillDataViewController.modalPresentationStyle = .fullScreen
        fillDataViewController.finishHandler = saveData
    }
    
    func saveData(firstName: String, lastName: String, genderImage: UIImage) {
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
        self.genderImage.image = genderImage
    }
}

