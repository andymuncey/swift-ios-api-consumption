import Foundation

struct EngagementMethods : Codable {
    var url: String?
    var type: String?
    var description: String?
    var title: String?
}

struct Force : Codable {
    
    var description: String?
    var url: String

    var engagementMethods : [EngagementMethods]
    var telephone: String?
    var id: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case engagementMethods = "engagement_methods"
        case telephone
        case url
        case description
        case id
        case name
    }
}
