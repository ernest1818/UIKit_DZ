//
//  TimerViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 30.09.2022.
//

import UIKit

/// Контроллер отображения таймера
class TimerViewController: UIViewController {
    
    private lazy var hours = Array(0...23)
    private lazy var minutes = Array(0...59)
    
    @IBOutlet weak var timerPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

/// UIPickerViewDataSource
extension TimerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hours.count
        case 1:
            return minutes.count
        case 2:
            return minutes.count
        default:
            return 2
        }
    }
    
}

/// UIPickerViewDelegate
extension TimerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(hours[row])"
        case 1:
            return "\(minutes[row])"
        case 2:
            return "\(minutes[row])"
        default:
            return "very bad"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        25
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    attributedTitleForRow row: Int,
                    forComponent component: Int) -> NSAttributedString? {
            var attributedString: NSAttributedString?

            switch component {
            case 0:
                attributedString = NSAttributedString(string: "\(hours[row])",
                                                      attributes:
                                                      [NSAttributedString.Key.foregroundColor: UIColor.white])
            case 1:
                attributedString = NSAttributedString(string: "\(minutes[row])",
                                                      attributes:
                                                      [NSAttributedString.Key.foregroundColor: UIColor.white])
            case 2:
                attributedString = NSAttributedString(string: "\(minutes[row])",
                                                      attributes:
                                                      [NSAttributedString.Key.foregroundColor: UIColor.white])
            default:
                attributedString = nil
            }

            return attributedString
        }
}
