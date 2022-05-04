//
//  ForecastItem.swift
//  App
//
//

import Foundation

struct ForecastItem {
    let day: String
    let description: String
    let sunrise, sunset: Int
    let chanceRain: Double
    let high, low: Int
    let imageName: String
    
    init(dto: ForecastItemDTO) {
        self.day = dto.day
        self.description = dto.description
        self.sunrise = dto.sunrise
        self.sunset = dto.sunset
        self.chanceRain = dto.chanceRain
        self.high = dto.high
        self.low = dto.low
        self.imageName = dto.type
    }
}

typealias ForecastItems = [ForecastItem]

extension ForecastItem {
    static let mock = ForecastItem(dto: ForecastItemDTO.mockForecastList().first!)
}
