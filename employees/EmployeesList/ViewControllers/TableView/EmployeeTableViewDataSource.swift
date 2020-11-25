//
//  EmployeeTableViewDataSource.swift
//  employees
//
//  Created by juan ledesma on 24/11/20.
//

import Foundation
import UIKit

final class EmployeeTableViewDataSource<EmployeeTableViewCell: UITableViewCell, T>: NSObject, UITableViewDataSource {
    private var cellIdentifier: String
    private var items: [T]
    var configureCell: (EmployeeTableViewCell, T) -> () = {_, _ in }
    
    init(cellIdentifier: String, items: [T], configureCell: @escaping (EmployeeTableViewCell, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
        
        let item = items[indexPath.row]
        configureCell(tableViewCell, item)
        return tableViewCell
    }
}
