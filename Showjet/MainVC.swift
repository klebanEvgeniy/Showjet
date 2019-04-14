//
//  Main.swift
//  Showjet
//
//  Created by Necrosoft on 11/04/2019.
//  Copyright © 2019 Necrosoft. All rights reserved.
//

import Foundation
import UIKit

class MainVC: UICollectionViewController {
    private let model = MainVCModel()
    private let cellIdentifier = "ItemCell"
    private var layout: CustomLayout!
    private let defaultSize = CGSize(width: UIScreen.main.bounds.size.width,
                             height: Constants.defaultHeight)
    private let fullSize = CGSize(width: UIScreen.main.bounds.size.width,
                          height: Constants.fullHeight)
    private var selectedIndex: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        collectionView!.contentInset = UIEdgeInsets(top: Constants.statusBarHeight,
                                                    left: 0.0,
                                                    bottom: Offsets.verticalOffsetOfAngleOfSixDegreesTriangleHalved.value,
                                                    right: 0.0)
        layout = collectionViewLayout as? UICollectionViewFlowLayout as? CustomLayout
    }
}

extension MainVC {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.models.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                      for: indexPath) as! ItemCell
        cell.bind(model.models[indexPath.row])
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentModel = model.models[indexPath.row]
        if !currentModel.isEnlarged {
            currentModel.isEnlarged = true
            enlargeOnSelection(indexPath)
        }   else {
            currentModel.isEnlarged = false
            restoreOnSelection(indexPath)
        }
    }
    
    private func enlargeOnSelection(_ indexPath: IndexPath){
        layout.isSheared = true
        selectedIndex = indexPath.row
        collectionView.isScrollEnabled = false
        collectionView.reloadItems(at: [indexPath])
        collectionView.scrollToItem(at: indexPath,
                                    at: UICollectionView.ScrollPosition.centeredVertically, animated: true)
    }
    
    private func restoreOnSelection(_ indexPath: IndexPath){
        layout.isSheared = false
        selectedIndex = nil
        collectionView.isScrollEnabled = true
        collectionView.reloadItems(at: [indexPath])
        collectionView.scrollToItem(at: indexPath,
                                    at: UICollectionView.ScrollPosition.centeredVertically, animated: true)
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let selected = selectedIndex, selected == indexPath.row {
            return fullSize
        }   else {
            return defaultSize
        }
    }
}
