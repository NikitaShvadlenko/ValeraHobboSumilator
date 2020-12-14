//
//  ViewController.swift
//  ValeraGame
//
//  Created by Nikita Shvad on 03.12.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var questShouldStart = 0
    var hobboQuest = HobboQuest()
    var valeraBrain = ValeraBrain ()
    var beat = "Чиста тупа бит"
    var player: AVAudioPlayer!
    var secondPlayer: AVAudioPlayer!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var thirstLabel: UILabel!
    @IBOutlet weak var hungerLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var guitarStatus: UILabel!
    @IBOutlet weak var healStatus: UILabel!
    @IBOutlet weak var foodStatus: UILabel!
    @IBOutlet weak var houseStatus: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var sleepButton: UIButton!
    @IBOutlet weak var walkButton: UIButton!
    @IBOutlet weak var specialAction2: UIButton!
    @IBOutlet weak var specialAction1: UIButton!
    @IBOutlet weak var specialAction3: UIButton!
    @IBOutlet weak var specialAction4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
// Stats
    @IBOutlet weak var healthBar: UIProgressView!
    @IBOutlet weak var hungerBar: UIProgressView!
    
    @IBOutlet weak var thirstBar: UIProgressView!
    
    @IBOutlet weak var moneyBar: UILabel!
    @IBOutlet weak var actionPointsBar: UILabel!
    
    @IBOutlet weak var actualActionPoints: UILabel!
    @IBOutlet weak var currentStatusBar: UILabel!
    @IBOutlet weak var dayCounter: UILabel!
    
     @IBAction func goToAction(_ sender: UIButton) {
        houseStatus.alpha = 0
        healStatus.alpha = 0
        foodStatus.alpha = 0
        guitarStatus.alpha = 0
        specialAction1.setTitle(valeraBrain.goToAction[0], for: .normal)
        specialAction2.setTitle(valeraBrain.goToAction[1], for: .normal)
        specialAction3.setTitle(valeraBrain.goToAction[2], for: .normal)
        specialAction4.setTitle(valeraBrain.goToAction[3], for: .normal)
        specialAction1.alpha = 1
        specialAction2.alpha = 1
        specialAction3.alpha = 1
        specialAction4.alpha = 1
    }
    @IBAction func sleepAction(_ sender: UIButton) {
        valeraBrain.returnSleep()
        questShouldStart += 1
        updateUI()
    }
    
    @IBAction func textAction(_ sender: UIButton) {
        houseStatus.alpha = 0
        healStatus.alpha = 0
        foodStatus.alpha = 0
        guitarStatus.alpha = 0
        specialAction1.setTitle(valeraBrain.textToAction[0], for: .normal)
        specialAction2.setTitle(valeraBrain.textToAction[1], for: .normal)
        specialAction3.setTitle(valeraBrain.textToAction[2], for: .normal)
        specialAction4.setTitle(valeraBrain.textToAction[3], for: .normal)
        specialAction1.alpha = 1
        specialAction2.alpha = 1
        specialAction3.alpha = 1
        specialAction4.alpha = 1
    }

    @IBAction func purchaseAction(_ sender: UIButton) {
        valeraBrain.updateInventoryText()
        specialAction1.setTitle(valeraBrain.purchaseAction[0], for: .normal)
        specialAction2.setTitle(valeraBrain.purchaseAction[1], for: .normal)
        specialAction3.setTitle(valeraBrain.purchaseAction[2], for: .normal)
        specialAction4.setTitle(valeraBrain.purchaseAction[3], for: .normal)
        specialAction1.alpha = 1
        specialAction2.alpha = 1
        specialAction3.alpha = 1
        specialAction4.alpha = 1
        houseStatus.alpha = 1
        healStatus.alpha = 1
        foodStatus.alpha = 1
        guitarStatus.alpha = 1
        houseStatus.text = valeraBrain.houseStatusText
        foodStatus.text = valeraBrain.foodStatusText
        healStatus.text = valeraBrain.healStatusText
        guitarStatus.text = valeraBrain.guitarStatusText
    }
    @IBAction func updateTitle1(_ sender: UIButton) {
        if sender.currentTitle == valeraBrain.goToAction[1] {
            valeraBrain.returnHeal()
            updateUI()
        }
         if sender.currentTitle == valeraBrain.textToAction[1] {
            valeraBrain.returnTextAlina()
            updateUI()
        }
        if sender.currentTitle == valeraBrain.purchaseAction[1] {
           valeraBrain.purchaseHouse()
           updateUI()
       }
        if sender.currentTitle == hobboQuest.endButtonTitle2{
        endScreen()
        }
    }
    @IBAction func updateTitle2(_ sender: UIButton) {
        if sender.currentTitle == valeraBrain.goToAction[0] {
            valeraBrain.returnThirst()
            updateUI()
        }
        if sender.currentTitle == valeraBrain.textToAction[0] {
            valeraBrain.returnTextNicolai()
            updateUI()
         }

        if sender.currentTitle == valeraBrain.purchaseAction[0] {
            valeraBrain.purchaseGuitar()
            updateUI()
        }
        if sender.currentTitle == hobboQuest.getChoice1Button(){
            
            hobboQuest.nextQuest(userChoice: sender.currentTitle!)
            if hobboQuest.thisIsTheEnd{
                specialAction2.setTitle(hobboQuest.endButtonTitle2, for: .normal)
                specialAction4.setTitle(hobboQuest.endButtonTitle1, for: .normal)
                currentStatusBar.text = 
                hobboQuest.questInit[hobboQuest.questNumber].choice1MadeMessage
                specialAction2.alpha = 1
                specialAction4.alpha = 1
                specialAction3.alpha = 0
                specialAction1.alpha = 0
            }
            else {
                returnNormaInterface()
            }
        }
    }
    @IBAction func updateTitle3(_ sender: UIButton) {
        if sender.currentTitle == valeraBrain.goToAction [2] {
            valeraBrain.returnHunger()
            updateUI()
        }
         if sender.currentTitle == valeraBrain.textToAction[2] {
            valeraBrain.returnTextRimma()
            updateUI()
        }
        if sender.currentTitle == valeraBrain.purchaseAction[2] {
           valeraBrain.purchaseFood()
            updateUI()
       }
        if sender.currentTitle == hobboQuest.getChoice2Button(){
            hobboQuest.nextQuest(userChoice: sender.currentTitle!)
            if hobboQuest.thisIsTheEnd{
                specialAction2.setTitle(hobboQuest.endButtonTitle2, for: .normal)
                specialAction4.setTitle(hobboQuest.endButtonTitle1, for: .normal)
                currentStatusBar.text = hobboQuest.questInit[hobboQuest.questNumber].choice2MadeMessage
                specialAction2.alpha = 1
                specialAction4.alpha = 1
                specialAction3.alpha = 0
                specialAction1.alpha = 0
                if sender.currentTitle == hobboQuest.endButtonTitle1{
                    endScreen()
                }
            }
            else {returnNormaInterface()
            }
        }
        
    }
    @IBAction func updateTitle4(_ sender: UIButton) {
        if sender.currentTitle == valeraBrain.goToAction [3] {
            valeraBrain.returnStreet()
            if shouldQuestStart() {
                questShouldStart = 0
                specialAction1.setTitle(hobboQuest.getChoice1Button(), for: .normal)
                specialAction3.setTitle(hobboQuest.getChoice2Button(), for: .normal)
                valeraBrain.currentStatus = hobboQuest.getQuestTitle()
                updateQuestUi()
        }
            else {
                updateUI()
            }
        }
        
         if sender.currentTitle == valeraBrain.textToAction[3] {
            valeraBrain.returnTextKit()
            updateUI()
        }
        if sender.currentTitle == valeraBrain.purchaseAction[3] {
           valeraBrain.purchaseHealth()
           updateUI()
       }
        if sender.currentTitle == hobboQuest.endButtonTitle1{
        endScreen()
        }
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == valeraBrain.restartButton {
            valeraBrain.resetStats()
            updateUI()
            restartButton.alpha = 0
            restartButton.setTitle(valeraBrain.loadingButtons, for: .normal)
            sleepButton.alpha = 1
            textButton.alpha = 1
            purchaseButton.alpha = 1
            walkButton.alpha = 1
            healthBar.alpha = 1
            hungerBar.alpha = 1
            thirstBar.alpha = 1
            moneyBar.alpha = 1
            actionPointsBar.alpha = 1
            dayCounter.alpha = 1
            actualActionPoints.alpha = 1
            moneyLabel.alpha = 1
            hungerLabel.alpha = 1
            thirstLabel.alpha = 1
            healthLabel.alpha = 1

        }
    }
    
    func updateUI() {
        playSound(soundName: "Snare", repeats: false, extens: "wav")
        houseStatus.alpha = 0
        healStatus.alpha = 0
        foodStatus.alpha = 0
        guitarStatus.alpha = 0
            if valeraBrain.isAlive {
                restartButton.alpha = 0
                healthBar.progress = valeraBrain.health
                thirstBar.progress = valeraBrain.thirst
                hungerBar.progress = valeraBrain.hunger
                moneyBar.text = "\(valeraBrain.money) В"
                actualActionPoints.text = "\(valeraBrain.actionPoints)"
                dayCounter.text = "День \(valeraBrain.dayCount)"
                currentStatusBar.text = valeraBrain.currentStatus
                makeButtonsDisappear()
            }
        else {
            questShouldStart = 0
            endScreen()
        }
    }

    func makeButtonsDisappear () {
        specialAction1.alpha = 0
        specialAction2.alpha = 0
        specialAction3.alpha = 0
        specialAction4.alpha = 0
        specialAction1.setTitle(valeraBrain.loadingButtons, for: .normal)
        specialAction2.setTitle(valeraBrain.loadingButtons, for: .normal)
        specialAction3.setTitle(valeraBrain.loadingButtons, for: .normal)
        specialAction4.setTitle(valeraBrain.loadingButtons, for: .normal)
    }
    func makeInterfaceDisappear() {
        restartButton.alpha = 1
        sleepButton.alpha = 0
        purchaseButton.alpha = 0
        textButton.alpha = 0
        walkButton.alpha = 0
        healthBar.alpha = 0
        hungerBar.alpha = 0
        thirstBar.alpha = 0
        moneyBar.alpha = 0
        actionPointsBar.alpha = 0
        dayCounter.alpha = 0
        actualActionPoints.alpha = 0
        moneyLabel.alpha = 0
        hungerLabel.alpha = 0
        thirstLabel.alpha = 0
        healthLabel.alpha = 0
    }
    func endScreen () {
        makeButtonsDisappear()
        makeInterfaceDisappear()
        restartButton.setTitle(valeraBrain.restartButton, for: .normal)
        restartButton.alpha = 1
        if valeraBrain.houseBalance > 0{
        currentStatusBar.text = valeraBrain.deathDeclaration[0]
        }
        if hobboQuest.thisIsTheEnd{
            currentStatusBar.text = hobboQuest.questEndMessage[hobboQuest.finalDestination]
        }
        
        else if valeraBrain.houseBalance < 0{
            currentStatusBar.text = valeraBrain.deathDeclaration[1]
        }
        hobboQuest.resetQuest()
    }
    func shouldQuestStart() -> Bool {
        return questShouldStart - 3 > -1
    }
    func updateQuestUi() {
        healthBar.progress = valeraBrain.health
        thirstBar.progress = valeraBrain.thirst
        hungerBar.progress = valeraBrain.hunger
        moneyBar.text = "\(valeraBrain.money) В"
        actualActionPoints.text = "\(valeraBrain.actionPoints)"
        dayCounter.text = "День \(valeraBrain.dayCount)"
        currentStatusBar.text = valeraBrain.currentStatus
        sleepButton.alpha = 0
        purchaseButton.alpha = 0
        textButton.alpha = 0
        walkButton.alpha = 0
        specialAction4.alpha = 0
        specialAction2.alpha = 0
    }
    func returnNormaInterface() {
        restartButton.alpha = 0
        healthBar.progress = valeraBrain.health
        thirstBar.progress = valeraBrain.thirst
        hungerBar.progress = valeraBrain.hunger
        moneyBar.text = "\(valeraBrain.money) В"
        actualActionPoints.text = "\(valeraBrain.actionPoints)"
        dayCounter.text = "День \(valeraBrain.dayCount)"
        currentStatusBar.text = hobboQuest.getValeraStatus()
        sleepButton.alpha = 1
        purchaseButton.alpha = 1
        textButton.alpha = 1
        walkButton.alpha = 1
        makeButtonsDisappear()
    }
    func playSound(soundName: String, repeats: Bool, extens: String) {
    let url = Bundle.main.url(forResource: soundName, withExtension: extens)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.volume = 0.5
        if repeats {
            player.numberOfLoops = -1
        }
    
        player.play()
}

}



