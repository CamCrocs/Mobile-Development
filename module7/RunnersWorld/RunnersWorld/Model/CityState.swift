//
//  CityState.swift
//  RunnersWorld
//
//  Created by Cameron Crockett on 2/19/24.
//

import Foundation

struct CityState {
    let city: String
    let state: String
    
    init(city: String, state: String) {
        self.city = city
        self.state = state
    }
    
    func formatCityState() -> String {
        return "\(city), \(state)"
    }
    
}
