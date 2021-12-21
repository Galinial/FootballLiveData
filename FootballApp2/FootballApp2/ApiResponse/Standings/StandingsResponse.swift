import Foundation
import UIKit

struct ApiResponseStandings:Decodable{
    var response:[StandingResponse]
}

struct StandingResponse:Decodable{
    var league:leagueDetails
}
struct leagueDetails:Decodable{
    var league:Int64?
    var name:String
    var logo:String
    var standings:[[standingsDetails]]
}
struct standingsDetails:Decodable{
    var rank:Int64
    var team:teamDetails
    var points:Int64
    var goalsDiff:Int64
    var form:String
    var all:gameStats
    
}
struct teamDetails:Decodable{
    var name:String
    var logo:String
}
struct gameStats:Decodable{
    var played:Int64
    var win:Int64
    var draw:Int64
    var lose:Int64
}
