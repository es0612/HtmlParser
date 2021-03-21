import Quick
import Nimble
@testable import HtmlParser


class WebPageAbstractInfoRetrieveTests: QuickSpec {
    override func spec() {
        describe("Retrieve Web page Abstract Infomation.") {
            var htmsString: String?
            var result: WebPageAbstractInfo?
            var expected: WebPageAbstractInfo?

            context("about test1.html") {
                beforeEach {
                    htmsString = HtmlFileReader().fetchHtmlData(from: "test1")

                    result = WebPageAbstractInfoRetrieve.parseHtml(htmlString: htmsString!)

                    expected = WebPageAbstractInfo(
                        title: "og title",
                        description: "og description",
                        siteName: "og site_name",
                        imageUrl: "og image")
                }

                it("og:titleの値がタイトルに設定されている") {
                    expect(result?.title).to(equal(expected?.title))
                }

                it("og:descriptionの値がdescriptionに設定されている") {
                    expect(result?.description).to(equal(expected?.description))
                }

                it("og:site_nameの値がsiteNameに設定されている") {
                    expect(result?.siteName).to(equal(expected?.siteName))
                }

                it("og:imageの値がimageUrlに設定されている") {
                    expect(result?.imageUrl).to(equal(expected?.imageUrl))
                }
            }

            context("about test2.html") {
                beforeEach {
                    htmsString = HtmlFileReader().fetchHtmlData(from: "test2")

                    result = WebPageAbstractInfoRetrieve.parseHtml(htmlString: htmsString!)

                    expected = WebPageAbstractInfo(
                        title: nil,
                        description: nil,
                        siteName: nil,
                        imageUrl: nil)
                }

                it("nilがタイトルに設定されている") {
                    expect(result?.title).to(beNil())
                }

                it("nilがdescriptionに設定されている") {
                    expect(result?.description).to(beNil())
                }

                it("nilがsiteNameに設定されている") {
                    expect(result?.siteName).to(beNil())
                }

                it("nilがimageUrlに設定されている") {
                    expect(result?.imageUrl).to(beNil())
                }
            }

            context("about test3.html") {
                beforeEach {
                    htmsString = HtmlFileReader().fetchHtmlData(from: "test3")

                    result = WebPageAbstractInfoRetrieve.parseHtml(htmlString: htmsString!)

                    expected = WebPageAbstractInfo(
                        title: "title tag",
                        description: "meta description",
                        siteName: nil,
                        imageUrl: nil)
                }

                it("titleタグの値がタイトルに設定されている") {
                    expect(result?.title).to(equal(expected?.title))
                }

                it("metaタグの値がdescriptionに設定されている") {
                    expect(result?.description).to(equal(expected?.description))
                }
            }

            context("about test4.html") {
                beforeEach {
                    htmsString = HtmlFileReader().fetchHtmlData(from: "test4")

                    result = WebPageAbstractInfoRetrieve.parseHtml(htmlString: htmsString!)

                    expected = WebPageAbstractInfo(
                        title: "h1 title",
                        description: nil,
                        siteName: nil,
                        imageUrl: nil)
                }

                it("h1タグの値がタイトルに設定されている") {
                    expect(result?.title).to(equal(expected?.title))
                }
            }
        }
    }
}
