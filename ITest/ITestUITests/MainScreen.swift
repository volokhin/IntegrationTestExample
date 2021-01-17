import Foundation
import XCTest

class MainScreen {

    private let app: XCUIApplication

    var items: [AirCondElement] {
        _ = app.cells.firstMatch.waitForExistence(timeout: 5)
        return app.cells.allElementsBoundByIndex.map(AirCondElement.init(root:))
    }

    init() {
        app = XCUIApplication()
    }

    func launch() -> Self {
        app.launch()
        return self
    }

    func search(query: String) -> Self {
        let textField = app.textFields["текстовое_поле_ввода"]
        textField.tap()
        textField.typeText(query)
        textField.typeText(XCUIKeyboardKey.return.rawValue)
        return self
    }
}
