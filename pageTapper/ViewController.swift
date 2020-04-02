//
//  ViewController.swift
//  pageTapper
//
//  Created by Kashee Kushwaha on 01/04/20.
//  Copyright © 2020 Kashee Kushwaha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let syndicateTabCellId = "syndicateTabCellId"
    let tabHeaderCellId = "tabHeaderCellId"
    var topConstantValue: CGFloat = 256.0
    var oldValue: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    func updateScrollViewOffset(offSet: CGFloat) {
        if oldValue > offSet {
            let offset = CGPoint(x: 0, y: offSet)
            scrollView.setContentOffset(offset, animated: true)
        } else {
           if offSet < topConstantValue {
                oldValue = offSet
               let offset = CGPoint(x: 0, y: offSet)
                print("offSetValue: \(offSet)")
               scrollView.setContentOffset(offset, animated: true)
//            let collectionContentSize = collectionView.contentSize.height
//            collectionViewHeight.constant = collectionContentSize + 256
            
            }
        }
    }
    
    private func registerCells() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: "LEVSyndicateTabCell", bundle: .main), forCellWithReuseIdentifier: syndicateTabCellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: syndicateTabCellId, for: indexPath) as! LEVSyndicateTabCell
        cell.mainController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

}

