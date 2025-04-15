import Foundation
import SwiftUI

class HeroCompareViewModel: ObservableObject {
    @Published var selectedHero1: Hero
    @Published var selectedHero2: Hero
    @Published var battleResult: S?
    @Published var comparisonData: [ComparisonRowData] = []

    // Initialize the view model with default heroes
    init(hero1: Hero, hero2: Hero) {
        self.selectedHero1 = hero1
        self.selectedHero2 = hero2
        updateComparisonData()
    }

    // Simulate the battle between two heroes
    func simulateBattle() {
        var hero1CurrentHP = selectedHero1.hp
        var hero2CurrentHP = selectedHero2.hp
        var turn = 0

        // Simulate battle with simple turn-based mechanics
        while hero1CurrentHP > 0 && hero2CurrentHP > 0 {
            turn += 1

            // Hero 1 attacks Hero 2
            let hero1Damage = calculateDamage(attacker: selectedHero1, defender: selectedHero2)
            hero2CurrentHP -= hero1Damage
            if hero2CurrentHP <= 0 {
                battleResult = "\(selectedHero1.name) wins after \(turn) turns!"
                return
            }

            // Hero 2 attacks Hero 1
            let hero2Damage = calculateDamage(attacker: selectedHero2, defender: selectedHero1)
            hero1CurrentHP -= hero2Damage
            if hero1CurrentHP <= 0 {
                battleResult = "\(selectedHero2.name) wins after \(turn) turns!"
                return
            }
        }

        battleResult = "It's a draw!"
    }

    // Update comparison data after hero selection or battle
    func updateComparisonData() {
        comparisonData = [
            ComparisonRowData(title: "HP", value1: selectedHero1.hp, value2: selectedHero2.hp),
            ComparisonRowData(title: "Physical ATK", value1: selectedHero1.physicalATK, value2: selectedHero2.physicalATK),
            ComparisonRowData(title: "Physical DEF", value1: selectedHero1.physicalDEF, value2: selectedHero2.physicalDEF),
            ComparisonRowData(title: "Attack Speed", value1: selectedHero1.attackSpeed, value2: selectedHero2.attackSpeed),
            ComparisonRowData(title: "Crit Chance", value1: selectedHero1.critChance, value2: selectedHero2.critChance)
        ]
    }

    // Calculate the damage dealt by an attacker to a defender
    private func calculateDamage(attacker: Hero, defender: Hero) -> Int {
        let baseDamage = max(attacker.physicalATK - defender.physicalDEF, 0)
        let critMultiplier = attacker.critChance >= Double.random(in: 0..<1) ? 2.0 : 1.0
        return Int(Double(baseDamage) * critMultiplier)
    }

    // Function to change the selected hero1
    func setSelectedHero1(hero: Hero) {
        selectedHero1 = hero
        updateComparisonData()
    }

    // Function to change the selected hero2
    func setSelectedHero2(hero: Hero) {
        selectedHero2 = hero
        updateComparisonData()
    }
}
