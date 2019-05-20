//
//  ViewController.swift
//  Internet store
//
//  Created by Damian on 24.08.2017.
//  Copyright © 2017 Damian. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController , UITableViewDataSource,
UITableViewDelegate{

    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cartsmall"), style: .plain, target: self, action: #selector(cartBtnClick))
        
    }
    
    @objc func cartBtnClick() {
        performSegue(withIdentifier: "CategoriesVCCartVC", sender: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.instance.getCategory().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = dataService.instance.getCategory()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = dataService.instance.getCategory()[indexPath.row]
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let ProductsVC = segue.destination as? ProductsVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = " "
            navigationItem.backBarButtonItem = barBtn
            
            assert(sender as? Category != nil)
            ProductsVC.initProducts(category: sender as! Category)
            
        }
    }
    


}

