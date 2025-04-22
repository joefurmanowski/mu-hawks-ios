//
//  MUPhotosCollectionViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/27/22.
//

import UIKit

private let reuseIdentifier = "photoCell"

class MUPhotosCollectionViewController: UICollectionViewController {
    
    let photosModel = MUPhotosModel.sharedInstance
    
    var selectedPhoto: String = ""
    var selectedItem: Int?
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosModel.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MUPhotoCollectionViewCell
        
        // Configure the cell
        let imgFile = photosModel.photos[indexPath.item]
        if let fileURL = photosModel.getImageFilePath(imgFile) {
            cell.photo.image = UIImage(contentsOfFile: fileURL)
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhoto = photosModel.photos[indexPath.row]
        selectedItem = indexPath.item
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "photoDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination_VC = segue.destination as! MUPhotoDetailViewController
        destination_VC.photo = selectedPhoto
        destination_VC.index = selectedItem
    }
    
}

// MARK: UICollectionViewDelegate
extension MUPhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // Programmatically Change Size of Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 150.0)
    }
    
    // Distance Between Item Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // Cell Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}
