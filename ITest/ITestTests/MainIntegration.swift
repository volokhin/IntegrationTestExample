import Foundation
@testable import ITest

class MainIntegration {

    private let container: IAppContainer
    private var viewModel: MainVM?

    init() {
        self.container = AppContainer.shared
    }

    var items: [AirCondVM] {
        waitUntil { self.viewModel?.items.count ?? 0 > 0 }
        return viewModel?.items ?? []
    }

    func launch() -> Self {
        viewModel = container.mainVM()
        return self
    }

    func search(query: String) -> Self {
        viewModel?.query = query
        viewModel?.search()
        return self
    }
}
