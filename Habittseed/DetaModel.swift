import Foundation
import SwiftData

// 植物データ
@Model
final class Plant {
    var id: UUID
    var name: String
    var currentHp: Int
    var maxHp: Int
    var createdDate: Date
    var lastWateredDate: Date
    
    // ログとのリレーション（1つの植物に、複数のログが紐づく）
    @Relationship(deleteRule: .cascade) var logs: [HabitLog] = []
    
    init(name: String = "希望の種") {
        self.id = UUID()
        self.name = name
        self.currentHp = 3
        self.maxHp = 3
        self.createdDate = Date()
        self.lastWateredDate = Date()
    }
    
    var statusMessage: String {
        switch currentHp {
        case 3: return "いい感じ！調子はどう？"
        case 2: return "ちょっと喉が渇いたかも…"
        case 1: return "そろそろ枯れちゃうかも…"
        default: return "…… (元気がない)"
        }
    }
}

// 記録ログデータ
@Model
final class HabitLog {
    var date: Date
    var content: String // 「勉強した」などの内容
    
    init(content: String) {
        self.date = Date()
        self.content = content
    }
}
