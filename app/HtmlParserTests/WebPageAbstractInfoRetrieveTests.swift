import Quick
import Nimble
@testable import HtmlParser


class WebPageAbstractInfoRetrieveTests: QuickSpec {
    override func spec() {
        describe("Retrieve Web page Abstract Infomation.") {
            context("") {
                it("get html contents") {
                    print(self.readHtmlFile(fileName: "test1"))
                }
            }
        }
    }


    func readHtmlFile(fileName: String) -> String {

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
