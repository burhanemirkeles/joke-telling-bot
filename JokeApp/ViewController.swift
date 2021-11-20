//
//  ViewController.swift
//  JokeApp
//
//  Created by Damian Mikołajczak on 13/08/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var bot = AVSpeechSynthesizer()
    
    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var punchline: UILabel!
    @IBOutlet weak var setup: UILabel!
    @IBOutlet weak var chatCloud: UIImageView!
    @IBOutlet weak var botImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.layer.cornerRadius = 15.0
        chatCloud.isHidden = true
        botImage.heightAnchor.constraint(equalTo: self.botImage.widthAnchor, multiplier: 1.0).isActive = true
    }

    @IBAction func GetJoke() {
        chatCloud.isHidden = false
        setup.text = ""
        punchline.text = ""
        
        APIClient().fetchJoke { [weak self] joke in
            guard let joke = joke else { return }
            
            DispatchQueue.main.async {
                self?.chatCloud.isHidden = true
                self?.button.isUserInteractionEnabled = false
                self?.setup.text = joke.setup
                self?.sayByBot(joke.setup)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                self?.punchline.text = joke.punchline
                self?.sayByBot(joke.punchline)
                self?.button.isUserInteractionEnabled = true
            })
        }
    }
    
    func sayByBot(_ text: String) {
        let dialoge = AVSpeechUtterance(string: text)
        dialoge.voice = AVSpeechSynthesisVoice(language: "en-US")
        self.bot.speak(dialoge)
    }
}

