//
//  ListViewModel.swift
//  App
//
//

import Global
import GlobalUI
import Combine

class ListViewModel {
    @Inject var service: ForecastService
    private var bag = Set<AnyCancellable>()

    var datas = CurrentValueSubject<[TableViewSection], Never>([])
    
    private(set) var viewDataList = [TableViewData]() {
        didSet {
            self.datas.send([TableViewSection(identifier: "section",
                                              datas: self.viewDataList)])
        }
    }

    var showDetail: ((ForecastItem) -> Void)?

    var title: String = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String

    init() {
        service.items
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.createSection($0) }
            .store(in: &bag)
    }

    private func createSection(_ items: ForecastItems) {
        let datas: [TableViewData] = items.map {
            ListCellData(forecast: $0)
                .set(trailingActions: [self.trailingAction(item: $0)])
                .set(separator: .full)
                .set(separatorColor: .lightGray)
                .did { [weak self] data in
                    guard let self = self else { return }
                    guard let cellData = data as? ListCellData else { return }
                    self.showDetail?(cellData.forecast)
                }
        }
        viewDataList = datas
    }

    private func trailingAction(item: ForecastItem) -> TableViewContextualAction {
        return TableViewContextualAction(title: "Delete", style: .destructive, backgroundColor: .red) { item in
            item.remove(to: &self.viewDataList)
        }
    }
}
