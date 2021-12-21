
import Foundation
import UIKit

struct ApiResponse:Decodable {
    var response:[PlayerResponse]
}

struct PlayerResponse:Decodable {
    var player:PlayersDetails
    var statistics:[PlayerStatistics]
}

struct PlayersDetails:Decodable{
    var id:Int64
    var name:String
    var age:Int64
    var nationality:String
    var photo:String
}

struct PlayerStatistics:Decodable{
    var team:teamInfo
    var games:gamesDetails
    var goals:GoalStatistics
    var passes:passingStats
    var penalty:penaltyDetails
}
struct GoalStatistics:Decodable{
    var total:Int64?
    var assists:Int64?
}
struct passingStats:Decodable{
    var total:Int64?
    var key:Int64?
    var accuracy:Int64?
}
struct teamInfo:Decodable{
    var name:String
    var logo:String
}
struct gamesDetails:Decodable{
    var appearences:Int64?
}
struct penaltyDetails:Decodable{
    var scored:Int64?
    var missed:Int64?
}


