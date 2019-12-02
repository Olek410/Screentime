//
//  HomeScreen.swift
//  ScreenTime
//
//  Created by BigOof on 11/29/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import UIKit

//the game object for the randomizer button(only for the home screen)
var overallCurrentGame: Game!
//combines all games into 1 array for randomizer
var overallGames: [Game] = []


class HomeScreen: UIViewController {

    @IBOutlet weak var randomizerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adds games from methods below to arrays
        basicGames = createBasicGames()
        advancedGames = createAdvancedGames()
        overallGames += basicGames
        overallGames += advancedGames
        
    }
    //big randomizer wheel at the home screen logic
    @IBAction func homeRandomizerPressed(_ sender: Any) {
        overallCurrentGame = overallGames[Int.random(in: 0...(overallGames.count)-1)]
        performSegue(withIdentifier: "random", sender: self)
    }
    
    //adds games to basicGames array
    func createBasicGames() ->[Game]{
        
        var tempGames: [Game] = []
        var index = 0
        //Use \u{2022} for bulletpoints and \n\n for ordered lists
        tempGames.append(Game(catagory: "card", title: "Battle", video: "https://youtu.be/23QQ1Hz2-jY", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} At least 1 deck of cards", rules: "1. Split the deck into two face down piles and give each person a pile.\n\n2. Each round, everyone grabs a card from their pile and places it face up in the middle.\n\n3. The person with the higher numbered card gets to take both cards and put it in a new pile off to the side.\n\n4. If the numbers are the same, take out two cards but only flip the second one face up. The higher number takes all the cards. You can repeat it as many times as it takes until there is one winner.", favorite: false, gameIndex: index))
        //must have the line below
        index += 1
        
        tempGames.append(Game(catagory: "card", title: "Go Fish", video: "https://youtu.be/tzEVIbiOZXc", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} At least 1 deck of cards", rules: "1. Five cards are dealt to each player if three to six players are involved. With only two players, seven cards are dealt to each. All remaining cards are placed face down in a pile.\n\n2. Choose a player to go first. On each person’s turn, ask any player for a specific card rank. You must already hold at least one card of the rank you ask for.\n\n3. If the player you ask has any cards of the requested rank, she must give all of her cards of that rank to you.\n\n4. If you get one or more cards from the player you ask, you get another turn.\n\n5. It starts again and you may ask any player for any rank you already hold, including the same one you just asked for. If the person you ask has no relevant cards, they say, “Go Fish.”\n\n6. You then draw the top card from the draw pile. If you happen to draw a card of the rank asked for, show it to the other players and your turn continues. Otherwise, it is the next player’s turn who said “Go Fish”. You add the drawn card to your hand.\n\n7. When you collect a set of four cards of the same rank, immediately show the set to the other players and place the four cards face down in front of yourself. That is a “match”.\n\n8. Go fish continues until either someone has no cards left in their hand or the draw pile runs out.\n\n9. The winner is the player who has the most matches.", favorite: false, gameIndex: index))
        index += 1
        
        tempGames.append(Game(catagory: "dice", title: "Knock out", video: "https://youtu.be/bCqOWKBK4to", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} 2 dice", rules: "1. Each player chooses a “knock out number” – either 6, 7, 8, or 9. More than one player can choose the same number.\n\n2. Players take turns throwing both dice, once each turn. Add the number of both dice for the score.\n\n3. If a player throws a 6, 7, or 8, they are knocked out of the game until the next round.", favorite: false, gameIndex: index))
        index += 1
        
        return tempGames
        
    }
    
    //adds games to advancedGames array
    func createAdvancedGames() ->[Game]{
        
        var tempGames: [Game] = []
        var index = 0
        //Use \u{2022} for bulletpoints and \n\n for ordered lists
        tempGames.append(Game(catagory: "card", title: "Crazy Eights", video: "https://youtu.be/iDQjn3k76Mw", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} At least 1 deck of cards", rules: "1. Five cards are dealt to each player (or seven in a two-player game). The remaining cards of the deck are placed face down at the center of the table. The top card is then turned face up to start the game.\n\n2. Players discard by matching rank or suit with the top card of the discard pile, starting with the player left of the dealer. They can also play any 8 at any time. If a player is unable to match the rank or suit of the top card of the discard pile and does not have an 8, they draw a card from the stockpile. When a player plays an 8, they must declare the suit that the next player is to play; that player must then follow the named suit or play another 8.\n\n3. As an example: Once 6♣ is played the next player:\ncan play any of the other 6s\ncan play any of the clubs\ncan play any 8 (then must declare a suit)\ncan draw from the stockpile until willing and able to play one of the above\n\n4.The game ends as soon as one player has emptied their hand. That player collects a payment from each opponent equal to the point score of the cards remaining in that opponent's hand. 8s score 50, court cards 10 and all other cards face value. If the players run out of cards in the deck, the player with the lowest point score in their hand scores the difference between that hand and each opponent's hand.\n\n5. The winner of the game is the first player to reach a specific number of points. For two players it is 100 points, three players 150, four 200, five 250, six 300 and for seven players 350.", favorite: false, gameIndex: index))
        //must have the line below
        index += 1
        
        tempGames.append(Game(catagory: "strategy", title: "Connect 4", video: "https://youtu.be/utXzIFEVPjA", difficulty: "", playerAmountLow: 2, playerAmountHigh: 2, materials: "\u{2022} Gameboard, checkers", rules: "1. Set up the board by attaching the grid to the base or sliding the supports onto the sides of the grid. Place the grid between the two players.\n\n2. Slide the lever at the bottom of the grid into the locked position.\n\n3. Divide the checkers evenly between players. The classic colors are red and black, but other variations include red and yellow and black and white.\n\n4. Determine which player goes first. This may be done using any random method, such as flipping a coin. It’s common to let the youngest player go first when playing with children.\n\n5. The first player inserts a checker into the grid. Only after the checker has been released can the second player make his or her move.\n\n6. Turns continue to alternate between the first and second players until someone gets four checkers of the same color lined up in a row or the board is filled without any winning moves.\n\n7. After a winner has been determined or a tie declared, place the box underneath the grid. Slide the lever out of the locked position to release the checkers.", favorite: false, gameIndex: index))
        index += 1
        
        return tempGames
    }
    

}

