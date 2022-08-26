//
//  EmployeeTableViewCell.swift
//  MVVMDesignPattern
//
//  Created by Jyoti on 26/08/2022.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelEmployeeId: UILabel!
    @IBOutlet weak var labelEmployeeName: UILabel!
    
    
    var employee : EmployeeData? {
        didSet {
            self.labelEmployeeId.text = "\(employee?.id ?? 0)"
            self.labelEmployeeName.text = employee?.employeeName
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
