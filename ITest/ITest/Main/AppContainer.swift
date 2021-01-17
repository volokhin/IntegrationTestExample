import Foundation
import SwiftUI

protocol IAppContainer {
    var airCondService: IAirCondService { get }
    func mainView() -> MainView
    func mainVM() -> MainVM
}

class AppContainer: IAppContainer {

    static var shared: AppContainer {
        return AppContainer()
    }

    private init() {}

    lazy var airCondService: IAirCondService = {
        return AirCondService()
    }()

    func mainVM() -> MainVM {
        return MainVM(service: airCondService)
    }

    func mainView() -> MainView {
        return MainView(viewModel: mainVM())
    }
}
