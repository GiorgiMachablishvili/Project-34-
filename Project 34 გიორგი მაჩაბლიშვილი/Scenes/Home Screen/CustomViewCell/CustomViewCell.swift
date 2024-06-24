//
//  CustomViewCell.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 24.06.24.
//

import UIKit
import SnapKit

class CustomViewCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.latoBold(size: 16)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.textColor = .red
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.latoRegular(size: 14)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.textColor = .red
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
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
    
    func updateContent(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
