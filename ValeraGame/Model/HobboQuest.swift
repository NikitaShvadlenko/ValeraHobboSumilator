//
//  hobboQuest.swift
//  ValeraGame
//
//  Created by Nikita Shvad on 13.12.2020.
//

import Foundation

class HobboQuest {
    var thisIsTheEnd = false
    var valeraStats = ValeraBrain()
    var questNumber = 0
    var finalDestination = 0
    var endButtonTitle1 = "ОКЕЙ"
    var endButtonTitle2 = "ХОРОШО"
    let questInit = [
       
        // Choice destination will be equal quest End Message, if didEnd is true.
        
        QuestLine(questText: "Вы почти закончили стритовать, как вдруг к вам подошёл незнакомец, от него пахнет мочой и крысами.", choice1: "Заговорить", choice2: "Ударить его", choice1Destination: 1, choice2Destination: 2, choice1MadeMessage: "Вы выяснили, что у незнакомца нет дома, и поболтали о важности оплаты аренды", choice2MadeMessage: "Вы ударили незнакомца и побежали прочь, этот день вам запомнился хорошо", didEnd: false),
        QuestLine(questText: "Посреди стрита вам вновь встретился бомж и попросил вас сыграть ему 'Старые раны', что-то в этом вам показалось знакомым.", choice1: "Сыграть от души", choice2: "Попросить уйти", choice1Destination: 3, choice2Destination: 3, choice1MadeMessage: "Посреди песни вы замечаете, как бомж куда-то пропал. В переходе эхом раздаются плачевные вздохи.", choice2MadeMessage: "Бомж ни капли не удивился и пошагал от вас прочь.", didEnd: false),
        QuestLine(questText: "Вы успешно отыграли, как вдруг чувствуете знакомый запах мочи и крыс, вдали вы видите силуэт. В руке странника блеснул клинок.", choice1: "Бежать.", choice2: "Биться.", choice1Destination: 0, choice2Destination: 1, choice1MadeMessage: "Вы бежали изо всех сил, но запнулись о какую-то арматурину", choice2MadeMessage: "Вы достали цепь. Схватка была короткой. Перед вами лежит окровавленный бомж.", didEnd: true),
        QuestLine(questText: "К вам вновь подходит бомж, он рассказывает, почему эта песня для него важна", choice1: "Это говнарь", choice2: "Он особенный", choice1Destination: 2, choice2Destination: 3, choice1MadeMessage: "Бомж ушёл и больше никогда не возвращался", choice2MadeMessage: "Вы точно его где-то встречали раньше...", didEnd: true)
    ]
    let questEndMessage = ["Вы упали, бомж вас нагнал и неистово пырял ножом, потом ваше лицо поели кошки.", "Взглянув поближе вы признали в этом трупе Кита, вам захотелось кому-нибудь написать.", "Вы жили. Один. Долго. Игра окончена, идите нахуй.", "Вы успешно опознали своего брата. Слеза счастья прокатилась по щеке Кита, вы ушли с улиц и открыли школу гитары!"]
    
    func getQuestTitle() -> String  {
        return questInit[questNumber].questText
    }
    func getChoice1Button() -> String  {
        return questInit[questNumber].choice1
    }
    func getChoice2Button() -> String  {
        return questInit[questNumber].choice2
    }
    func getEndTitle() -> String {
            return questEndMessage[finalDestination]
    }
     //Украдено из другой работы, возможно нужно адаптировать
     func nextQuest (userChoice: String) {
        
        let currentQuest = questInit[questNumber]
        
        if userChoice == currentQuest.choice1 {
            if questInit[questNumber].didEnd {
                thisIsTheEnd = true
                finalDestination = currentQuest.choice1Destination
            }
            
            else {
                questNumber = currentQuest.choice1Destination
                valeraStats.currentStatus = currentQuest.choice1MadeMessage
            }
        }
        else if userChoice == currentQuest.choice2 {
            
            if questInit[questNumber].didEnd {
                thisIsTheEnd = true
                finalDestination = currentQuest.choice2Destination
            }
            else {
                questNumber = currentQuest.choice2Destination
                valeraStats.currentStatus = currentQuest.choice2MadeMessage

            }
        }
    }
    func getValeraStatus() -> String {
        return valeraStats.currentStatus
    }
     func resetQuest() {
        questNumber = 0
        thisIsTheEnd = false
        
    }
}
