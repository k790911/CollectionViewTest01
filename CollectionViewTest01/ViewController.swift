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
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      
    let myImages = [
        MyData(name: "2.JPG", image: UIImage(named: "2.JPG")),
        MyData(name: "3.JPG", image: UIImage(named: "3.JPG")),
        MyData(name: "4.JPG", image: UIImage(named: "4.JPG")),
        MyData(name: "2.JPG", image: UIImage(named: "2.JPG")),
        MyData(name: "3.JPG", image: UIImage(named: "3.JPG")),
        MyData(name: "4.JPG", image: UIImage(named: "4.JPG")),
        MyData(name: "2.JPG", image: UIImage(named: "2.JPG")),
        MyData(name: "3.JPG", image: UIImage(named: "3.JPG")),
        MyData(name: "4.JPG", image: UIImage(named: "4.JPG")),
        MyData(name: "2.JPG", image: UIImage(named: "2.JPG")),
        MyData(name: "3.JPG", image: UIImage(named: "3.JPG")),
        MyData(name: "4.JPG", image: UIImage(named: "4.JPG"))
    ]
    
    var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.estimatedItemSize = CGSize(width: 199.0, height: 262.0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        view.backgroundColor = .yellow
        view.addSubview(myCollectionView)
        
        myCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
                
        myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true

        myCollectionView.backgroundColor = UIColor.red
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        //cell.backgroundColor = .black
        let imageView = UIImageView()
        imageView.image = UIImage(named: myImages[indexPath.row].name)
        
        // 이부분 처리 필요
        //cell.contentView = imageView
        
        cell.layer.cornerRadius = 60
        
        return cell
    }
    
}
//
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.frame.width
//        let height = collectionView.frame.height
//
//        let itemsPerRow: CGFloat = 2
//        let widthPadding = sectionInsets.left * (itemsPerRow + 1)
//
//        let itemsPerColumn: CGFloat = 3
//        let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
//
//        let cellWidth = (width - widthPadding) / itemsPerRow
//        let cellHeight = (height - heightPadding) / itemsPerColumn
//
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return sectionInsets
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.top
//    }
//}
