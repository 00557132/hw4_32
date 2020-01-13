//
//  RentData.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation

class RentData: ObservableObject {
    
    @Published var rents = [Rent]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(rents) {
                UserDefaults.standard.set(data, forKey: "rents")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "rents") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Rent].self, from: data) {
                rents = decodedData
            }
        }
    }
    
}
