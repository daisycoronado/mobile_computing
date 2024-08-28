//
// ViewController.swift
// <Coronado><Daisy>-HW10
// Filename: CoronadoDaisy-HW10
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 11/28/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // add outlet for collectionview
    @IBOutlet weak var collectionView: UICollectionView!
    
    // add let and var for picker and cell
    let picker = UIImagePickerController()
    let cellIdentifier = "myCell"
    var photoLibrary = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set collection view and picker to self
        collectionView.delegate = self
        collectionView.dataSource = self
        picker.delegate = self
    }
    // function for collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create cells for collection view when new image is added
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        // set to the new image
        cell.myView.image = self.photoLibrary[indexPath.item]
        return cell
    }
    // function for collection view for count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return photos that are added
        return self.photoLibrary.count
    }
    // action for when library is created
    
    @IBAction func librarySelected(_ sender: Any) {
        //open up phone library to select photos to add
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    // function for image picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // chosen image is set equal to the image chosen
        let chosenImage = info[.originalImage] as! UIImage
        let cellImage = CollectionViewCell().myView
        cellImage?.image = chosenImage
        // scale the image to fit measurements
        cellImage?.contentMode = .scaleAspectFit
        self.photoLibrary.insert(chosenImage, at: 0)
        // reload data with new image chosen
        self.collectionView.reloadData()
        dismiss(animated: true)
    }
    // picker is dismissed
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    // action for when camera is chosen
    
    @IBAction func cameraSelected(_ sender: Any) {
        if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
            // switch to back camera
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .notDetermined:
                // if we dont know
                AVCaptureDevice.requestAccess(for: .video) {
                    accessGranted in
                    guard accessGranted == true else { return }
                }
            case .authorized:
                // if we get permission
                break
            default:
                // when access is denied
                print("Access denied")
                return
            }
            picker.allowsEditing = false
            picker.sourceType = .camera
            picker.cameraCaptureMode = .photo
            present(picker, animated: true)
            
        } else {
            // no rear camera is available
            let alertVC = UIAlertController(
                title: "No camera",
                message: "Sorry, this device has no rear camera",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "OK",
                style: .default)
            alertVC.addAction(okAction)
            present(alertVC,animated:true)
        }
    }
    // override for the layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // add layout for the image
        let layout = UICollectionViewFlowLayout()
        let containerWidth = collectionView.bounds.width
        let cellSize = (containerWidth - 35) / 3
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView.collectionViewLayout = layout
    }
    // override for segue when going to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // when going to next screen
        if segue.identifier == "imageViewSegue",
            let detailVC = segue.destination as? DetailViewController,
            let indexPath = collectionView.indexPathsForSelectedItems?.first {
             detailVC.newImage = self.photoLibrary[indexPath.row]
        }
    }
}
