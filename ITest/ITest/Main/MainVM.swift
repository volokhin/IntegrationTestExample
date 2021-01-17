import Foundation
import SwiftUI
import Combine

class MainVM: ObservableObject {

    @Published var query: String = ""
    @Published var items: [AirCondVM] = []

    private let service: IAirCondService
    private var subscriptions: [AnyCancellable] = []

    init(service: IAirCondService) {
        self.service = service
    }

    func search() {
        service.fetchAirConds(query: query)
            .sink(receiveCompletion: fetchCompletion, receiveValue: fetchSuccess)
            .store(in: &subscriptions)
    }
}

// MARK: - Private

extension MainVM {

    private func fetchCompletion(completion: Subscribers.Completion<Error>) {
        guard case .failure(let error) = completion else { return }
        print(error.localizedDescription)
    }

    private func fetchSuccess(response: [AirCondModel]) {
        items = response.map(AirCondVM.init)
    }
}
