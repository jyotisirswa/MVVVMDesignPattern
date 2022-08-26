//
//  EmployeesViewModel.swift
//  MVVMDesignPattern
//
//  Created by Jyoti on 26/08/2022.
//

import Foundation

class EmployeesViewModel : NSObject {
    private var apiService : APIService!
    private(set) var empData : Employee! {
        didSet {
            self.bindEmployeesViewModelToEmployeeController()
        }
    }
    
    var bindEmployeesViewModelToEmployeeController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        self.callGetEmployeesData()
    }
    
    func callGetEmployeesData() {
        self.apiService.apiToGetEmployeeData { employeeData in
            print(employeeData)
            self.empData = employeeData
        }
    }
}
