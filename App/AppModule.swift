//
//  AppModule.swift
//  App
//
//

import Global

public class AppModule: Module {
    public static var shared = AppModule()
    private init() {
        // Singleton
    }

    public func registerServices() {
        setForecastNetworkService()
        GlobalContainer.defaultContainer.register(ForecastService.self) { _ in ForecastServiceImpl() }
    }
    
    private func setForecastNetworkService() {
        if BuildConfiguration.shared.environment == .demo {
            GlobalContainer.defaultContainer.register(ForecastNetworkService.self) { _ in ForecastNetworkServiceStub() }
        } else {
            GlobalContainer.defaultContainer.register(ForecastNetworkService.self) { _ in ForecastNetworkServiceImpl() }
        }
    }
}
