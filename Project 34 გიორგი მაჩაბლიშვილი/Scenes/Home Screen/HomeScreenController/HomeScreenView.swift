//
//  HomeScreenView.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 23.06.24.
//

import UIKit
import SnapKit

class HomeScreenView: UIViewController, EditPageControllerDelegate {
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "121212")
        view.register(CustomViewCell.self, forCellReuseIdentifier: "CustomViewCell")
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
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
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.latoRegular(size: 20)
        view.text = "What do you want to do today?"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.latoRegular(size: 16)
        view.text = "Tap + to add your tasks"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var plushButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .clear
        view.setImage(UIImage(named: "addButton"), for: .normal)
        view.addTarget(self, action: #selector(didTapOnPlusButton), for: .touchUpInside)
        return view
    }()
    
    func didAddTask(title: String, description: String) {
        tasks.append((title: title, description: description))
        tableView.reloadData()
    }
    
    var tasks: [(title: String, description: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
    }

    func setup() {
        view.addSubview(tableView)
        view.addSubview(titleLabel)
        view.addSubview(mainImage)
        view.addSubview(questionLabel)
        view.addSubview(infoLabel)
        view.addSubview(plushButton)
    }
    
    func setupConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(57 * Constraint.yCoeff)
            make.height.equalTo(42 * Constraint.yCoeff)
        }
        
        mainImage.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(75 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.height.width.equalTo(227 * Constraint.yCoeff)
        }
        
        questionLabel.snp.remakeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(10 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(30 * Constraint.yCoeff)
        }
        
        infoLabel.snp.remakeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(10 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(24 * Constraint.yCoeff)
        }
        
        plushButton.snp.remakeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-20 * Constraint.xCoeff)
            make.bottom.equalTo(view.snp.bottom).offset(-60 * Constraint.yCoeff)
            make.width.height.equalTo(64 * Constraint.xCoeff)
        }
    }
    
    @objc func didTapOnPlusButton() {
        let editVC = EditPageController()
        editVC.delegate = self
        navigationController?.present(editVC, animated: true)
    }
}

extension HomeScreenView:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomViewCell", for: indexPath) as? CustomViewCell else {
            return UITableViewCell()
        }
        let task = tasks[indexPath.row]
        cell.updateContent(title: task.title, description: task.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        <#code#>
    //    }
}
