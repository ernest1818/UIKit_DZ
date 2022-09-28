//
//  PlayerViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 26.09.2022.
//

import AVFoundation
import UIKit

/// класс для проигрывания списка воспроизводимого - плеер
class PlayerViewController: UIViewController {
    
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var upNameLabel: UILabel!
    @IBOutlet weak var downNameLabel: UILabel!
    @IBOutlet weak var volumsSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    var artistMacan: MusicName?
    var artistIslyam: MusicName?
    var count = 0
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        setPlayerImageAndLabels()
        configureShadowView()
        configurateImageView()
    }
    
    private func configurateImageView() {
        playerImageView.layer.cornerRadius = 10
        playerImageView.layer.masksToBounds = true
    }
    // MARK: - функция отображения картинки, названия песни и проигрывания самой песни.
    private func setPlayerImageAndLabels() {
        
        if artistMacan != nil {
            createMacanViews()
            playMacanArtist()
        } else {
            createIslyamViews()
            playIslyamArtist()
        }
    }
    
    private func createMacanViews() {
        playerImageView.image = UIImage(named: artistMacan?.imageName ?? " ")
        upNameLabel.text = artistMacan?.name
        downNameLabel.text = artistMacan?.name
        updateTimeSlider()
    }
    
    private func createIslyamViews() {
        playerImageView.image = UIImage(named: artistIslyam?.imageName ?? " ")
        upNameLabel.text = artistIslyam?.name
        downNameLabel.text = artistIslyam?.name
        updateTimeSlider()
    }
    
    private func playMacanArtist() {
        do {
            if let audioPath = Bundle.main.path(forResource: artistMacan?.name, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                musicSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
        player.play()
    }
    
    private func playIslyamArtist() {
        do {
            if let audioPath = Bundle.main.path(forResource: artistIslyam?.name, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                musicSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
        player.play()
    }
    private func configureShadowView() {
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 5.0
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 5)
        shadowView.layer.shadowOpacity = 0.7
    }
    
    private func updateTimeSlider() {
            Timer.scheduledTimer(timeInterval: 0.1,
                                 target: self,
                                 selector: #selector(musicTimeSliderAction),
                                 userInfo: nil,
                                 repeats: true)
        }
  // MARK: - Экшны
    @IBAction func musicTimeSliderAction(_ sender: Any) {
        musicSlider.value = Float(player.currentTime)
    }
    
    @IBAction func playPauseButtonAction(_ sender: Any) {
        if count == 1 {
            player.play()
            playPauseButton.setImage(UIImage(systemName: "pause.fill", compatibleWith: .none), for: .normal)
            musicSlider.value = Float(player.currentTime)
            count = 0
        } else if count == 0 {
            player.pause()
            playPauseButton.setImage(UIImage(systemName: "play.fill", compatibleWith: .none), for: .normal)
            count = 1
        }
    }
    @IBAction func volumeSliderAction(_ sender: Any) {
        player.volume = volumsSlider.value
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
