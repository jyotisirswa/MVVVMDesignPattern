//
//  EmployeeViewController.swift
//  MVVMDesignPattern
//
//  Created by Jyoti on 26/08/2022.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    var employeeViewModel : EmployeesViewModel!
    @IBOutlet weak var employeeTableView: UITableView!
    
    var employeeTableDataSource : EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callViewModelForUIUppdate()
    }
    
    func callViewModelForUIUppdate() {
        self.employeeViewModel = EmployeesViewModel()
        self.employeeViewModel.bindEmployeesViewModelToEmployeeController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        self.employeeTableDataSource = EmployeeTableViewDataSource(cellIdentifier : "employeeTableViewCell", items : self.employeeViewModel.empData.data, configureCell : { (cell, emp) in
            cell.labelEmployeeName.text = emp.employeeName
            cell.labelEmployeeId.text = "\(emp.id)"
        })
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.employeeTableDataSource
            self.employeeTableView.reloadData()
        }
    }
}
