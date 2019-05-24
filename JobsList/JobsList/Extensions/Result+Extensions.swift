//
//  Result+Extensions.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/24/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

extension Result where Success: Decodable, Failure == NetworkError {
    init(response: HTTPURLResponse? = nil, data: Data? = nil, error: Error? = nil) {
        guard response?.statusCode == 200, error == nil else {
            print(response?.description ?? "")
            print("Error: \(error!.localizedDescription)")
            self = .failure(.undefined(error!))
            return
        }
        
        guard let data = data, let jsonObject = try? JSONSerialization.jsonObject(with: data) else {
            print(response?.description ?? "")
            print("Error: \(NetworkError.noData.localizedDescription)")
            self = .failure(NetworkError.noData)
            return
        }
        
        print(response?.description ?? "")
        print("Response JSON")
        print(jsonObject)
        
        do {
            let responseObject = try JSONDecoder().decode(Success.self, from: data)
            self = .success(responseObject)
        } catch {
            self = .failure(.undefined(error))
        }
    }
}
