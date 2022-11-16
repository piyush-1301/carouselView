//
//  ViewController.swift
//  carouselView
//
//  Created by User on 15/11/22.
//

import UIKit
import UPCarouselFlowLayout

class ViewController: UIViewController {
    @IBOutlet weak var colectionView: UICollectionView!
    let layout = UPCarouselFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        colectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reusableCell")
        colectionView.dataSource = self
        colectionView.delegate = self
        layout.itemSize = CGSizeMake(colectionView.frame.size.width - 100, colectionView.frame.size.height / 1.5)
        layout.scrollDirection = .horizontal
        layout.spacingMode = .overlap(visibleOffset: 100)
        colectionView.collectionViewLayout = layout
        
    }
    
}
    extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate{
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusableCell", for: indexPath) as! CollectionViewCell
            cell.numberLabel.text = "\(indexPath.row + 1)"
            return cell
        }
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 30
        }
        
        //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        colectionView.didScroll()
        //    }
        
    }
