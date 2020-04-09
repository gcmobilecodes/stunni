//
//  HomeTVCellFactory.swift
//  Stunii
//
//  Created by Zap.Danish on 16/07/19.
//  Copyright © 2019 Gorilla App Development. All rights reserved.
//

import UIKit

class HomeTVCellFactory: NSObject {
    
    private let cellIdentifier = "cell_home"
    private var tblView: UITableView!
    
    init(tableView: UITableView) {
        tblView = tableView
    }
    
    func cellFor(indexPath: IndexPath, with data: HomeData? = nil, vc: UIViewController) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.label.text = data?.name ?? ""
        cell.collectionView.tag = indexPath.row
        cell.collectionView.dataSource  = vc as? UICollectionViewDataSource
        cell.collectionView.delegate    = vc as? UICollectionViewDelegate
        
        if data?.isFeatured ?? false {
            let nib = UINib(nibName: CVCell.Name.home, bundle: nil)
            cell.collectionView.register(nib, forCellWithReuseIdentifier: CVCell.Identifier.home)
            cell.label.isHidden = true
          
        }
        
        else {
            let nib = UINib(nibName: CVCell.Name.deals, bundle: nil)
            let seeMoreNib = UINib(nibName: CVCell.Name.seeMore, bundle: nil)
            cell.collectionView.register(nib, forCellWithReuseIdentifier: CVCell.Identifier.deal)
            cell.collectionView.register(seeMoreNib, forCellWithReuseIdentifier: CVCell.Identifier.seemore)
            cell.label.isHidden = false
        }
        
         cell.collectionView.reloadData()
         cell.layoutIfNeeded()
        return cell
    }
    
}
