//
//  HomeData.swift
//  PrimeiroAppMVVM
//
//  Created by user218997 on 04/01/23.
//

import UIKit

//Decodable - decodifica -> transforma um Json em um Objeto
//Encodable - codifica um objeto -> torna um tipo de dado no swift em Json
//Codable - codifica e decodifica

// MARK: - HomeData
struct HomeData: Codable {
    var stories: [Stories]?
    var posts: [Posts]?
}




