//
//  itemModel.swift
//  Tasking App
//
//  Created by Lalu Iman Abdullah on 23/12/23.
//

import Foundation

// immutable struct
struct itemModel: Identifiable,Codable {
    let id: String
    let title: String
    let isCompeletd: Bool
    
    init(id: String = UUID().uuidString , title: String , isCompletd: Bool ){
        self.id = UUID().uuidString
        self.title = title
        self.isCompeletd = isCompletd
    }
    func updateCompletion() -> itemModel{
        return itemModel(id: id, title: title, isCompletd: !isCompeletd)
    }
}

