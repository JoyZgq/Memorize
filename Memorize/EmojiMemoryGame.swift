//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by neo on 2020/6/26.
//  Copyright © 2020 Next-Skip. All rights reserved.
//

import SwiftUI
class EmojiMemoryGame:ObservableObject{
   @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemeoryGame()
    
    private static func createMemeoryGame()->MemoryGame<String>{
        let emojis:Array<String> = ["👻","👾","👁","☠️","👹","👺","🤖","💀","🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count){pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards :Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    
    func choose(card:MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    func resetGame() {
        model = EmojiMemoryGame.createMemeoryGame()
    }
}
