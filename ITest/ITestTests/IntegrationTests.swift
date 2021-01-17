import XCTest
import Nimble
@testable import ITest

class IntegrationTests: XCTestCase {

    func testExample() {
        let screen = MainIntegration()
            .launch()
            .search(query: "Даша")

        expect(screen.items).to(haveCount(1))
        expect(screen.items[0].name) == "Даша"
        expect(screen.items[0].caption) == "iOS, выключен"
    }
}
