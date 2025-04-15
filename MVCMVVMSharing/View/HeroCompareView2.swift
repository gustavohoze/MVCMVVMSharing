import SwiftUI

struct HeroCompareView2: View {
    @StateObject var viewModel: HeroCompareViewModel

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select Hero 1")) {
                    Picker("Hero 1", selection: $viewModel.selectedHero1) {
                        ForEach(HeroData.Heroes) { hero in
                            Text(hero.name).tag(hero)
                        }
                    }.pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Select Hero 2")) {
                    Picker("Hero 2", selection: $viewModel.selectedHero2) {
                        ForEach(HeroData.Heroes) { hero in
                            Text(hero.name).tag(hero)
                        }
                    }.pickerStyle(MenuPickerStyle())
                }
            }.frame(height: 250)

            Divider().padding(.vertical)

            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Text("Attribute")
                        .bold()
                        .frame(width: 120, alignment: .leading)
                    Text(viewModel.selectedHero1.name)
                        .bold()
                        .frame(width: 80)
                    Text(viewModel.selectedHero2.name)
                        .bold()
                        .frame(width: 80)
                    Spacer()
                }

                // Use the ViewModel to get the comparison data
                ForEach(viewModel.comparisonData) { row in
                    ComparisonRow(title: row.title, value1: row.value1, value2: row.value2)
                }
            }

            Divider().padding(.vertical)

            Button("Simulate Battle") {
                viewModel.simulateBattle()
            }

            if let result = viewModel.battleResult {
                Text(result)
                    .font(.title)
                    .bold()
                    .padding()
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Hero Comparison")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            HeroCompareView()
        }
    }
}

#Preview {
    ContentView()
}
