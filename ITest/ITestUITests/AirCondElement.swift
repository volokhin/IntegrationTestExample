import Foundation
import XCTest

class AirCondElement {

    private let root: XCUIElement

    var name: String {
        return root.staticTexts["название"].label
    }

    var caption: String {
        return root.staticTexts["подпись"].label
    }

    init(root: XCUIElement) {
        self.root = root
    }
}
