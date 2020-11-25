//
//  EmployeesResponse.swift
//  employees
//
//  Created by juan ledesma on 20/11/20.
//

import Foundation

struct EmployeesResponse: Codable {
    let status: String
    let data: [Employee]
}
