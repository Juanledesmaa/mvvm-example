//
//  EmployeesViewController.swift
//  employees
//
//  Created by juan ledesma on 14/11/20.
//

import UIKit

class EmployeesViewController: UIViewController {
    
    private var employeesViewModel: EmployeesViewModel
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: "EmployeeTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        return tableView
    }()
    
    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell, Employee>? = nil
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        fatalError("init() has not been implemented")
    }
    
    required init(viewModel: EmployeesViewModel) {
        self.employeesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        setupTableView()
        employeesViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)
        setupTableViewConstraints()
    }

    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    private func updateDataSource() {
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeesViewModel.employeesData?.data ?? [], configureCell: { (cell, item) in
            cell.employeeNameLabel.text = item.employeeName
        })

        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
}

