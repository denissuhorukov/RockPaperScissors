//
//  ViewController.swift
//  RPS
//
//  Created by Denis Suhorukov on 02/09/2019.
//  Copyright © 2019 Denis Suhorukov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func updateInterface(currentGameState: GameState) {
        switch currentGameState {
        case .start:
            computerSignLabel.text = " "
            gameStatus.text = "Rock, Paper, Scissors?"
            playerRock.isEnabled = true
            playerPaper.isEnabled = true
            playerScissors.isEnabled = true
            playerRock.isHidden = false
            playerPaper.isHidden = false
            playerScissors.isHidden = false
            playAgain.isHidden = true
            mainView.backgroundColor = .white
        case .win:
            gameStatus.text = "You Won!"
            playerRock.isEnabled = false
            playerPaper.isEnabled = false
            playerScissors.isEnabled = false
            playAgain.isHidden = false
            mainView.backgroundColor = .green
        case .lose:
            gameStatus.text = "You Lose!"
            playerRock.isEnabled = false
            playerPaper.isEnabled = false
            playerScissors.isEnabled = false
            playAgain.isHidden = false
            mainView.backgroundColor = .red
        case .draw:
            gameStatus.text = "Draw!"
            playerRock.isEnabled = false
            playerPaper.isEnabled = false
            playerScissors.isEnabled = false
            playAgain.isHidden = false
            mainView.backgroundColor = .gray
        }
    }
    
    func play(playerSign: Sign) {
        let computerSign: Sign = randomSign()
        let currentGameState: GameState = newGameState(computerSign: computerSign, playerSign: playerSign)
        computerSignLabel.text = computerSign.emoji
        updateInterface(currentGameState: currentGameState)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let currentGameState: GameState = .start
        updateInterface(currentGameState: currentGameState)
    }
    
    @IBOutlet weak var computerSignLabel: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var playerRock: UIButton!
    
    @IBOutlet weak var playerPaper: UIButton!
    
    @IBOutlet weak var playerScissors: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet var mainView: UIView!
    
    @IBAction func playerRock(_ sender: Any) {
        let playerSign: Sign = .rock
        playerPaper.isHidden = true
        playerScissors.isHidden = true
        play(playerSign: playerSign)
    }
    
    @IBAction func playerPaper(_ sender: Any) {
        let playerSign: Sign = .paper
        playerRock.isHidden = true
        playerScissors.isHidden = true
        play(playerSign: playerSign)
    }
    
    @IBAction func playerScissors(_ sender: Any) {
        let playerSign: Sign = .scissors
        playerRock.isHidden = true
        playerPaper.isHidden = true
        play(playerSign: playerSign)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        let currentGameState: GameState = .start
        updateInterface(currentGameState: currentGameState)
    }
}
