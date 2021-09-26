//
//  ViewController.swift
//  collectionViewDynamicCells
//
//  Created by apple on 26/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num = [Int](1...200)
    let inset: CGFloat = 10
    let minimumLineSpacing: CGFloat = 10
    let minimumInteritemSpacing: CGFloat = 10
    var cellsPerRow = 2
    
        @IBAction func textAction(_ sender: UITextField) {
            
            let cells = textFieldOut.text!
            
            if let rows = Int(cells) {
                cellsPerRow = rows
                collectionOut.reloadData()
                
            }else{
                print("couldnt convert")
            }


          }
    
    
    
    @IBOutlet weak var numOfRowsLabel: UILabel!
    
    @IBOutlet weak var collectionOut: UICollectionView!
    
    @IBOutlet weak var textFieldOut: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionOut.delegate = self
        collectionOut.dataSource = self
        collectionOut.contentInsetAdjustmentBehavior = .always
        textFieldOut.addTarget(self, action: #selector(textAction), for: .allEvents)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return num.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let numbers = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? CollectionViewCell {
            numbers.counting(with: String(num[indexPath.row]))
            numbers.backgroundColor = .orange
            cell = numbers
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionOut.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    
}

