class WebPageAbstractInfoRetrieve {
    static func get(from url: String, completion: (Result<WebPageAbstractInfo, Error>) -> Void) {
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
