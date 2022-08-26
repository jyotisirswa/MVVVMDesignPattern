//
//  APIService.swift
//  MVVMDesignPattern
//
//  Created by Jyoti on 26/08/2022.
//

import Foundation

class APIService : NSObject {
    
    private let sourcesURL = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
    
    func apiToGetEmployeeData(completion : @escaping (Employee) -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let empData = try! jsonDecoder.decode(Employee.self, from: data)
                completion(empData)
            }
        }.resume()
    }
}
