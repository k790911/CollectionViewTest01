//
//  ViewController.swift
//  CollectionViewTest01
//
//  Created by 김재훈 on 2022/03/18.
//

import UIKit

struct MyData {
    var name: String
    var image: UIImage?
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let myImages = [
        MyData(name: "2.JPG", image: UIImage(named: "2.JPG")),
        MyData(name: "3.JPG", image: UIImage(named: "3.JPG")),
        MyData(name: "4.JPG", image: UIImage(named: "4.JPG"))
    ]
    
    var myCollectionView: UICollectionView = {
        let cv = UICollectionView()
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        view.addSubview(myCollectionView)
        
        myCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .red
        
        return cell
    }
    
}

