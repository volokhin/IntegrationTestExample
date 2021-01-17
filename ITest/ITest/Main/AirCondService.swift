import Foundation
import Combine

protocol IAirCondService {
    func fetchAirConds(query: String) -> AnyPublisher<[AirCondModel], Error>
}

// MARK: - Model

struct AirCondModel: Decodable {
    let id: Int
    let floor: Int
    let place: String
    let name: String
    let isEnabled: Bool
}

// MARK: - AirCondService

class AirCondService: IAirCondService {

    private let url = URL(string: "http://157.230.208.168/api/ac/list")!

    func fetchAirConds(query: String) -> AnyPublisher<[AirCondModel], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [AirCondModel].self, decoder: JSONDecoder())
            .map { items in items.filter { $0.name.localizedCaseInsensitiveContains(query) } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
