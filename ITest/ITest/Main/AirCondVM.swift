import Foundation
import SwiftUI

struct AirCondVM: Identifiable {
    let id = UUID()
    let name: String
    let caption: String
}

// MARL: - Init from Model

extension AirCondVM {
    init(model: AirCondModel) {
        self.name = model.name
        self.caption = "\(model.place), \(model.isEnabled ? "включен" : "выключен")"
    }
}
