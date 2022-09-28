//
//  ViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

///  класс в котором указан список воспроизводимой музыки
class MusicListViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var firstArtistLabel: UILabel!
    @IBOutlet weak var secondArtistLabel: UILabel!
    
    let artistMacan = MusicName(name: "macan - останься", imageName: "macan")
    let artistIslyam = MusicName(name: "Ислям Итляшев - Ай-яй", imageName: "islyam")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMusicNameAndImage()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "musicOne" {
            guard let playerVC = segue.destination as? PlayerViewController else { return }
            playerVC.artistMacan = artistMacan
        } else if segue.identifier == "musicTwo" {
            guard let playerVC = segue.destination as? PlayerViewController else { return }
            playerVC.artistIslyam = artistIslyam
        }
    }
    
    private func createMusicNameAndImage() {
        firstImageView.image = UIImage(named: artistMacan.imageName)
        secondImageView.image = UIImage(named: artistIslyam.imageName)
        
        firstArtistLabel.text = artistMacan.name
        secondArtistLabel.text = artistIslyam.name
    }
}
