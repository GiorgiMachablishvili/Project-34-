//
//  OnboardingCell.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 22.06.24.
//

import UIKit
import SnapKit

class OnboardingCell: UICollectionViewCell {
    private lazy var mainImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    private lazy var taskTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.latoBold(size: 32)
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var taskDescription: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.latoRegular(size: 16)
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
    
    func setup() {
        addSubview(mainImage)
        addSubview(taskTitle)
        addSubview(taskDescription)
    }
    
    func setupConstraints() {
        mainImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(84)
            make.leading.trailing.equalToSuperview().inset(81)
            make.height.equalTo(275)
        }

        taskTitle.snp.remakeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(105)
            make.leading.trailing.equalToSuperview().inset(53)
            make.height.equalTo(38)
        }
        
        taskDescription.snp.remakeConstraints { make in
            make.top.equalTo(taskTitle.snp.bottom).offset(42)
            make.leading.trailing.equalToSuperview().inset(38)
        }
    }
    
    func configure(with data: OnBoardingData) {
        mainImage.image = data.image
        taskTitle.text = data.title
        taskDescription.text = data.description
    }
}
