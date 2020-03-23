//
//  ViewController.swift
//  Tic-tac-toe Game
//
//  Created by 1 on 21.03.2020.
//  Copyright © 2020 DmitriOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var figureImage = UIImage()
    var turn = 1 //1 - нули, 2 - крестики
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsOn = true
    
    @IBOutlet weak var chooseFirstTurn: UISegmentedControl!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        if gameIsOn {
            chooseFirstTurn.isEnabled = false
            if gameState[sender.tag - 1] == 0 {
                if turn == 1 {
                    figureImage = UIImage(systemName: "o.circle.fill")!
                    sender.setImage(figureImage, for: .normal)
                    gameState[sender.tag - 1] = turn
                    print(gameState)
                    turn = 2
                } else {
                    figureImage = UIImage(systemName: "xmark.circle.fill")!
                    sender.setImage(figureImage, for: .normal)
                    gameState[sender.tag - 1] = turn
                    turn = 1
                }
            }
            for i in winningCombination {
                if gameState.contains(0) {
                    if gameState[i[0]] != 0 && gameState[i[0]] == gameState[i[1]] && gameState[i[0]] == gameState[i[2]] {
                        if gameState[i[0]] == 1 {
                            winnerLabel.text = "The winner is O"
                        } else {
                            winnerLabel.text = "The winner is X"
                        }
                        UIView.animate(withDuration: 2) {
                            self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                            self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x-500, y: self.playAgainButton.center.y)
                        }
                        winnerLabel.isHidden = false
                        playAgainButton.isHidden = false
                        gameIsOn = false
                    }
                } else {
                    winnerLabel.text = "Nobody wins!"
                    UIView.animate(withDuration: 2) {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x-500, y: self.playAgainButton.center.y)
                    }
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    gameIsOn = false
                }
            }
        }
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        turn = 1 //1 - нули, 2 - крестики
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsOn = true
        chooseFirstTurn.isEnabled = true
        chooseFirstTurn.selectedSegmentIndex = 0
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        for j in 1..<10 {
            if let button = view.viewWithTag(j) as? UIButton {
                button.setImage(nil, for: .normal)
                button.setPreferredSymbolConfiguration(.init(pointSize: 60), forImageIn: .normal)
            }
        }
    }
    
    @IBAction func changeFigure(_ sender: UISegmentedControl) {
        if chooseFirstTurn.selectedSegmentIndex == 0 {
            turn = 1
        } else {
            turn = 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
    }
}

