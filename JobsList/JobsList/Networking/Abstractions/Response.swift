//
//  Response.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

enum Response<T> where T: Decodable {
    case
    data(T),
    error(Error)
    
    init(response: HTTPURLResponse? = nil, data: Data? = nil, error: Error? = nil) {
        guard response?.statusCode == 200, error == nil else {
            let responseError = error ?? NetworkError.noData
            print(response?.description ?? "")
            print("Error: \(responseError.localizedDescription)")
            self = .error(responseError)
            return
        }
        
        guard let data = data, let jsonObject = try? JSONSerialization.jsonObject(with: data) else {
            print(response?.description ?? "")
            print("Error: \(NetworkError.noData.localizedDescription)")
            self = .error(NetworkError.noData)
            return
        }
        
        print(response?.description ?? "")
        print("Response JSON")
        print(jsonObject)
            
        do {
            let responseObject = try JSONDecoder().decode(T.self, from: data)
            self = .data(responseObject)
        } catch {
            self = .error(error)
        }
    }
}
