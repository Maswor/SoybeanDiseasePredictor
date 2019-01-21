# SoybeanDiseasePredictor

 SoybeanDiseasePredictor is a mobile application which can detect 10 classes of soybean diseases. It run on Iphone and Ipad on iOS 11 or above.

## Getting Started

Prediction on image             |  Selecting input
:-------------------------:|:-------------------------:
![](README_IMGS/IMG_1257.png)  |  ![](README_IMGS/IMG_1258.png)

SoybeanDiseasePredictor is a native application, running on Apple written CoreMl library and using Swfit - a first class language on Apple computing ecosystem. Therefore, the software is highly optimized and and compile without a complicated building system.

### Prerequisites

There is only one way to program for iOS device, using Apple computer running MacOS. We recommend using MacOS v10.13 targeting iOS v11

Install Xcode
```
Open AppStore -> find Xcode -> Install
```
Your machine learning model should work on top of Tensorflow toolchain

```
pip3 install tensorflow-gpu
```

For most simple model, we recommend using Keras

```
pip3 install keras
```

Install conversion tool

```
pip install -U coremltools
pip install -U tfcoreml

```

### Installing


Navigate to the root project folder

```
SoybeanDiseasePredictor -> open with Xcode
```

To compile the project

```
menu_bar -> product -> build
```

## Deployment

Connect your iDevice to your Apple computer, it should show up in the list of target

```
select the device
menu_bar -> product -> build
```

## Built With

* [Swift](https://developer.apple.com/swift/) - Swift is a multi-paradigm, compiled programming language developed by Apple
* [CoreML](https://developer.apple.com/documentation/coreml) - CoreML is a mobile optimized Machine Learning framework for iOS 
* [Keras](https://keras.io/) - Keras is a high level Neural network API
* [Tensorflow](https://www.tensorflow.org/) - Tensorflow is a machine learning framework, used as the backend for Keras
* [Coremltool](https://apple.github.io/coremltools/index.html) - Coremltools is a conversion tool for simple neural network
* [Tf-coreml](https://github.com/tf-coreml/tf-coreml) - tf-coreml is conversion tool for complex neural network

Depend on how you wrote your machine learning model, you should use CoremlTool (i.e pure Keras model) or Tf-coreml (Mix betwwen Keras and Tensorflow or pure Tensorflow) to convert it into Apple CoreML format. How to do it is out of the scope of this document, however the process is rather straight forward.

## Contributing

We follow Iowa State University [authorship policy](https://www.policy.iastate.edu/authorship), please send requests to us at the address: soumiks@iastate.edu

## Versioning

We use [git](https://git-scm.com/) for versioning. For the versions available, use the [git tagging](https://git-scm.com/book/en/v2/Git-Basics-Tagging). 

## Authors
* **Sambuddha Ghosal** - *Machine learning model* - [Google Scholars](https://scholar.google.com/citations?hl=en&user=gsQYjWcAAAAJ)
* **Truong Tran** - *Implementation and hardware acceleration for the app* - [LinkedIn](https://vn.linkedin.com/in/truong-tran-62643194)

See also the research project info at [lab website](https://web.me.iastate.edu/soumiks/) for detail information.

## License

Copyright 2018 Baskar Ganapathysubramanian and Soumik Sarkar, all rights reserved

## Acknowledgments

We gratefully acknowledge support from Plant Science Institute at Iowa State University.
