//
//  SwipingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Adrian Kasiczak on 05/06/2018.
//  Copyright © 2018 Adrian Kasiczak. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "1laptop", headerString:"Are you ready to check out this beast?", bodyText: "\n\n\n Our new laptop is the most powerfull computer ever. That is why we call him Beastest Beast!"),
        Page(imageName: "1cloud", headerString:"Cloud synchronization around the world", bodyText: "\n\n\n The newest cloud synchronization system will give you access to your files on all devices"),
        Page(imageName: "1cpu", headerString:"The most powerfull CPU with acceleration", bodyText: "\n\n\n 7th generation of CPU with hyper-acceleration guarantee you the highest performance and the most satisfying pleasure")
    ]
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevPage), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrevPage() {
        print("hello")
        
        let prevIndex = min(pageController.currentPage - 1, pages.count + 1)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageController.currentPage = prevIndex
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handleNextPage), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNextPage() {
        print("hello")
        
        let nextIndex = min(pageController.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageController.currentPage = nextIndex
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    fileprivate func bottomControlsSetup() {
        
        let bottomStackViewControl = UIStackView(arrangedSubviews: [prevButton, pageController, nextButton])
        bottomStackViewControl.translatesAutoresizingMaskIntoConstraints = false
        
        bottomStackViewControl.distribution = .fillEqually
        
        view.addSubview(bottomStackViewControl)
        
        // instead of writing .isActive = true
        NSLayoutConstraint.activate([
            bottomStackViewControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackViewControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackViewControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackViewControl.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        
        bottomControlsSetup()
        
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

