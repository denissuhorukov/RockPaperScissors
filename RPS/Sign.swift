//
//  Sign.swift
//  RPS
//
//  Created by Denis Suhorukov on 02/09/2019.
//  Copyright © 2019 Denis Suhorukov. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "🖐"
        case .scissors: return "✌️"
        }
    }
    
}

func newGameState(computerSign: Sign, playerSign: Sign) -> GameState {
    var newGameState: GameState = .start
    if playerSign == .rock {
        switch computerSign {
        case .rock: newGameState = .draw
        case .paper: newGameState = .lose
        case .scissors: newGameState = .win
        }
    }
    if playerSign == .paper {
        switch computerSign {
        case .rock: newGameState = .win
        case .paper: newGameState = .draw
        case .scissors: newGameState = .lose
        }
    }
    if playerSign == .scissors {
        switch computerSign {
        case .rock: newGameState = .lose
        case .paper: newGameState = .win
        case .scissors: newGameState = .draw
        }
    }
    return newGameState
}
