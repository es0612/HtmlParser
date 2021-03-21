import SwiftUI

struct ContentView: View {
    @State var webPageAbstractInfo: WebPageAbstractInfo

    var body: some View {
        List {
            Text(webPageAbstractInfo.title ?? "no title")
            Text(webPageAbstractInfo.siteName ?? "no siteName")
            Text(webPageAbstractInfo.description ?? "no description")
            Text(webPageAbstractInfo.imageUrl ?? "no imageUrl")
        }
        .padding()
        .onAppear {
            WebPageAbstractInfoRetrieve.get(from: "") { result in
                switch result {
                case .success(let webInfo):
                    self.webPageAbstractInfo = webInfo
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            webPageAbstractInfo: WebPageAbstractInfo(
                title: nil, description: nil, siteName: nil, imageUrl: nil)
        )
    }
}
