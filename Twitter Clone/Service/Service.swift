//
//  Service.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/27/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON



struct Service {
    
    static let sharedInstance = Service()
    
    let tron = TRON(baseURL: "http://localhost/")
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource?, Error?) -> ()){
        
        let request: APIRequest<HomeDataSource, JSONError> = tron.swiftyJSON.request("sampleJSON.json")
        
        request.perform(withSuccess: { (homeDataSource) in
            
            completion(homeDataSource, nil)
            
        }) { (err) in
            
            completion(nil, err)
                        
        }
        
        
    }
    
    class JSONError: JSONDecodable {
        
        required init(json: JSON) throws {
            
            print("JSON error\n", json)
            
        }
    }
    
}
