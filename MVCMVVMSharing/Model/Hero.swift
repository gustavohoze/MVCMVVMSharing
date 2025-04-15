import Foundation

class Hero : Hashable, Identifiable {
    static func == (lhs: Hero, rhs: Hero) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    
    var id : UUID;
    var name : String;
    var hp: Int;
    var physicalATK : Int;
    var physicalDEF : Int;
    var attackSpeed : Int;
    var critChance : Double;
    
    
    
    init(id: UUID = UUID(), name: String, hp: Int, physicalATK: Int, physicalDEF: Int, attackSpeed: Int, critChance: Double) {
        self.id = id
        self.hp = hp
        self.name = name
        self.physicalATK = physicalATK
        self.physicalDEF = physicalDEF
        self.attackSpeed = attackSpeed
        self.critChance = critChance
    }
    
    func attack(opponent: Hero) -> Int {
        let damage = max(self.physicalATK - opponent.physicalDEF, 0)
        return damage
    }
    
}
