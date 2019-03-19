//
//  ProfileModel.swift
//  OH++
//
//  Created by Nate Baker on 3/19/19.
//  Copyright © 2019 Nate Baker. All rights reserved.
//

import Foundation
import Firebase


struct ProfileModel {
    var username: String
    var tutor: String
    var school: String
    var location: String
    var profile_image_url: String
    var skills: [Any]
    var numRatings: Int
    var avgRatings: Float
    
    
    var dictionary: [String: Any] {
        return [
            "username": username,
            "tutor": tutor,
            "school": school,
            "location": location,
            "profile_image_url": profile_image_url,
            "skills": skills,
            "numRatings": numRatings,
            "avgRatings": avgRatings
        ]
    }
}

extension ProfileModel {
    
    init?(dictionary: [String: Any]) {
      guard let username = dictionary["username"] as? String,
        let tutor = dictionary["tutor"] as? String,
        let school = dictionary["school"] as? String,
        let location = dictionary["location"] as? String,
        let profile_image_url = dictionary["profile_image_url"] as? String,
        let skills = dictionary["skills"] as? [Any],
        let numRatings = dictionary["numRatings"] as? Int,
        let avgRatings = dictionary["avgRatings"] as? Float
      else { return nil }
        
        self.init(
            username: username,
            tutor: tutor,
            school: school,
            location: location,
            profile_image_url: profile_image_url,
            skills: skills,
            numRatings: numRatings,
            avgRatings: avgRatings
        )
    }
    
}


