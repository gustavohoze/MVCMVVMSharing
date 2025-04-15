import SwiftUI

struct ComparisonRow: View {
    let title: String
    let value1: Any
    let value2: Any

    var body: some View {
        HStack {
            Text(title)
                .frame(width: 120, alignment: .leading)

            Text(stringify(value1))
                .foregroundColor(compareValues(value1: value1, value2: value2) ? .green : .red)
                .frame(width: 80)

            Text(stringify(value2))
                .foregroundColor(compareValues(value1: value2, value2: value1) ? .green : .red)
                .frame(width: 80)
        }
    }

    private func stringify(_ value: Any) -> String {
        if let double = value as? Double {
            return String(format: "%.2f", double)
        } else {
            return String(describing: value)
        }
    }

    private func compareValues(value1: Any, value2: Any) -> Bool {
        switch (value1, value2) {
        case let (a as Int, b as Int):
            return a > b
        case let (a as Double, b as Double):
            return a > b
        case let (a as Float, b as Float):
            return a > b
        case let (a as String, b as String):
            return a > b
        default:
            return false
        }
    }
}
