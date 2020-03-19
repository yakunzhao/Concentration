//
//  Concentration.swift
//  Concentration
//
//  Created by Yakun on 2020/3/8.
//  Copyright © 2020 Yakun. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = Array<Card>()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly

//            var foundIndex:Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set(newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard (at index: Int){
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched { // 点击了一张没有匹配的卡片，索引为index
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index { // 这张卡不是已经朝上的
                // 检查是否match
                if cards[index] == cards[matchIndex] { // match
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true // 没有match
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
