import Foundation
@testable import HtmlParser

class HtmlFileReader {
    func fetchHtmlData(from fileName: String) -> String {

        let testBundle = Bundle(for: type(of: self))

        guard let fileURL = testBundle.url(forResource: fileName, withExtension: "html")  else {
            fatalError("file not found.")
        }

        guard let fileContents = try? String(contentsOf: fileURL) else {
            fatalError("read error.")
        }

        return fileContents
    }
}
