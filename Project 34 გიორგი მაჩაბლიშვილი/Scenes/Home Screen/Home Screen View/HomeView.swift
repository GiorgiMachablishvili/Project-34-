//
//  HomeView.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 25.06.24.

import UIKit
import SnapKit

class HomeView: UIView, EditPageControllerDelegate {
    func didAddTask(_ task: Task) {
    }
    
    weak var delegate: EditPageControllerDelegate?
    
    //MARK: -UI components
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.font = UIFont.latoRegular(size: 20)
        view.text = "To-Do"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var mainImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "toDo")
        return view
    }()
    
    private lazy var questionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.font = UIFont.latoRegular(size: 20)
        view.text = "What do you want to do today?"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.font = UIFont.latoRegular(size: 16)
        view.text = "Tap + to add your tasks"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setup ui components
    func setup() {
        addSubview(titleLabel)
        addSubview(mainImage)
        addSubview(questionLabel)
        addSubview(infoLabel)
    }
    
    //MARK: setup constraints
    func setupConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(snp.top).offset(57 * Constraint.yCoeff)
            make.height.equalTo(42 * Constraint.yCoeff)
        }
        
        mainImage.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(75 * Constraint.yCoeff)
            make.centerX.equalTo(snp.centerX)
            make.height.width.equalTo(227 * Constraint.yCoeff)
        }
        
        questionLabel.snp.remakeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(10 * Constraint.yCoeff)
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(30 * Constraint.yCoeff)
        }
        
        infoLabel.snp.remakeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(10 * Constraint.yCoeff)
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(24 * Constraint.yCoeff)
        }
    }
}
