import SwiftUI

enum Theme {
    static let accent = Color(red: 0.78, green: 0.30, blue: 0.16)
    static let accent2 = Color(red: 0.35, green: 0.55, blue: 0.60)
    static let background = Color(red: 0.09, green: 0.06, blue: 0.05)

    static let largeTitle = Font.system(.largeTitle, design: .serif).weight(.bold)
    static let headline = Font.system(.headline, design: .rounded)
    static let body = Font.system(.body, design: .default)
    static let caption = Font.system(.caption, design: .rounded)

    static let cornerRadius: CGFloat = 14
}
