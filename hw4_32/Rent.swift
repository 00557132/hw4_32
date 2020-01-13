//
//  Rent.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation

struct Rent:Identifiable,Codable{
    var id = UUID()
    var name:String
    var money:String
    var type:String
    
}
