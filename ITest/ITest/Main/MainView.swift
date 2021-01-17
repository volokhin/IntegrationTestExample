import SwiftUI

struct MainView: View {

    @ObservedObject var viewModel: MainVM

    init(viewModel: MainVM) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TextField("Название кондиционера", text: $viewModel.query, onCommit: viewModel.search)
                .keyboardType(.default)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .accessibility(identifier: "текстовое_поле_ввода")
                .padding()
            List(viewModel.items) { item in
                listItem(content: item)
            }
        }
    }

    func listItem(content: AirCondVM) -> some View {
        VStack(alignment: .leading) {
            Text(content.name)
                .font(.body)
                .foregroundColor(.primary)
                .accessibility(identifier: "название")
            Text(content.caption)
                .font(.footnote)
                .foregroundColor(.secondary)
                .accessibility(identifier: "подпись")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.top, .bottom])
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let view = AppContainer.shared.mainView()
        view.viewModel.items = [
            .init(
                name: "Вадим",
                caption: "iOS, включен"
            ),
            .init(
                name: "Сергей",
                caption: "Android, выключен"
            )
        ]
        return view
            .preferredColorScheme(.dark)
    }
}
