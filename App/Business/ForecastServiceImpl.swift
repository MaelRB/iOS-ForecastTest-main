//
//  ForecastServiceImpl.swift
//  App
//
//  Created by Mael Romanin Bluteau on 02/05/2022.
//

import Combine
import Global

class ForecastServiceImpl: ForecastService {
    var items: CurrentValueSubject<ForecastItems, Never> = CurrentValueSubject([])
    @Inject var forecastNetworkService: ForecastNetworkService
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        fetchForecastItems()
    }
    
    private func fetchForecastItems() {
        forecastNetworkService.getForecast()
            .map() { forecastItemList -> ForecastItems in
                forecastItemList.map { ForecastItem(dto: $0) }
            }
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        print(error.localizedDescription)
                    default:
                        break
                }
            } receiveValue: {[weak self] forecastItems in
                guard let self = self else { return }
                self.items.send(forecastItems)
            }
            .store(in: &bag)
    }
    
}
