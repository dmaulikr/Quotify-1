//
//  NewImagesCollectionViewController.swift
//  Quotify
//
//  Created by Moritz Gort on 25/09/15.
//  Copyright © 2015 Gabriele Gort. All rights reserved.
//

import UIKit

private let reuseIdentifier = "newImageCell"

class NewImagesCollectionViewController: UICollectionViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let imagePicker = UIImagePickerController()
    
    var newImageCollection:[UIImage] = []
    
    override func viewWillAppear(animated: Bool) {
        collectionView?.reloadData()
        print(newImageCollection)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        collectionView?.collectionViewLayout.invalidateLayout()
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if newImageCollection.count > 0 {
            return newImageCollection.count
        } else {
            return 0
        }
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! NewImagesCollectionViewCell
        cell.newImageView.image = newImageCollection[indexPath.row]
        return cell
    }
    
    //MARK: Adding Images
    @IBAction func addPicturesPressed(sender: UIBarButtonItem) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("didfinishpicking")
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("ADD pickedImage!")
            newImageCollection.append(pickedImage)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }

    
}
