//
//  ProductsVC.swift
//  Internet store
//
//  Created by Damian on 27.08.2017.
//  Copyright © 2017 Damian. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productsCollection: UICollectionView!

    private (set) public var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsCollection.dataSource = self
        productsCollection.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cartsmall"), style: .plain, target: self, action: #selector(cartBtnClick))
    }
    
    @objc func cartBtnClick() {
        performSegue(withIdentifier: "ProductsVCCartVC", sender: nil)
    }


    func  initProducts(category: Category) {
        products = dataService.instance.GetProduct(forCategoryTitle: category.Title)
        navigationItem.title = category.Title
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell{
            let product = products[indexPath.row]
            cell.updateViews(product: product)
            return cell
        }
        return ProductCell()
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        performSegue(withIdentifier: "SelectedProductVC", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let SelectedProductVC = segue.destination as? ParticularProductVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = " "
            navigationItem.backBarButtonItem = barBtn
            
            assert(sender as? Product != nil)
            SelectedProductVC.initSelected(product: sender as! Product)
        }
    }

}
