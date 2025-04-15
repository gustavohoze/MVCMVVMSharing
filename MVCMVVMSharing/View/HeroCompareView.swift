import SwiftUI

struct HeroCompareView: View {
    @State private var selectedHero1 = HeroData.Heroes[0]
    @State private var selectedHero2 = HeroData.Heroes[1]
    
    @ObservedObject var battleController = BattleController()

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select Hero 1")) {
                    Picker("Hero 1", selection: $selectedHero1) {
                        ForEach(HeroData.Heroes) { hero in
                            Text(hero.name).tag(hero)
                        }
                    }.pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Select Hero 2")) {
                    Picker("Hero 2", selection: $selectedHero2) {
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
                    Text(selectedHero1.name)
                        .bold()
                        .frame(width: 80)
                    Text(selectedHero2.name)
                        .bold()
                        .frame(width: 80)
                    Spacer()
                }

                // Use the controller function to get the comparison data
                ForEach(battleController.getComparisonData(hero1: selectedHero1, hero2: selectedHero2)) { row in
                    ComparisonRow(title: row.title, value1: row.value1, value2: row.value2)
                }
            }

            Divider().padding(.vertical)

            Button("Simulate Battle") {
                battleController.simulateBattle(hero1: selectedHero1, hero2: selectedHero2)
            }

            if let result = battleController.battleResult {
                Text(result)
                    .font(.title)
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Hero Comparison")
    }
}

#Preview {
    HeroCompareView()
}
