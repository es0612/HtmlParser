import Quick
import Nimble
@testable import HtmlParser


class WebPageAbstractInfoRetrieveTests: QuickSpec {
    override func spec() {
        describe("Retrieve Web page Abstract Infomation.") {
            context("") {
                it("") {
                }
            }
        }
    }


    func readHtmlFile(fileName: String) -> String {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "html")  else {
            fatalError("file not found.")
        }

        guard let fileContents = try? String(contentsOf: fileURL) else {
            fatalError("read error.")
        }

        return fileContents
    }
}
