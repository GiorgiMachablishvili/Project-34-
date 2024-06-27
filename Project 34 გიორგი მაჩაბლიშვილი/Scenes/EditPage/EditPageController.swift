//
//  EditPageController.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 23.06.24.

import UIKit
import SnapKit

protocol EditPageControllerDelegate: AnyObject {
    func didAddTask(_ task: Task)
}

class EditPageController: UIViewController {
    weak var delegate: EditPageControllerDelegate?
    
    var taskTitle: String?
    var taskDescription: String?
    
    //MARK: -UI components
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.latoBold(size: 20)
        view.text = "Add Task"
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var titleTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.layer.borderColor = UIColor(hexString: "979797").cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 5.0
        view.textAlignment = .left
        view.keyboardType = .alphabet
        let placeholderColor = UIColor(hexString: "FFFFFF")
        view.attributedPlaceholder = NSAttributedString(string: "Title", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftView = padding
        view.leftViewMode = .always
        view.text = taskTitle
        return view
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.layer.borderColor = UIColor(hexString: "979797").cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 5.0
        view.textAlignment = .left
        view.keyboardType = .alphabet
        let placeholderColor = UIColor(hexString: "FFFFFF")
        view.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftView = padding
        view.leftViewMode = .always
        view.text = taskDescription
        return view
    }()
    
    private lazy var addInfoButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .clear
        view.setImage(UIImage(named: "addInfoButton"), for: .normal)
        view.addTarget(self, action: #selector(didTapOnAddInfoButton), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        view.backgroundColor = UIColor(hexString: "363636")
    }
    
    //MARK: setup ui components
    func setup() {
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(addInfoButton)
    }
    
    //MARK: setup constraints
    func setupConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(25 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(25 * Constraint.xCoeff)
            make.height.equalTo(30 * Constraint.yCoeff)
        }
        
        titleTextField.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(view.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        descriptionTextField.snp.remakeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(11 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(view.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        addInfoButton.snp.remakeConstraints { make in
            make.top.equalTo(descriptionTextField.snp.bottom).offset(19 * Constraint.yCoeff)
            make.trailing.equalTo(view.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.width.height.equalTo(24 * Constraint.xCoeff)
        }
    }
    
    //MARK: tap on add button
    @objc func didTapOnAddInfoButton() {
        guard let title = titleTextField.text, !title.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty else {
            return
        }
        dismiss(animated: false) {
            self.delegate?.didAddTask(Task(title: title, description: description))
        }
    }
    
    func configureWithTask(title: String, description: String) {
        taskTitle = title
        taskDescription = description
        titleTextField.text = title
        descriptionTextField.text = description
    }
}





