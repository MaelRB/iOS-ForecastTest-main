//
//  ForecastNetworkServiceStub.swift
//  App
//
//  Created by Mael Romanin Bluteau on 02/05/2022.
//

import Combine

class ForecastNetworkServiceStub: ForecastNetworkService {
    func getForecast() -> AnyPublisher<[ForecastItemDTO], Error> {
        Future<[ForecastItemDTO], Error> { promise in
            let list = ForecastItemDTO.mockForecastList()
            promise(.success(list))
        }
        .eraseToAnyPublisher()
    }
}
