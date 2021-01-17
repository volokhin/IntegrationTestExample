import XCTest
import Nimble


class UITests: XCTestCase {

    func testExample() {
        let screen = MainScreen()
            .launch()
            .search(query: "Даша")

        expect(screen.items).to(haveCount(1))
        expect(screen.items[0].name) == "Даша"
        expect(screen.items[0].caption) == "iOS, выключен"
    }
}
