//
//  predictor.swift
//  SoybeanDiseasePredictor
//
//  Created by Admin on 8/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import CoreML
import Vision

protocol ClassificationDelegateProtocol: AnyObject
{
    func updateClassifications(for image: UIImage)
}

class ImageClassificationDelegate: ClassificationDelegateProtocol
{
    init(parent: ViewController) {
        self.parent = parent
    }

    func updateClassifications(for image: UIImage) {
        parent.classificationLabel.text = "YOLO..."
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else {
            fatalError("Unable to create \(CIImage.self) from \(image)")
        }
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification.\n \(error.localizedDescription) ")
            }
        }
    }

    func processClassifications(for Request: VNRequest, error: Error?) {
        DispatchQueue.main.async { [unowned self] in
            guard let results = Request.results else {
                self.parent.classificationLabel.text = "Unable to classify image. \n \(error!.localizedDescription)"
                return
            }
            let classifications = results as! [VNClassificationObservation]
            if classifications.isEmpty {
                self.parent.classificationLabel.text = "Nothing recognized"
            } else {
                let topClassifications = classifications.prefix(2)
                let descriptions = topClassifications.map { classification in
                    return String(format: " (%.2f) %@", classification.confidence, classification.identifier)
                }
                self.parent.classificationLabel.text = "" + descriptions.joined(separator: "\n")
            }
        }
    }
    unowned var parent: ViewController
    lazy var classificationRequest: VNCoreMLRequest = { [unowned self] in
        do {
            let model = try VNCoreMLModel(for: leaf().model)
            let request = VNCoreMLRequest(model: model, completionHandler: { request, error in
                self.processClassifications(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
}

