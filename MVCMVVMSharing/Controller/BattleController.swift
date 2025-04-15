import Foundation

class BattleController: ObservableObject {
    @Published var battleResult: String?

    // Simulate the battle between two heroes
    func simulateBattle(hero1: Hero, hero2: Hero) {
        var hero1CurrentHP = hero1.hp
        var hero2CurrentHP = hero2.hp
        var turn = 0

        // Simulate battle with simple turn-based mechanics
        while hero1CurrentHP > 0 && hero2CurrentHP > 0 {
            turn += 1

            // Hero 1 attacks Hero 2
            let hero1Damage = calculateDamage(attacker: hero1, defender: hero2)
            hero2CurrentHP -= hero1Damage
            if hero2CurrentHP <= 0 {
                battleResult = "\(hero1.name) wins after \(turn) turns!"
                return
            }

            // Hero 2 attacks Hero 1
            let hero2Damage = calculateDamage(attacker: hero2, defender: hero1)
            hero1CurrentHP -= hero2Damage
            if hero1CurrentHP <= 0 {
                battleResult = "\(hero2.name) wins after \(turn) turns!"
                return
            }
        }

        battleResult = "It's a draw!"
    }

    // Calculate the damage dealt by an attacker to a defender
    private func calculateDamage(attacker: Hero, defender: Hero) -> Int {
        let baseDamage = max(attacker.physicalATK - defender.physicalDEF, 0)
        let critMultiplier = attacker.critChance >= Double.random(in: 0..<1) ? 2.0 : 1.0
        return Int(Double(baseDamage) * critMultiplier)
    }

    // Return the comparison data
    func getComparisonData(hero1: Hero, hero2: Hero) -> [ComparisonRowData] {
        return [
            ComparisonRowData(title: "HP", value1: hero1.hp, value2: hero2.hp),
            ComparisonRowData(title: "Physical ATK", value1: hero1.physicalATK, value2: hero2.physicalATK),
            ComparisonRowData(title: "Physical DEF", value1: hero1.physicalDEF, value2: hero2.physicalDEF),
            ComparisonRowData(title: "Attack Speed", value1: hero1.attackSpeed, value2: hero2.attackSpeed),
            ComparisonRowData(title: "Crit Chance", value1: hero1.critChance, value2: hero2.critChance)
        ]
    }
}

// Struct to store data for each comparison row
struct ComparisonRowData: Identifiable {
    var id: String { title }
    let title: String
    let value1: Any
    let value2: Any
}
