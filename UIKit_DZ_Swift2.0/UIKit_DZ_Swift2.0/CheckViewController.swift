//
//  CheckViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 25.09.2022.
//

import UIKit

/// CheckViewController
final class CheckViewController: UIViewController {

    @IBOutlet weak var clientLabel: UILabel!
    @IBOutlet weak var numberTabLabel: UILabel!
    @IBOutlet weak var guestCountLabel: UILabel!
    
    @IBOutlet weak var bookingLabel: UILabel!
    @IBOutlet weak var prepaymentLabel: UILabel!
    @IBOutlet weak var vipRoomLabel: UILabel!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    var name = ""
    var numberTab = ""
    var guestCount = ""
    
    var booking = "0"
    var prepayment = "0"
    var vipRoom = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookingInt = Int(booking)
        let prepayInt = Int(prepayment)
        let vipInt = Int(vipRoom)
        
        clientLabel.text = (clientLabel.text ?? "") + " " + name
        numberTabLabel.text = (numberTabLabel.text ?? "") + " " + numberTab
        guestCountLabel.text = (guestCountLabel.text ?? "") + " " + guestCount
        
        bookingLabel.text = booking
        prepaymentLabel.text = prepayment
        vipRoomLabel.text = vipRoom
        
        sumLabel.text = "Итого: \( 700 + (bookingInt ?? 0) - (prepayInt ?? 0) + (vipInt ?? 0))"
    }
}
