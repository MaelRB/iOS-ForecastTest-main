//
//  ForecastItemDTO.swift
//  App
//
//

import Foundation

struct ForecastItemDTO: Codable {
    let day: String
    let description: String
    let sunrise, sunset: Int
    let chanceRain: Double
    let high, low: Int
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case day
        case description
        case sunrise, sunset
        case chanceRain = "chance_rain"
        case high, low, type
    }
}

extension ForecastItemDTO {
    
    @ForecastItemDtoArrayBuilder
    static func mockForecastList() -> [ForecastItemDTO] {
        ForecastItemDTO {
            "1"
            "Cloudy"
            27420
            63600
            0.05
            23
            12
            "cloud"
        }
        
        ForecastItemDTO {
            "2"
            "Sunny"
            27600
            63420
            0.1
            26
            15
            "sunny"
        }
        
        ForecastItemDTO {
            "3"
            "Overcast"
            28020
            62000
            0.3
            25
            15
            "overcast"
        }
        
        ForecastItemDTO {
            "4"
            "Rain"
            28260
            62820
            0.75
            21
            14
            "rain"
        }
        
        ForecastItemDTO {
            "5"
            "Windy"
            28260
            62820
            0.36
            20
            13
            "windy"
        }
        
        ForecastItemDTO {
            "6"
            "Lightning"
            28330
            62910
            0.9
            19
            14
            "lightning"
        }
    }
}

typealias ForecastItemDS = (day: String, description: String, sunrise: Int, sunset: Int, chanceRain: Double, high: Int, low: Int, type: String)

extension ForecastItemDTO {
    init(@ForecastItemDtoBuilder _ makeForecast: () -> ForecastItemDS) {
        let ds = makeForecast()
        day = ds.day
        description = ds.description
        sunrise = ds.sunrise
        sunset = ds.sunset
        chanceRain = ds.chanceRain
        high = ds.high
        low = ds.low
        type = ds.type
    }
}

@resultBuilder
enum ForecastItemDtoBuilder {
    static func buildBlock(_ day: String, _ description: String, _ sunrise: Int, _ sunset: Int, _ chanceRain: Double, _ high: Int, _ low: Int, _ type: String) -> (String, String, Int, Int, Double, Int, Int, String) {
        return (day, description, sunrise, sunset, chanceRain, high, low, type)
    }
}

@resultBuilder
enum ForecastItemDtoArrayBuilder {
    static func buildBlock(_ components: ForecastItemDTO...) -> [ForecastItemDTO] {
        return components
    }
}
