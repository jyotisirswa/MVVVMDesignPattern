//
//  Employee.swift
//  MVVMDesignPattern
//
//  Created by Jyoti on 26/08/2022.
//

import Foundation

// MARK: - Welcome
struct Employee: Decodable {
    let status: String
    let data: [EmployeeData]
    let message: String
}

// MARK: - Datum
struct EmployeeData: Decodable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
