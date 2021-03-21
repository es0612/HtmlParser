import Alamofire
import Kanna

class WebPageAbstractInfoRetrieve {
    static func get(from url: String, completion: (Result<WebPageAbstractInfo, Error>) -> Void) {

        AF.request("https://www.yahoo.co.jp/").responseString { response in
            switch response.result {
            case .success(let htmlString):
                if let doc = try? HTML(html: htmlString, encoding: .utf8) {

//                    https://digitalidentity.co.jp/blog/seo/ogp-share-setting.html#:~:text=%E3%83%9A%E3%83%BC%E3%82%B8%E3%82%BF%E3%82%A4%E3%83%88%E3%83%AB(og%3Atitle),-%E3%83%9A%E3%83%BC%E3%82%B8%E3%81%AEtitle&text=%E4%B8%80%E8%88%AC%E7%9A%84%E3%81%AB%E3%81%AF%E3%82%B5%E3%82%A4%E3%83%88,%E5%A5%BD%E3%81%BE%E3%81%97%E3%81%84%E3%81%A8%E3%81%95%E3%82%8C%E3%81%A6%E3%81%84%E3%81%BE%E3%81%99%E3%80%82

                    print(doc.xpath("//meta[@property='og:title']").first?["content"] ?? "no og:title")
                    print(doc.title ?? "no title")
                    print(doc.css("h1").first?.text ?? "no h1 tags")


                    print(doc.xpath("//meta[@property='og:description']").first?["content"] ?? "no og:description")

                    print(doc.xpath("//meta[@name='description']").first?["content"] ?? "no meta description")

                    print(doc.xpath("//meta[@property='og:site_name']").first?["content"] ?? "no og:site_name")

                    print(doc.xpath("//meta[@property='og:image']").first?["content"] ?? "no og:image")

                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        completion(.success(WebPageAbstractInfo(title: "test", description: "test", siteName: "test", imageUrl: "test")))
    }
}

struct WebPageAbstractInfo {

    let title: String?
    let description: String?
    let siteName: String?
    let imageUrl: String?

    //    Title
    //
    //    1. og:title
    //
    //    2. htmle title tag
    //
    //    3. h1
    //
    //    Description
    //
    //    1. og:description
    //
    //    2. meta description
    //
    //    SiteName
    //
    //    1. og:site_name
    //
    //    Image
    //
    //    1. og:image

}
