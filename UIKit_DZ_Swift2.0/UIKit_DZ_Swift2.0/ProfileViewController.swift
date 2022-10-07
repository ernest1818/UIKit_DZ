//
//  FirstViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 05.10.2022.
//

import UIKit

/// rkfcc
class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var serfImageView: UIImageView!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var imageSlider: UISlider!
    
    // MARK: - Public properties
    var name = ""
    var surName = ""
    var userName = ""
    let defaults = UserDefaults()
    
    // MARK: - life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        defaults.removeObject(forKey: "name")
//        defaults.removeObject(forKey: "pass")
//        defaults.removeObject(forKey: "userName")
//        defaults.removeObject(forKey: "surName")

    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        guard let name = defaults.string(forKey: "name") else { return }
        guard let surName = defaults.string(forKey: "surName") else { return }
        guard let userName = defaults.string(forKey: "userName") else { return }
        
        nameLabel.text = name
        surNameLabel.text = surName
        userNameLabel.text = userName
        
    }
    
    // MARK: - IBActions
    @IBAction func ageSliderAction(_ sender: Any) {
        ageLabel.text = "\(Int(ageSlider.value))"
    }
    
    @IBAction func imageSliderAction(_ sender: Any) {
        serfImageView.image = UIImage(named: "serf\(Int(imageSlider.value))")
    }
    
}
