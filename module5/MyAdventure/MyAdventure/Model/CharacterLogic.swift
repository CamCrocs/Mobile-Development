//
//  CharacterLogic.swift
//  MyAdventure
//
//  Created by Fletcher Crockett on 2/9/24.
//

import Foundation

/*
 * CharacterLogic Struct
 * constant scenarios that are decided by the user.
*/

struct CharacterLogic {
    
    // array of scenarios that can be chosen.
    
    let scenarios = [
        " You choose to fly the dragon. Once you arrived at the lair, you landed at the top of the castle. ", // 0
        " You took the ship.. During your voyage a kraken destroyed your ship, but he was kind enough to take you to the front gate of the evil lair. ", // 1
        " You decided to run down the stairs.. The princess and capturer escaped through the cellar. YOU LOSE! ", // 2
        "You fought the guardian and lost terribly, the princess is gone! YOU LOSE! ", // 3
        " You took the dragon down to the gate, destroyed the guardian. The villian gave up the princess YOU WON! ", // 4
        " You swam hard to the cellar and intercepted the villian and saved the princess, YOU WON! " // 5
    ]
    
    // scenario choice from its index. Returns the element as a String.
    
    func updateTextField(_ choice: Int) -> String {
        return scenarios[choice]
    }
    
    
    
}
