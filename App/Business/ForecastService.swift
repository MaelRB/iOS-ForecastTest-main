//
//  ForecastService.swift
//  App
//
//

import Combine

protocol ForecastService {
    var items: CurrentValueSubject<ForecastItems, Never> { get }
    var forecastNetworkService: ForecastNetworkService { get }
}
