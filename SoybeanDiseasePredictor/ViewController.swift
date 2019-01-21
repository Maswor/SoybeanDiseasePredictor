//
//  ViewController.swift
//  SoybeanDiseasePredictor
//
//  Created by Admin on 8/15/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import ImageIO
import Vision

protocol Imagepredictor {
    var classificationLabel: UILabel! {get set}
    func updateClassification(for image: UIImage)
}

class ViewController: UIViewController, Imagepredictor {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var classificationLabel: UILabel!

    lazy var delegate = ImageClassificationDelegate(parent: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            presentPhotoPicker(sourceType: .photoLibrary)
            return
        }
    }

    func presentPhotoPicker(sourceType: UIImagePickerControllerSourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
    
    func updateClassification(for image: UIImage) {
        delegate.updateClassifications(for: image)
    }


}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        picker.dismiss(animated: true)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView?.image = image
        updateClassification(for: image)
    }
}
