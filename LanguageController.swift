//
//  LanguageController.swift
//  MovieApp
//
//  Created by pervın on 01.05.23.
//

import UIKit

class LanguageController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func cahangeLang(lang: String) {
        UserDefaults.standard.set(lang, forKey: "applang")
        titleLabel.text = "Language changed to \(lang)"
    }
    
    @IBAction func enButton(_ sender: Any) {
        cahangeLang(lang: "en")
        
    }
    
    
    @IBAction func azButton(_ sender: Any) {
        cahangeLang(lang: "az")

    }
    
    
    @IBAction func trButoon(_ sender: Any) {
        cahangeLang(lang: "tr")

    }
}
