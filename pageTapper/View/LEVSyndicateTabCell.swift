//
//  LEVSyndicateDetailCell.swift
//  AdvanceCollectionView
//
//  Created by Kashee Kushwaha on 16/03/20.
//  Copyright © 2020 Kashee Kushwaha. All rights reserved.
//

import UIKit

class LEVSyndicateTabCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let participatedCellId = "participatedCellId"
    
    var mainController: ViewController?

    @IBOutlet weak var collectionView: UICollectionView!
    
    var offSetValue: CGFloat? {
        didSet {
            guard let offSetValue = offSetValue else { return }
            mainController?.updateScrollViewOffset(offSet: offSetValue)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCell()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        registerCell()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func registerCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ParticipatedInCell", bundle: .main), forCellWithReuseIdentifier: participatedCellId)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: participatedCellId, for: indexPath) as! ParticipatedInCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.red : UIColor.orange
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        offSetValue = scrollView.contentOffset.y
        
    }

}
