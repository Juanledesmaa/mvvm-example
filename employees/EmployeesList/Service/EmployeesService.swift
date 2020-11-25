//
//  EmployeesService.swift
//  employees
//
//  Created by juan ledesma on 14/11/20.
//

import Foundation

final class EmployeesService {
    
    private let sourceURL = URL(string: "https://private-1464ac-employees41.apiary-mock.com/employees")
    
    func getEmployeeDataFromApi(completion: @escaping (EmployeesResponse?) -> ()) {
        guard let url = sourceURL else {
            completion(nil)
            return
        }
        
        
        URLSession.shared.dataTask(with: url) {(data, urlResponse, error) in
            guard let data = data else {
                completion(nil)
                return
            }

            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let employeesData = try? jsonDecoder.decode(EmployeesResponse.self, from: data)
            
            completion(employeesData)

        }.resume()
    }
}
