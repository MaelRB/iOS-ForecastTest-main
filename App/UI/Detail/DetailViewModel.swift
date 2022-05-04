//
//  DetailViewModel.swift
//  App
//
//

import Foundation

class DetailViewModel {
    
    private(set) var forecastItem: ForecastItem
    
    var title: String {
        "\(forecastItem.day): \(forecastItem.description)"
    }
    
    var back: (() -> Void)?
    
    init(forecastItem: ForecastItem) {
        self.forecastItem = forecastItem
    }

}
