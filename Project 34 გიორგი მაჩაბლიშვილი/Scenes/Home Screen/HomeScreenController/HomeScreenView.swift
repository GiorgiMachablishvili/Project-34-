//
//  HomeScreenView.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 23.06.24.

import UIKit
import SnapKit

class HomeScreenView: UIViewController, EditPageControllerDelegate {
    
    var tasks: [Task] = []
    
    //MARK: -UI components
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "121212")
        view.register(CustomViewCell.self, forCellReuseIdentifier: "CustomViewCell")
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var homeHeaderView: HomeView = {
        let view = HomeView(frame: .zero)
        view.delegate = self
        return view
    }()
    
    private lazy var plushButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .clear
        view.setImage(UIImage(named: "addButton"), for: .normal)
        view.addTarget(self, action: #selector(didTapOnPlusButton), for: .touchUpInside)
        return view
    }()
    
    func didAddTask(_ task: Task) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tasks[selectedIndexPath.row] = task
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            tasks.append(task)
            tableView.reloadData()
        }
        updateViewVisibility()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupConstraints()
//        setupHalfHeightViewController()
    }
    
    //MARK: setup ui components
    func setup() {
        view.addSubview(tableView)
        view.addSubview(homeHeaderView)
        view.addSubview(plushButton)
    }
    
    //MARK: setup constraints
    func setupConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        homeHeaderView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        plushButton.snp.remakeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-20 * Constraint.xCoeff)
            make.bottom.equalTo(view.snp.bottom).offset(-60 * Constraint.yCoeff)
            make.width.height.equalTo(64 * Constraint.xCoeff)
        }
    }
    
    //MARK: half height view
    
    //MARK: update view visibility if task array is empty show tableView if not show homeHeaderView
    func updateViewVisibility() {
        let isEmpty = tasks.isEmpty
        homeHeaderView.isHidden = !isEmpty
        tableView.isHidden = isEmpty
    }
    
    //MARK: tap on plus button
    @objc func didTapOnPlusButton() {
        let editVC = EditPageController()
//        if let sheet = editVC.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//        }
        
        if let sheet = editVC.sheetPresentationController {
            sheet.detents = [
                .custom(resolver: { _ in
                    return 228.0 * Constraint.yCoeff
                })
            ]
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        let editVC = EditPageController()
        editVC.delegate = self
        editVC.configureWithTask(title: task.title, description: task.description)
        navigationController?.present(editVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(hexString: "121212")
        
        let headerLabel = UILabel()
        headerLabel.text = "Calendar"
        let isEmpty = tasks.isEmpty
        headerLabel.isHidden = !isEmpty
        headerLabel.isHidden = isEmpty
        headerLabel.textColor = UIColor(hexString: "FFFFFF")
        headerLabel.font = UIFont.latoBlack(size: 20)
        headerLabel.textAlignment = .center
        
        headerView.addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            updateViewVisibility()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
