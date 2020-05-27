//
//  Ordena.swift
//  ListaRef
//
//  Created by Pato Saldivar on 5/26/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import Foundation
class Ordena: Codable {

    var solved: [String]
    var unsolved: [String]

    init(elementos: [String]) {
        self.solved = elementos
        self.unsolved = self.solved.shuffled()
    }
}
