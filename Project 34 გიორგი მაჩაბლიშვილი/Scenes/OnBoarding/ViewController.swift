//
//  ViewController.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 22.06.24.

import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: -UI components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.dataSource = self
        view.delegate = self
        view.register(OnboardingCell.self, forCellWithReuseIdentifier: "OnboardingCell")
        return view
    }()
    
    private lazy var skipButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .clear
        view.setTitle("SKIP", for: .normal)
        view.titleLabel?.font = UIFont.latoRegular(size: 16)
        view.titleLabel?.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.addTarget(self, action: #selector(didTapOnSkipButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var pageController: UIPageControl = {
        let view = UIPageControl(frame: .zero)
        view.currentPage = 0
        view.numberOfPages = onBoarding.count
        view.currentPageIndicatorTintColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.pageIndicatorTintColor = UIColor(hexString: "AFAFAF")
        return view
    }()
    
    private lazy var primaryButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = UIColor(hexString: "8875FF")
        view.setTitle("Next", for: .normal)
        view.titleLabel?.font = UIFont.latoRegular(size: 16)
        view.titleLabel?.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(didTapOnPrimaryButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .clear
        view.setTitle("BACK", for: .normal)
        view.titleLabel?.font = UIFont.latoRegular(size: 16)
        view.titleLabel?.textColor = UIColor(hexString: "FFFFFF").withAlphaComponent(0.87)
        view.addTarget(self, action: #selector(didTapOnBackButton), for: .touchUpInside)
        return view
    }()
    
    let onBoarding = [
        OnBoardingData
            .init(image: .firstPageOnbording, title: "Manage your tasks", description: "You can easily manage all of your daily tasks in DoMe for free"),
        .init(image: .secondPageOnbording, title: "Create daily routine", description: "In Uptodo  you can create your personalized routine to stay productive"),
        .init(image: .thirdPageOnbording, title: "Orgonaize your tasks", description: "You can organize your daily tasks by adding your tasks into separate categories")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
        setupConstraints()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: setup ui components
    func setup() {
        view.addSubview(collectionView)
        view.addSubview(pageController)
        view.addSubview(primaryButton)
        view.addSubview(skipButton)
        view.addSubview(backButton)
    }
    
    //MARK: setup constraints
    func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        skipButton.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(54 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(24 * Constraint.xCoeff)
            make.width.equalTo(35 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }
        
        pageController.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(413 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
        }
        
        primaryButton.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-62 * Constraint.yCoeff)
            make.trailing.equalTo(view.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.width.equalTo(60 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(24 * Constraint.xCoeff)
            make.bottom.equalTo(view.snp.bottom).offset(-74 * Constraint.yCoeff)
            make.width.equalTo(43 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }
    }
    
    //MARK: tab primary button
    @objc func didTapOnPrimaryButton() {
        let nextIndex = pageController.currentPage + 1
        if nextIndex < onBoarding.count {
            let indexPath = IndexPath(item: nextIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageController.currentPage = nextIndex
        } else {
            let vc = HomeScreenView()
            navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    //MARK: skip onboarding page and go home page
    @objc func didTapOnSkipButton() {
        let userDefault = UserDefaults.standard
        userDefault.set(true, forKey: "hasSeenOnboarding")
        navigateToHomeScreen()
    }
    func navigateToHomeScreen() {
        let vc = HomeScreenView()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    //MARK: tab back button
    @objc func didTapOnBackButton() {
        let previousIndex = pageController.currentPage - 1
        if previousIndex >= 0 {
            let indexPath = IndexPath(item: previousIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageController.currentPage = previousIndex
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoarding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: onBoarding[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageController.currentPage = Int(pageIndex)
        let nextIndex = pageController.currentPage
        if nextIndex == onBoarding.count - 1 {
            primaryButton.setTitle("Get Started", for: .normal)
            primaryButton.snp.updateConstraints { make in
                make.width.equalTo(120 * Constraint.xCoeff)
            }
        } else {
            primaryButton.setTitle("Next", for: .normal)
            primaryButton.snp.updateConstraints { make in
                make.width.equalTo(60 * Constraint.xCoeff)
            }
        }
    }
}
