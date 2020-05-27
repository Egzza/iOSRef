//
//  Ordena.swift
//  ListaRef
//
//  Created by Pato Saldivar on 5/26/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import Foundation
class Ordena: Codable {
var title: String
var solved: [String]
var unsolved: [String]

    init(title: String, solvedImages: [String]) {
        self.title = title
        self.solved = solvedImages
        self.unsolved = self.solved.shuffled()
    }
}
