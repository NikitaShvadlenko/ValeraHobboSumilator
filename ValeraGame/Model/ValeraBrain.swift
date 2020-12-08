//
//  ValeraBrain.swift
//  ValeraGame
//
//  Created by Nikita Shvad on 04.12.2020.
//

import Foundation

    struct ValeraBrain {
    
        var dayCount = 1
        var health: Float = 1.0
        var thirst:Float = 1.0
        var hunger:Float = 1.0
        var money = 100
        var actionPoints = 3
        var currentStatus = "ВАС ПРЕСЛЕДУЕТ СТРАННОЕ ЖЕЛАНИЕ СОСАТЬ..."
        var pickLine = 0
        var stillAlive = true
        var loadingButtons = "Загрузка..."
        var restartButton = "Рестарт"
        var deathDeclaration = "Вы безуспешны в этом деле, начните новую игру и следите за статами"
        
        var hasGuitar = false
        var houseBalance = 7
        var foodBalance = 2
        var healBalance = 2
        
        let guitarPrice = 100
        let housePrice = 200
        let foodPrice = 50
        let healPrice = 55
       
        var houseStatusText = "Загрузка"
        var foodStatusText = "Загрузка"
        var healStatusText = "Загрузка"
        
        // Словарь хорош для позитивных и негативных исходов - просто словарь сам по себе не имеет смысла.Это можно переделать и включить все переменные. Также: словарь с рандомными стрингс лучше иметь только в случае полного готового дизайна игры и кнопок.
        
        mutating func randomLine() {
            pickLine = Int.random (in: 0...(randomLines.count - 1))
        }
        
        let randomLines = [
            Dictionary(hunger: "Вы успешно поели", thirst: "Кажется, вы изобрели новый попить", street: "Вы ужасно играете, за ваши старания вам накинули ", sleep: "Утренний стояк не дает вам покоя"),
            Dictionary (hunger: "Вы снова жрёте", thirst: "Испив стакан мочи, вы готовы к дальнейшим действиям", street: "Вам дали немного денег", sleep: "Новый день не принесет ничего нового"),
            Dictionary(hunger: "Маслос ТМ - на этом масле удобно жарить хлеб", thirst: "Вы выпили немного воды из лужи", street: "Местные барыги не любят вашу игру, вы получили", sleep: "Сон бесплатен и бесполезен"),
            Dictionary(hunger: "Еда вам не кажется вкусной", thirst: "Вы выпили крови", street: "За это вам,казалось бы, не должны ничего заплатить, но заплатили", sleep: "Вы проспали ровно один день"),
            Dictionary(hunger: "Объедки из старого сарая помогают вам прошить этот день", thirst: "Вкус проточной воды вам напоминает кофе", street: "Жестокие улицы практически сожрали вас, заработано:", sleep: "Бессонница наполняет вас энергией")]
        
        let noActions = ["Проспись, бродяга.", "Отдохни, пес.", "Ты очень устал и нихера не можешь.", "Вы почти это сделали, но решили передернуть и поспать.", "Так долго на ногах стоять нельзя.", "Невозможно выполнить.", ]
        
        let healAction = ["Вы подлечились каким-то странным соком", "Изолента помогла вам избежать внутреннего кровотечения", "Вы чувствуете себя чуточку живее", "Вы обречены жить дольше (но это не точно)", "Чтение молитв заживляет ваши раны", "Боль прошла, остались только воспоминания" ]
        let goToAction = ["Попить", "Лечиться", "Поесть", "На стрит",]
        
        let textNicolai = ["Коля рассказал вам о хастле", "Архидемон - это насколько охуенно?", "Братишка, я тебе покушать принес"]
        let textAlina = ["Вы поговорили о смерти", "Вы обсудили тщетность бытия", "Ваши шутки очень смешные, но она не всегда это понимает", "Вы обсудили личную жизнь Кита","Вы осмеяли Николая"]
        let textRimma = ["Вы написали, но не получили ответа", "Вы просто хотите погулять", "Вы скинули ей сет крутых упражнений с левого аккаунта", "Вас поймали, вы пойманы","Чувство одиночества вас угнетает"]
        let textKit = ["Пошёл он нахуй", "Не сейчас, есть дела поважнее", "Вы успешно не написали Киту", "Вы бы рады, но номер из Телеги просто пропал","Интернет слишком дорог, а время еще дороже"]
        
        let textToAction = ["Николаю", "Алине", "Римме", "Не писать Киту"]
        
        //Это должно отражать цену, которую меняешь в проге, а не вот так вот. Можно сделать функцию, где происходит апдейт этих строк с уже их ценами.
        let purchaseAction = ["Гитару 200В", "Оплатить Хату 200В", "Еды 55В", "Лечение 55В"]
        
        // Все, кроме гитары заменить на рандомные строки, раз уж начал. Вы купили гитару должно измениться на "Вы купили гитару попизже" при hasGuitar = true
        
        let guitarPurchase = "Вы купили гитару"
        let housePurchase = "Вы оплатили хату на семь дней"
        let foodPurchase = "Вы купили 5 единиц того, что было по акции"
        let healPurchase = "Вы купили какие-то таблетки"
        
        let returnNoFood = "Ваше хранилище пусто"
        let returnNoMoney = "У вас нет денег"
        let returnNoHeal = "У вас нет полечиться"
        
        
        //Проверка, живой ли + кнопка рестарта игры
        mutating func isAlive() {
            if hunger > 0 && thirst > 0 && health > 0 {
                stillAlive = true
            }
            else {stillAlive = false
            }
        }
        mutating func resetStats () {
            dayCount = 1
            health = 1.0
            thirst = 1.0
            hunger = 1.0
            money = 100
            houseBalance = 7
            healBalance = 2
            foodBalance = 2
            actionPoints = 3
            currentStatus = "ВАС ВНОВЬ ПРЕСЛЕДУЕТ СТРАННОЕ ЖЕЛАНИЕ СОСАТЬ..."
            stillAlive = true
           
        }
        
        //Вместо флоат намбер лучше целое число, сделано все так, чтобы не писать апдейт для барров - лучше поменять.
        mutating func oneActionComplete () {
            hunger -= 0.2
            thirst -= 0.2
            actionPoints -= 1
            health -= 0.1
        }
        
        // есть ли вариант сократить проверку действий вместо IF Else в каждой функции?
        
        mutating func noActionsReturn () {
            currentStatus = noActions [Int.random(in: 0...(noActions.count - 1))]
        }
        
        // Смена дней также должна влиять на оплату хату не оплатил хату в последний день - поспал - проиграл
        
        mutating func returnSleep () {
            
            if houseBalance > 0 {
            isAlive()
            actionPoints = 4
            oneActionComplete()
            randomLine ()
            currentStatus = randomLines[pickLine].sleep
            dayCount += 1
            houseBalance -= 1
            }
            else {
                stillAlive = false
                deathDeclaration = "Вы не оплатили хату, вас выперли на улицу, теперь вы официально бомж."
            }
        }
        
        // Четыре стандартных действия
        
        mutating func returnStreet () {
            isAlive()
            var gotMoney = 0
            if actionPoints > 0 {
                oneActionComplete()
                if hasGuitar == false {
                   gotMoney = Int.random(in: 10...50)}
                else {gotMoney = Int.random(in: 50...85)}
                money += gotMoney
                randomLine()
                currentStatus = "\(randomLines[pickLine].street) \(gotMoney) В"
            }
            else {
                noActionsReturn()
            }
            
        }
        mutating func returnHunger ()  {
            if foodBalance > 0 {
            isAlive()
                foodBalance -= 1
            if actionPoints > 0 {
                oneActionComplete()
                hunger += 0.4
                randomLine ()
                currentStatus = randomLines[pickLine].hunger
            }
            else {
                noActionsReturn()
            }
        }
            else {currentStatus = returnNoFood
            }
        }
        mutating func returnThirst ()  {
            isAlive()
            if actionPoints > 0 {
            oneActionComplete()
            thirst += 0.5
            randomLine ()
            currentStatus = randomLines[pickLine].thirst
            }
            else {
                noActionsReturn()
            }
        }
        
        mutating func returnHeal () {
            isAlive()
            if healBalance > 0 {
                if actionPoints > 0 {
                    oneActionComplete()
                    health += 0.4
                    currentStatus = healAction [Int .random(in: 0...(healAction.count - 1))]
                }
        else {
            noActionsReturn()
            }
        }
            else {currentStatus = returnNoHeal}
        }
        
        // Четыре "НАПИСАТЬ действия - в них нет смысла и баланса. Квестовая линейка была бы норм"
        
        mutating func returnTextNicolai () {
            isAlive()
            if actionPoints > 0 {
            oneActionComplete()
            health += 0.8
            currentStatus = textNicolai [Int .random(in: 0...(textNicolai.count - 1))]
            }
        else {
            noActionsReturn()
            }
        }
        mutating func returnTextRimma () {
            isAlive()
            if actionPoints > 0 {
            oneActionComplete()
            thirst += 0.8
            currentStatus = textRimma [Int .random(in: 0...(textRimma.count - 1))]
            }
        else {
            noActionsReturn()
            }
        }
        mutating func returnTextAlina () {
            isAlive()
            if actionPoints > 0 {
            oneActionComplete()
            hunger += 0.8
            currentStatus = textAlina [Int .random(in: 0...(textAlina.count - 1))]
            }
        else {
            noActionsReturn()
            }
        }
        mutating func returnTextKit () {
            isAlive()
            if actionPoints > 0 {
            oneActionComplete()
            actionPoints += 4
            currentStatus = textKit [Int .random(in: 0...(textKit.count - 1))]
            }
        else {
            noActionsReturn()
            }
        }
        
        // четыре действия покупки
        mutating func purchaseGuitar (){
            if money > guitarPrice {
            oneActionComplete()
            money -= guitarPrice
            hasGuitar = true
            currentStatus = guitarPurchase
            }
            else {currentStatus = returnNoMoney}
        }
        mutating func purchaseFood (){
            if money > foodPrice {
            oneActionComplete()
            money -= foodPrice
            foodBalance += 5
            currentStatus = foodPurchase
            }
            else {currentStatus = returnNoMoney
            }
        }
        mutating func purchaseHouse (){
            if money > housePrice {
            oneActionComplete()
            money -= housePrice
            houseBalance += 7
            currentStatus = housePurchase
            }
            else {currentStatus = returnNoMoney}
        }
        
        mutating func purchaseHealth (){
            if money > healPrice {
            oneActionComplete()
            money -= healPrice
            healBalance += 3
            currentStatus = healPurchase
            }
            else {currentStatus = returnNoMoney
                
            }
        }
        mutating func updateInventoryText(){
            houseStatusText = "Оплачено на \(houseBalance) д."
            foodStatusText = "Имеется \(foodBalance)"
            healStatusText = "Имеется \(healBalance)"
        }
    }

