//
//  GamesData.swift
//  ScreenTime
//
//  Created by BigOof on 12/9/19.
//  Copyright © 2019 Olivier Balazy. All rights reserved.
//

import Foundation
import UIKit

func encodeDataOverall(){
    defaults.set(try? PropertyListEncoder().encode(overallGames), forKey: "gameDataOverall")
}

func decodeDataOverall()->[Game]{
    guard let gamesData = defaults.object(forKey: "gameDataOverall") as? Data else{
        return []
    }
    
    guard let games = try? PropertyListDecoder().decode([Game].self, from: gamesData) else {
        return []
    }

    return games
    
}
func encodeDataBasic(){
    defaults.set(try? PropertyListEncoder().encode(basicGames), forKey: "gameDataBasic")
}

func decodeDataBasic()->[Game]{
    guard let gamesData = defaults.object(forKey: "gameDataBasic") as? Data else{
        return []
    }
    
    guard let games = try? PropertyListDecoder().decode([Game].self, from: gamesData) else {
        return []
    }
    
    return games
    
}
func encodeDataAdvanced(){
    defaults.set(try? PropertyListEncoder().encode(advancedGames), forKey: "gameDataAdvanced")
}

func decodeDataAdvanced()->[Game]{
    guard let gamesData = defaults.object(forKey: "gameDataAdvanced") as? Data else{
        return []
    }
    
    guard let games = try? PropertyListDecoder().decode([Game].self, from: gamesData) else {
        return []
    }
    
    return games
    
}

func createGames(){
    
    //adds games from methods below to arrays
    basicGames = createBasicGames()
    advancedGames = createAdvancedGames()
    overallGames += basicGames
    overallGames += advancedGames
    
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
    
    tempGames.append(Game(catagory: "card", title: "Crazy Eights", video: "https://youtu.be/9Fd0WUaTHZU", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} At least 1 deck of cards", rules: "1. Each player is dealt seven cards. The remaining cards are placed face down in the center of the table, forming a draw pile.\n\n2. The top card of the draw pile is turned face up to start the discard pile next to it.\n\n3. First player adds to the discard pile by playing one card that matches the top card on the discard pile either by suit or by rank.\n\n4. A player who cannot match the top card on the discard pile by suit or rank must draw cards until he can play one.\n\n5. All eights are wild and can be played on any card during a player’s turn.\n\n6. All eights are wild and can be played on any card during a player’s turn.\n\n7. When a player discards an eight, he chooses which suit is now in play.\n\n8. The next player must either play a card of that suit or another eight.\n\n9. The first player to discard all of his cards wins. ", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "card", title: "Spoons", video: "https://youtu.be/bkDC3JoRjSk", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} At least 1 deck of cards", rules: "1. Place the spoons evenly along a table. Each player is dealt four cards from two shuffled decks.\n\n2. The designated dealer of the first round begins by picking the top card from the pile in front of them, deciding whether it will help them get four of a kind, then discard a card to the player to their left. They in turn decide if this card will help them, then discard to the player on their left, and so on.\n\n3. When play reaches the person to the dealer’s right, their discarded card is left to create a second pile. Play continues with the dealer again taking a card from the central pile.If the dealer runs out of cards from the central pile, they pick from the second pile between them and the player to their right.\n\n4. When someone gets four of a kind, they must grab a spoon and everyone else must follow. The player left empty-handed is eliminated and a spoon is removed from the stash.\n\n5. The game continues, with the dealer moving one position to the left, until the final two-person, one-spoon showdown.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "card", title: "Memory", video: "https://youtu.be/Xk4tqXoU4Bs", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} At least 1 deck of cards", rules: "1. Mix up the cards.\n\n2. Lay them in rows, face down.\n\n3. Turn over any two cards.\n\n4. If the two cards match, keep them. If they don’t match, turn them back over.\n\n5. Remember what was on each card and where it was.\n\n6. Watch and remember during the other player’s turn.\n\n7. The game is over when all the cards have been matched.\n\n8. The player with the most matches wins.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "card", title: "Old Maid", video: "https://youtu.be/g9jYjzNWQic", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} At least 1 deck of cards", rules: "1. Before dealing, players much decide whether or not to add a card (like a Joker or a card from an identical deck) or to subtract a card (typically the Queens of Clubs) to serve as the Old Maid.\n\n2. Shuffle, and deal all the cards. Players sort through their cards, making as many pairs as possible, and placing these pairs face-up on the table in front of them.\n\n3. Starting with the dealer, each player then takes a turn fanning out their hands so that the player to their left can draw one card.\n\n4. The player must not be allowed to see the player’s hand from which they are drawing. Play continues in this fashion.\n\n5. As players make pairs in their hand, they discard them immediately onto the table.\n\n6. Whoever is left with the Old Maid as their last card loses.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "strategy", title: "Checkers", video: "https://youtu.be/ScKIdStgAfU", difficulty: "", playerAmountLow: 2, playerAmountHigh: 2, materials: "\u{2022} Gameboard, checkers", rules: "1. Take 12 checkers of the same color and place them on all of the dark squares of the first three rows in front of you. Your opponent does the same.\n\n2. Choose a player to go first. On your turn, move any one of your checkers by the movement rules described below. After you move one checker, your turn is over. The game continues with players alternating turns.\n\n\ta. Always move your checker diagonally forward, toward your opponent’s side of the game board. (After a checker becomes a “King,” it can move diagonally forward or backward.\n\n\tb. Move your checker one space diagonally, to an open adjacent square; or jump one or more checkers diagonally to an open square adjacent to the checker you jumped. When jump over an opponent’s checker, you capture it.\n\n\tc. If all squares adjacent to your checker are occupied, your checker is blocked and cannot move.\n\n3. If you jump an opponent’s checker, you capture it. Remove it from the game board and place it in front of you.\n\n4. As soon as one of your checkers reaches the first row on your opponent’s side of the game board, it becomes a King.\n\n5. Place another checker of the same color on top of it. Now this double-decker checker can move forward or backward on the game board.\n\n6. The first player to capture all opposing checkers from the game board wins the game!", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "dice", title: "Beat That!", video: "https://apple.com", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} 2 Dice", rules: "1. Each player takes a turn rolling the dice and placing them in order to make the highest number possible. For example, if a player throws a two and a three, they have 23.\n\n2. A player who throws a six and a four would win the round as they have the higher number.\n\n3. After each throw, a player challenges the next player, “Beat that!” Play this game in rounds, assigning a winner to each round.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "dice", title: "Going to Bosten", video: "https://apple.com", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} 3 Dice", rules: "1. Roll the dice and keep the highest.\n\n2. Roll the remaining dice and again set aside the highest.\n\n3. Roll the last die, and add up your total. Write down your score.", favorite: false, gameIndex: index))
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
    
    tempGames.append(Game(catagory: "strategy", title: "Checkers", video: "https://youtu.be/ScKIdStgAfU", difficulty: "", playerAmountLow: 2, playerAmountHigh: 2, materials: "\u{2022} Gameboard, checkers", rules: "1. Take 12 checkers of the same color and place them on all of the dark squares of the first three rows in front of you. Your opponent does the same.\n\n2. Choose a player to go first. On your turn, move any one of your checkers by the movement rules described below. After you move one checker, your turn is over. The game continues with players alternating turns.\n\n\ta. Always move your checker diagonally forward, toward your opponent’s side of the game board. (After a checker becomes a “King,” it can move diagonally forward or backward.\n\n\tb. Move your checker one space diagonally, to an open adjacent square; or jump one or more checkers diagonally to an open square adjacent to the checker you jumped. When jump over an opponent’s checker, you capture it.\n\n\tc. If all squares adjacent to your checker are occupied, your checker is blocked and cannot move.\n\n3. If you jump an opponent’s checker, you capture it. Remove it from the game board and place it in front of you.\n\n4. As soon as one of your checkers reaches the first row on your opponent’s side of the game board, it becomes a King.\n\n5. Place another checker of the same color on top of it. Now this double-decker checker can move forward or backward on the game board.\n\n6. The first player to capture all opposing checkers from the game board wins the game!", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "card", title: "Klondike", video: "https://youtu.be/9nt-tHE8yaY", difficulty: "", playerAmountLow: 1, playerAmountHigh: 1, materials: "\u{2022} At least 1 deck of cards", rules: "1. Deal out 28 cards in seven piles as follows: The first pile is one card; the second pile has two cards, and so on up to seven in the last pile. The top card of each pile is face up; all others are face down.\n\n2. The four aces form the foundations. As it becomes available, each ace must be played to a row above the piles. Cards in the appropriate suit are then played on the aces in sequence - the two, then the three, and so on - as they become available.\n\n3. Any movable card may be placed on a card next-higher in rank if it is of opposite color. Example: A black five may be played on a red six. If more than one card is face up on a tableau pile, all such cards must be moved as a unit.\n\n4. When there is no face-up card left on a pile, the top face-down card is turned up and becomes available.\n\n5. Only a king may fill an open space in the layout. The player turns up cards from the top of the stock in groups of three, and the top card of the three may be used for building on the piles, if possible, played on a foundation. If a card is used in this manner, the card below it becomes available for play. If the up-card cannot be used, the one, two, or three cards of the group are placed face up on the waste pile, and the next group of three cards is turned up.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "card", title: "Spider", video: "https://youtu.be/SjArT2xA53Y", difficulty: "", playerAmountLow: 1, playerAmountHigh: 1, materials: "\u{2022} At least 1 deck of cards", rules: "1. Ten piles of five cards each are dealt by rows. The first four cards of each pile are dealt face down, the top cards face up.\n\n2. The top card of a pile may be moved, together with all face-up cards below it that follow in ascending suit and sequence.\n\n3. A sequence of available cards may be broken at any point by leaving some cards behind. Example: If a pile from top down shows 4, 5, 6, 7, either the first one, two, or three cards may be moved as a unit, but the 7 may not be moved until the covering three cards are removed. When all face-up cards on a pile are removed, the next card below is turned face up and becomes available.\n\n4. A movable unit of cards may be placed either in a space or on a card of the next-higher rank to the bottom card of the unit, regardless of color or suit. Example: If the bottom card of a unit is the J, it may be moved onto any one of the four queens.\n\n5. A king can be moved only onto a space. Alternatively, the spaces may be filled with any movable unit.\n\n6. When all possible or desired moves come to a standstill, the player deals another row of ten cards face up. However, before such a deal may be made, all spaces must be filled. The final deal consists of only four cards, which are placed on the first four piles.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "card", title: "Free cell", video: "https://youtu.be/vZWvggL7IuU", difficulty: "", playerAmountLow: 1, playerAmountHigh: 1, materials: "\u{2022} At least 1 deck of cards", rules: "1. FreeCell is setup by creating eight columns of cards all face up. All 52 cards are used in the columns. The first four columns will have one more card than the other four columns.\n\n2. Move all the cards onto the foundation piles in number sequence. There are four foundation piles, one for each suit.\n\n3. Move cards around in three ways. One, by playing cards of a different color on top of a card that is one number higher. Two, by playing cards onto the foundation piles. Foundation piles are started with the ace in each suit, and can be played on in sequence up to the king in each suit. Three, move a card to one of the four free cells.\n\n4. Continue to move cards around in these three ways until all cards are moved to the foundation piles (win), or there are no more moves to be made (lose).\n\n5. When one of the eight columns is empty, any card can be moved into the open space.\n\n6. Only one card can be in each free cell at a time.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "card", title: "Pyramid", video: "https://youtu.be/dnRlETGqHec", difficulty: "", playerAmountLow: 1, playerAmountHigh: 1, materials: "\u{2022} At least 1 deck of cards", rules: "1. The setup of the game is one of the key things that is different about this version from the original version. As usual, shuffle the deck. Deal cards to form a pyramid, starting with a row of 1 card, followed by a row of two cards, and so on, down to a row of 7 cards. Each row should overlap the previous one. The pyramid will include a total of 28 cards when complete. The remaining cards are set on the table face down to form the draw pile.\n\n2. Reveal cards from the draw pile, one at a time. If a card from the draw pile is not used, it should be covered up by the next card from the draw pile. It can be used later in the game, but only if it gets uncovered because any draw pile cards on top of it are able to be discarded.\n\n3. When two exposed cards total 13, they can be discarded. (This is why this version of the game is sometimes referred to as Solitaire 13.) Discarding is always optional, and there may be times when it is a better tactical choice not to discard.\n\n4. Cards in the pyramid are exposed if no cards are overlapping them. Only one card from the draw pile is exposed at any given time in the game (the most recent draw pile card to be turned up is the only card from the draw pile that's exposed).\n\n5. For example, if a 9 and a 4 are both exposed in the pyramid, they can be discarded.\n\n6. If a 5 is exposed in the pyramid and an 8 is exposed after being turned up from the draw pile, they can be discarded.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "card", title: "Tripeaks", video: "https://youtu.be/MzCWpDpW-3E", difficulty: "", playerAmountLow: 1, playerAmountHigh: 1, materials: "\u{2022} At least 1 deck of cards", rules: "1. All building is carried out on the single waste pile. Any completely uncovered card in the tableau may be moved to the waste pile if it follows either an ascending or descending sequence regardless of suit. So in the above example, either the 6, the 6 or the 8 may be built on the 7.\n\n2. Sequences may turn the corner with Kings building on Aces and Aces building on Kings.\n\n3. When no more cards can be transferred from the tableau to the waste pile, a card from the stock is dealt to the waste pile and building resumes.\n\n4. When the stock is exhausted, and no more building can occur, then the game is over. You'll receive a bonus every time you completely demolish one of the three peaks and you'll also receive a bonus for each card that remains in the tableau when you win the game, along with another bonus depending on how fast you completed the game. Don't forget, you can double click or right click on a card to send it flying to the waste pile.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "active", title: "Blob tag", video: "https://apple.com", difficulty: "", playerAmountLow: 2, playerAmountHigh: 0, materials: "\u{2022} People", rules: "1. Select 1 or 2 students to begin the blob.  The rest of the players will scatter about the playing area.  On the signal, the blob will attempt to tag the other players.  A player getting tagged, must join (literally, they must join a hand) the and continue developing the blob.  These 2 players must now stay joined and attempt to tag other players.  As more players get tagged, they must add onto the outside of the blob.  So, at any one time, the blob will only have two hands available for tagging (one on each end).  The more players that get tagged, the larger the blob grows.  The object of the game is to be the last player captured by the BLOB.  Following are some rules to follow:\n\n\t1.  Only the end players of the BLOB can tag others.\n\t2.  The BLOB must remain connected to tag others.\n\t3.  You may give a noodle to each free hand of the BLOB to aid in tagging.", favorite: false, gameIndex: index))
    index += 1
    
    tempGames.append(Game(catagory: "dice", title: "Bunco", video: "https://youtu.be/XhQnraJx9v8", difficulty: "", playerAmountLow: 8, playerAmountHigh: 0, materials: "\u{2022} 2 Dice par table", rules: "1. Players divide into groups of four\n\n2. Each group of four should have a set of three dice.\n\n3. Each player should have a pencil and a scoresheet (free printable bunco score sheets)\n\n4. Each table of four players is numbered: Number One (head table), Two, Three, etc.\n\n5. In the first round, the Head Table begins to play, which signals other tables to begin as well.\n\n6. Each round has a target number. The target number of the first round is ones, so you try to roll ones with the dice.\n\n7. As your roll, record your target numbers as your roll them. For example, if you are playing ones, record each one that you roll.\n\n8. If you don't roll a one, it is the next players turn.\n\n9. Record your score, and combine it with the player across from you, who is considered your partner for that round.\n\n10. When one of the teams at the table reaches 21 points, play ends.\n\n11. Players then switch to another table. The winning team moves up a table, and the losing team stays where they are. The only exception is at the head table. The winners stay, and the losers move to the lowest table.\n\n11. The game can go on for as long as wanted.", favorite: false, gameIndex: index))
    index += 1
    
    
    return tempGames
}
