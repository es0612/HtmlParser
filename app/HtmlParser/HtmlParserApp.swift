import SwiftUI

@main
struct HtmlParserApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                webPageAbstractInfo: WebPageAbstractInfo(
                    title: nil, description: nil, siteName: nil, imageUrl: nil)
            )
        }
    }
}
