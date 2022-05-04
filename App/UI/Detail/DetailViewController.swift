//
//  DetailViewController.swift
//  App
//
//

import UIKit
import Combine
import GlobalUI
import SwiftUI

class DetailViewController: UIViewController {
    
    private var viewModel: DetailViewModel

    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addFullScreenView(DetailView(forecastItem: viewModel.forecastItem))
        self.title = viewModel.title
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.back?()
    }
}
