//
//  easy example.swift
//  Adapter
//
//  Created by Admin on 28.12.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

protocol BirdProtocol {
    func sing()
    func fly()
}

class Bird: BirdProtocol {
    func sing() {
        print("tew - tew")
    }
    
    func fly() {
        print("Omg! I am fluing!")
    }
}

// адапти
class Raven {
    func flySearchAndDestroy() {
        print("I am fly")
    }
    func voice() {
        print("Кваааар - каааар")
    }
}


// адаптер
class RavenAdapter: BirdProtocol {
    private var raven: Raven
    
    init(adapter: Raven) {
        raven = adapter
    }
    
    func fly() {
        raven.flySearchAndDestroy()
    }
    
    func sing() {
        raven.voice()
    }
}

// таргет
func makeTheBirdTest(bird: BirdProtocol) {
    bird.fly()
    bird.sing()
}


/* Вставить в плейграунд
 
let simpleBird = Bird()
let simpleRaven = Raven()
let ravenAdapter = RavenAdapter(adapter: simpleRaven)
makeTheBirdTest(bird: simpleBird)
makeTheBirdTest(bird: ravenAdapter)
 
*/
