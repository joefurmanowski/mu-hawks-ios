import Foundation
import UIKit

struct MU:Codable {
    var academics:Schools
    var athletics:Athletics
    var events:[Event]
    var landmarks:[Landmark]
    
    enum CodingKeys:String, CodingKey {
        case academics = "academics"
        case athletics = "athletics"
        case events = "events"
        case landmarks = "landmarks"
    }
}

struct Athletics: Codable {
    var sports:[Sport]
    
    enum CodingKeys: String, CodingKey {
        case sports = "sports"
    }
}

struct Sport: Codable {
    var name: String
    var homepageUrl: String
    var scheduleUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case homepageUrl = "homepageUrl"
        case scheduleUrl = "scheduleUrl"
    }
}

struct Schools:Codable {
    var schools:[School]
   
    enum CodingKeys: String, CodingKey {
        case schools = "schools"
    }
}

struct School:Codable {
    var name: String
    var departments:[Department]
   
    enum CodingKeys: String, CodingKey {
        case name = "schoolName"
        case departments = "departments"
    }
}

struct Department:Codable {
    var name:String
    var degrees:[Degrees]
    
    enum CodingKeys: String, CodingKey {
        case name = "deptName"
        case degrees = "degrees"
    }
}

struct Degrees:Codable {
    var name:String?
    var fullName: String?
    var description: String?
    var requiredCourses: [Course]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case fullName = "fullName"
        case description = "description"
        case requiredCourses = "requiredCourses"
    }
}

struct Course:Codable {
    var name: String
    var fullName: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case fullName = "fullName"
    }
}

struct Event:Codable {
    var name: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
    }
}

struct Landmark:Codable {
    var name: String?
    var latitude: Double?
    var longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

class MUModel {
    static let sharedInstance = MUModel()
    
    var muInfo:MU? // MU information
    
    
    // Constructor method
    private init() {
        readAcademicsData()
    }
    
    // 1. Read json file as string
    // 2. Convert String to data using UTF8 characters
    // 3. Decode the data as an array of structs
    // 4. Wrap inside a do-try block and catch in case of error
    func readAcademicsData() {
        if let filename = Bundle.main.path(forResource: "MonmouthInfo", ofType: "json") {
            do {
                let jsonStr = try String(contentsOfFile: filename)
                let jsonData = jsonStr.data(using: .utf8)!
                
                muInfo = try JSONDecoder().decode(MU.self, from: jsonData)
                // print (muInfo!)
            } catch {
                print("The file could not be loaded.")
                print(error)
            }
        }
    }
    
    // Assigning departments to corresponding dictionary array
    func getSchools () -> [School]{
        var schools: [School] = []
        if let mu = muInfo {
            schools = mu.academics.schools
        }
        return schools
    }
    
    func getDepartments (inSchool school: String) -> [Department]{
        var depts: [Department] = []
        if let mu = muInfo {
            if let index = mu.academics.schools.firstIndex(where: {$0.name == school}) {
                depts =  mu.academics.schools[index].departments
            }
        }
        if let mu = muInfo, let index = mu.academics.schools.firstIndex(where: {$0.name == school}) {
                depts =  mu.academics.schools[index].departments
            }
        
        return depts
    }
    
    func getSports() -> [Sport]{
        var sports: [Sport] = []
        if let mu = muInfo {
            sports = mu.athletics.sports
        }
        return sports
    }
    
    func getDeptDegrees (inSchool school: String, andDept dept: String) -> [Degrees]{
        var degrees: [Degrees] = []
        if let mu = muInfo,
           let index = mu.academics.schools.firstIndex(where: {$0.name == school}),
           let deptIndex = mu.academics.schools[index].departments.firstIndex(where: {$0.name == dept}) {
                    degrees = mu.academics.schools[index].departments[deptIndex].degrees
        }
        return degrees
    }
    
    func findDegree (inSchool school: String, andDept dept: String, withName name: String) -> Degrees {
        var degree: Degrees?
        if let mu = muInfo,
           let index = mu.academics.schools.firstIndex(where: {$0.name == school}),
           let deptIndex = mu.academics.schools[index].departments.firstIndex(where: {$0.name == dept}) {
            degree = mu.academics.schools[index].departments[deptIndex].degrees.first(where: {$0.name == name})!
        }
        return degree!
    }
    
    func getAllDegrees() -> [(Degrees, String, String)] {
        var degrees:[(Degrees, String, String)] = []
        for school in getSchools() {
            let departments = getDepartments(inSchool: school.name)
            for department in departments {
                for degree in getDeptDegrees(inSchool: school.name, andDept: department.name) {
                    degrees.append((degree, school.name, department.name))
                }
            }
        }
        return degrees
    }
    
    func getEvents() -> [Event] {
        var events: [Event] = []
        if let mu = muInfo {
            events = mu.events
        }
        return events
    }
    
    func getLandmarks() -> [Landmark] {
        var landmarks: [Landmark] = []
        if let mu = muInfo {
            landmarks = mu.landmarks
        }
        return landmarks
    }

}
