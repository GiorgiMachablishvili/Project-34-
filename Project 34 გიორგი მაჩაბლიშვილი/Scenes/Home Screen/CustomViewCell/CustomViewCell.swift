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
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.font = UIFont.latoBold(size: 16)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.font = UIFont.latoRegular(size: 14)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        return view
    }()
    
    private lazy var primaryButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "addInfo"), for: .normal)
        view.backgroundColor = .clear
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
        addSubview(primaryButton)
    }
    
    //MARK: setup constraints
    func setupConstraints() {
        primaryButton.snp.remakeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-24)
            make.width.height.equalTo(24)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(primaryButton.snp.top).offset(-5)
            make.leading.equalTo(snp.leading).offset(38 * Constraint.xCoeff)
            make.height.equalTo(21 * Constraint.yCoeff)
        }
        
        descriptionLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(primaryButton.snp.bottom).offset(5)
            make.leading.equalTo(snp.leading).offset(38 * Constraint.xCoeff)
            make.height.equalTo(21 * Constraint.yCoeff)
        }
    }
    
    //MARK: updata content
    func updateContent(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
