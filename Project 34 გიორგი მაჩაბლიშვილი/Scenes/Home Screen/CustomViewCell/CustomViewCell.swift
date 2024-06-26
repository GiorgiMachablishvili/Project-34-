//
//  CustomViewCell.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 24.06.24.

import UIKit
import SnapKit

class CustomViewCell: UITableViewCell {
    //MARK: -UI components
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.latoBold(size: 16)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.textColor = UIColor(hexString: "FFFFFF")
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.latoRegular(size: 14)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.textColor = UIColor(hexString: "FFFFFF")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
        backgroundColor = UIColor(hexString: "363636")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setup ui components
    func setup() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    //MARK: setup constraints
    func setupConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(38 * Constraint.xCoeff)
            make.height.equalTo(21 * Constraint.yCoeff)
        }
        
        descriptionLabel.snp.remakeConstraints { make in
            make.top.equalTo( titleLabel.snp.bottom).offset(6 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(38 * Constraint.xCoeff)
        }
    }
    
    //MARK: updata content
    func updateContent(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
