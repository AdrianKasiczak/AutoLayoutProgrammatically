//
//  PageCell.swift
//  AutoLayoutProgrammatically
//
//  Created by Adrian Kasiczak on 05/06/2018.
//  Copyright © 2018 Adrian Kasiczak. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let unwrappedPage = page else { return }
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerString, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: unwrappedPage.bodyText, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            laptopImageView.image = UIImage(named: unwrappedPage.imageName)
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupLayout()
    }
    
    private let laptopImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "1laptop"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Are you ready to check out this beast?", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\n Our new laptop is the most powerfull computer ever. That is why we call him Beastest Beast!", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    
    private func setupLayout(){
        let topImageViewContainer = UIView()
        topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topImageViewContainer)
        topImageViewContainer.addSubview(laptopImageView)
        addSubview(descriptionTextView)
        
        topImageViewContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageViewContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        laptopImageView.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor).isActive = true
        laptopImageView.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor).isActive = true
        laptopImageView.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: topImageViewContainer.bottomAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
