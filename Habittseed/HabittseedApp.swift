import SwiftUI
import SwiftData

@main
struct HabitSeedApp: App {
    // 初回起動かどうかを保存するスイッチ
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true

    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                OnboardingView() // 初回: スタート画面へ
            } else {
                ContentView()    // 2回目以降: ホーム画面へ
            }
        }
        // ここでデータを読み込む設定をします
        .modelContainer(for: [Plant.self, HabitLog.self])
    }
}
