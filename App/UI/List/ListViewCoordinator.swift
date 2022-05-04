//
//  ListViewCoordinator.swift
//  App
//
//

import UIKit

class ListViewCoordinator {

    weak var navigationController: UINavigationController?
    private weak var viewController: ListViewController?
    
    private var detailViewCoordinator: DetailViewCoordinator?

    public func start(window: UIWindow) {
        let viewModel = ListViewModel()
        
        viewModel.showDetail = showDetailViewController(for:)

        let viewController = ListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController

        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    private func showDetailViewController(for forecastItem: ForecastItem) {
        let coordinator = DetailViewCoordinator(navigationController: navigationController)
        coordinator.start(with: forecastItem) { [weak self] in
            self?.detailViewCoordinator = nil
        }
        self.detailViewCoordinator = coordinator
    }
}
