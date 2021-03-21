import Alamofire
import Kanna

enum RetrieveError: Error {
    case requestError
}

class WebPageAbstractInfoRetrieve {

    static func get(from url: String, completion: @escaping (Result<WebPageAbstractInfo, Error>) -> Void) {

        AF.request(url).responseString { response in
            switch response.result {
            case .success(let htmlString):
                completion(.success(parseHtml(htmlString: htmlString)))
            case .failure(let error):
                switch error {
                default:
                    completion(.failure(RetrieveError.requestError))
                }
            }
        }
    }

    static func parseHtml(htmlString: String) -> WebPageAbstractInfo {
        var title: String?
        var description: String?
        var siteName: String?
        var imageUrl: String?

        if let doc = try? HTML(html: htmlString, encoding: .utf8) {

            title = doc.xpath("//meta[@property='og:title']").first?["content"]
            if title == nil {
                title = doc.title
            }
            if title == nil {
                title = doc.css("h1").first?.text
            }

            description = doc.xpath("//meta[@property='og:description']").first?["content"]
            if description == nil {
                description = doc.xpath("//meta[@name='description']").first?["content"]
            }

            siteName = doc.xpath("//meta[@property='og:site_name']").first?["content"]

            imageUrl = doc.xpath("//meta[@property='og:image']").first?["content"]

        }

        let response = WebPageAbstractInfo(
            title: title, description: description, siteName: siteName, imageUrl: imageUrl
        )

        return response
    }
}


struct WebPageAbstractInfo: Equatable {
    let title: String?
    let description: String?
    let siteName: String?
    let imageUrl: String?
}
