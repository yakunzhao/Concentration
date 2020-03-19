//
//  Card.swift
//  Concentration
//
//  Created by Yakun on 2020/3/8.
//  Copyright © 2020 Yakun. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.indentifier == rhs.indentifier
    }
    
    var hashValue: Int {
        return indentifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var indentifier: Int
    
    private static var myIdentifierFactory = 0
    
    private static func getUniqueIdentifier()->Int{
        myIdentifierFactory += 1
        return myIdentifierFactory
    }
    
    init(){
        self.indentifier = Card.getUniqueIdentifier()
    }
}
