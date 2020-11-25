//
//  Employee.swift
//  employees
//
//  Created by juan ledesma on 14/11/20.
//

import Foundation

struct Employee: Codable {
    let id, employeeSalary, employeeAge: Int
    let employeeName, profileImage: String
}
