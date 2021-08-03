//
//  CardModel.swift
//  Carteira
//
//  Created by Felipe Lobo on 02/08/21.
//

import SwiftUI

struct Card: Hashable {
    var cardName: String
    var cardBalance: String
    var cardFirstColor: String
    var cardSecondColor: String
    var cardOffset: CGFloat
}

var cards: [Card] = [
    Card(cardName: "Travel Card", cardBalance: "1.234,56", cardFirstColor: "darkOrange", cardSecondColor: "lightOrange", cardOffset: 0),
    Card(cardName: "Work Card", cardBalance: "123.234,56", cardFirstColor: "darkBlue", cardSecondColor: "lightBlue", cardOffset: 0),
    Card(cardName: "Debit Card", cardBalance: "234,56", cardFirstColor: "darkGray", cardSecondColor: "lightGray", cardOffset: 0)
]
