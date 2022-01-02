import Foundation
import Combine
class ApiManager {
    
    static func requestTopScorrer(leagueId:Int) -> AnyPublisher<ApiResponse,Error> {
    let headers = [
        "x-rapidapi-host": "api-football-beta.p.rapidapi.com",
        "x-rapidapi-key": "ecac8327bemsh99f7126b1ae0bb4p169414jsn91f54055c4a7"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://api-football-beta.p.rapidapi.com/players/topscorers?season=2021&league=\(leagueId)")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
        
        let publisher = session.dataTaskPublisher(for: request as URLRequest)
            .map{$0.data}
            .receive(on: DispatchQueue.main, options:nil)
            .decode(type: ApiResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
           
        return publisher
    }
    static func requestStandings(leagueId:Int , callback: @escaping (ApiResponseStandings) -> Void){
        let headers = [
            "x-rapidapi-host": "api-football-beta.p.rapidapi.com",
            "x-rapidapi-key": //"316a8b8851msh9e7bb43e4fe2958p1f7995jsn5c86ab336710"
            "ecac8327bemsh99f7126b1ae0bb4p169414jsn91f54055c4a7"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api-football-beta.p.rapidapi.com/standings?season=2021&league=\(leagueId)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {(data,response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                if let data = data{
                    let decoder = JSONDecoder()
                    do{
                        let result = try decoder.decode(ApiResponseStandings.self, from: data)
                        print(result)
                        callback(result)
                    }catch let e{
                        print(e)
                    }
                }
            }
        })
        dataTask.resume()
    }
}
