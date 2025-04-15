import Foundation

struct HeroData {
    static let Heroes: [Hero] = [
        Hero(name: "Layla", hp: 2500, physicalATK: 120, physicalDEF: 50, attackSpeed: 120, critChance: 0.25),
        Hero(name: "Miya", hp: 2200, physicalATK: 110, physicalDEF: 45, attackSpeed: 140, critChance: 0.20),
        Hero(name: "Leomord", hp: 2900, physicalATK: 140, physicalDEF: 70, attackSpeed: 100, critChance: 0.15),
        Hero(name: "Lancelot", hp: 2400, physicalATK: 130, physicalDEF: 40, attackSpeed: 130, critChance: 0.30)
    ]
}
