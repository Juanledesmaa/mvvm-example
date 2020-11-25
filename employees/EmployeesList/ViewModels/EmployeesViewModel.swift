//
//  EmployeesViewModel.swift
//  employees
//
//  Created by juan ledesma on 14/11/20.
//

import Foundation

class EmployeesViewModel {
    private var employeesService: EmployeesService
    
    private(set) var employeesData: EmployeesResponse? {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    init() {
        self.employeesService = EmployeesService()
        getEmployeesData()

    }
    
    func getEmployeesData() {
        employeesService.getEmployeeDataFromApi { employeesData in
            self.employeesData = employeesData
        }
        
        //TODO: MAKE Func callback for getEmployeesData
    }
}
