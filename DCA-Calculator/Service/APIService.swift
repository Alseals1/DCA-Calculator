import Foundation
import Combine


struct ApiService {
    var API_KEY: String {
        return keys.randomElement() ?? ""
    }
    
    let keys = ["SBE1XDXCDOLNYSKY", "LJNAZ5WL0W86NK78"]
    
    
    func fetchSymbolPublisher(keyword: String) -> AnyPublisher<SearchResultss, Error> {
         
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keyword)&apikey=\(API_KEY)"
        
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: SearchResultss.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
        
            
        
        
    }
}
