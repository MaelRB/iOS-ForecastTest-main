//
//  DetailViewCoordinator.swift
//  App
//
//

import Foundation
import UIKit

class DetailViewCoordinator {
    
    weak var navigationController: UINavigationController?
    private weak var viewController: DetailViewController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start(with item: ForecastItem, completion: @escaping () -> Void) {
        let viewModel = DetailViewModel(forecastItem: item)
        viewModel.back = completion
        
        let viewController = DetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        
        self.viewController = viewController
    }
    
}
