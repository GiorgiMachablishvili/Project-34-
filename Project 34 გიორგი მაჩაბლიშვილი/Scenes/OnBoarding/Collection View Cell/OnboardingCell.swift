//
//  OnboardingCell.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 22.06.24.
//

import UIKit
import SnapKit

class OnboardingCell: UICollectionViewCell {
    //MARK: -UI components
    private lazy var mainImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    private lazy var taskTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.font = UIFont.latoBold(size: 32)
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var taskDescription: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.font = UIFont.latoRegular(size: 16)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor(hexString: "121212")
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setup ui components
    func setup() {
        addSubview(mainImage)
        addSubview(taskTitle)
        addSubview(taskDescription)
    }
    
    //MARK: setup constraints
    func setupConstraints() {
        mainImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(84 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(81 * Constraint.xCoeff)
            make.height.equalTo(275 * Constraint.yCoeff)
        }

        taskTitle.snp.remakeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(105 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
            make.height.equalTo(38 * Constraint.yCoeff)
        }
        
        taskDescription.snp.remakeConstraints { make in
            make.top.equalTo(taskTitle.snp.bottom).offset(42 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(38 * Constraint.xCoeff)
        }
    }
    
    //MARK: data configure
    func configure(with data: OnBoardingData) {
        mainImage.image = data.image
        taskTitle.text = data.title
        taskDescription.text = data.description
    }
}
