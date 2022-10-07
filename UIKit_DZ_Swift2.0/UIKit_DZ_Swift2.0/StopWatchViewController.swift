//
//  StopWatchViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// Экран  секундомера
final class StopWatchViewController: UIViewController {

// MARK: - Constans
    private enum Constans {
        static let start = "Cтарт"
        static let pause = "Пауза"
        static var fraction = 0
        static var seconds = 0
        static var minutes = 0
        static let zeroTextLabel = "00:00"
        static let zeroFractionLabel = ".00"
        static let customStartButtonTitle = NSMutableAttributedString(string: start, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25),
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue])
        static let customPauseButtonTitle = NSMutableAttributedString(string: pause, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25),
            NSAttributedString.Key.foregroundColor: UIColor.red])
    }
    
// MARK: - IBOutlet
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var fractionLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
// MARK: - Private Properties
    private lazy var timer = Timer()
    private lazy var timerCounting = false
    
// MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
// MARK: - IBAction
    @IBAction func startStopAction(_ sender: Any) {
        if timerCounting {
            pauseButton()
        } else {
            startButton()
        }
    }
    
    @IBAction func resetAction(_ sender: Any) {
        Constans.fraction = 0
        Constans.seconds = 0
        Constans.minutes = 0
        timerLabel.text = Constans.zeroTextLabel
        fractionLabel.text = Constans.zeroFractionLabel
        timerCounting = false
        startStopButton.setAttributedTitle(Constans.customStartButtonTitle, for: .normal)
        timer.invalidate()
    }
    
// MARK: - Private Methods
    private func pauseButton() {
        timerCounting = false
        timer.invalidate()
        startStopButton.setAttributedTitle(Constans.customStartButtonTitle, for: .normal)
    }
    
    private func startButton() {
        timerCounting = true
        startStopButton.setAttributedTitle(Constans.customPauseButtonTitle, for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(timerCounter),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc private func timerCounter() {
        Constans.fraction += 1
        if Constans.fraction > 99 {
            Constans.seconds += 1
            Constans.fraction = 0
        }
        if Constans.seconds == 60 {
            Constans.minutes += 1
            Constans.seconds = 0
        }
        
        let fractionString = Constans.fraction > 9 ? "\(Constans.fraction)" : "0\(Constans.fraction)"
        let secondsString = Constans.seconds > 9 ? "\(Constans.seconds)" : "0\(Constans.seconds)"
        let minutesString = Constans.minutes > 9 ? "\(Constans.minutes)" : "0\(Constans.minutes)"
        let  stopString = "\(minutesString):\(secondsString)"
        timerLabel.text = stopString
        fractionLabel.text = ".\(fractionString)"
    }
}
