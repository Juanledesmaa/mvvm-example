//
//  EmployeeTableViewCell.swift
//  employees
//
//  Created by juan ledesma on 23/11/20.
//

import Foundation
import UIKit

final class EmployeeTableViewCell: UITableViewCell {
    let profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        let placeHolderImage = UIImage(systemName: "person.circle.fill")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
        profileImageView.maskCircle(with: placeHolderImage)
        profileImageView.tintColor = .systemGray
        return profileImageView
    }()
    
    let employeeNameLabel: UILabel = {
        let employeeNameLabel = UILabel()
        employeeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return employeeNameLabel
    }()
    
    let employeeAgeLabel: UILabel = {
        let employeeAgeLabel = UILabel()
        employeeAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        return employeeAgeLabel
    }()
    
    let employeeSalaryLabel: UILabel = {
        let employeeSalaryLabel = UILabel()
        employeeSalaryLabel.translatesAutoresizingMaskIntoConstraints = false
        return employeeSalaryLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    
    private func setup() {
        selectionStyle = .none
        contentView.addSubview(profileImageView)
        contentView.addSubview(employeeNameLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        setupProfileImageViewConstraints()
        setupEmployeeNameLabelConstraints()
    }
    
    private func setupProfileImageViewConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            profileImageView.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor, constant: 8),
            profileImageView.rightAnchor.constraint(equalTo: employeeNameLabel.leftAnchor, constant: -16),
        ])

        let topConstraint = profileImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 4)
        topConstraint.priority = .defaultLow
        topConstraint.isActive = true
        
        let bottomConstraint = profileImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 4)
        bottomConstraint.priority = .defaultLow
        bottomConstraint.isActive = true
        
    }
    
    private func setupEmployeeNameLabelConstraints() {
        NSLayoutConstraint.activate([
            employeeNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            employeeNameLabel.heightAnchor.constraint(equalToConstant: 21),
            employeeNameLabel.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor, constant: 16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
