//
//  ParticularBook.swift
//  Internet store
//
//  Created by Damian on 29.01.2018.
//  Copyright © 2018 Damian. All rights reserved.
//

import UIKit

class ParticularProductVC: UIViewController {

    var product : Product!
    var slides:[SliderImage] = [SliderImage]()

    @IBOutlet weak var minusAmount: UIButton!
    @IBOutlet weak var amountTxtField: UITextField!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UITextView!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var brandLbl: UILabel!
    
    @IBOutlet weak var imagesScrollView: UIScrollView!
    @IBOutlet weak var imagesPageControl: UIPageControl!

    var amount : Int = 1
    
    @IBOutlet weak var dodajBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cartsmall"), style: .plain, target: self, action: #selector(cartBtnClick))
        amountTxtField.isUserInteractionEnabled = false;
        amountTxtField.text = "\(amount)"
        minusAmount.isEnabled = false
        nameLbl.text = product.name
        descriptionLbl.text = product.description
        brandLbl.text = product.brand
        amountLbl.text = product.amount
        priceLbl.text = "\(amount*product.price) PLN"

        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        imagesPageControl.numberOfPages = slides.count
        imagesPageControl.currentPage = 0
        imagesPageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
        
        view.bringSubview(toFront: imagesPageControl)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.descriptionLbl.setContentOffset(CGPoint.zero, animated: false)
    }
    
    @objc func cartBtnClick() {
        performSegue(withIdentifier: "ParticularProductVCCartVC", sender: nil)
    }
    
    func initSelected(product: Product) {
        navigationItem.title = product.name //TODO Przyciąć do 2 pierwszych słow
        self.product = product
        
    }
    @IBAction func addProduct(_ sender: Any) {
        let item = Item(title: product.name, amount: amount, price: product.price, image: product.imagesList[0])
        let index = Variables.items.firstIndex(where: {$0.title == product.name}) ?? -1
        if(index == -1) {
            Variables.items.append(item)
        } else {
            Variables.items[index].SetAmount(_amount: amount)
        }
    }
    
    @IBAction func decreaseAmount(_ sender: Any) {
        
        if(amount > 1) {
            amount -= 1
            if(amount == 1) {
                minusAmount.isEnabled = false
            }
        }
        priceLbl.text = "\(amount*product.price) PLN"
        amountTxtField.text = "\(amount)"
    }
    
    @IBAction func increaseAmount(_ sender: Any) {
        amount += 1
        minusAmount.isEnabled = true
        priceLbl.text = "\(amount*product.price) PLN"
        amountTxtField.text = "\(amount)"
        
    }
    
    func createSlides() -> [SliderImage] {
        var sliderImagesList = [SliderImage]()
        
        for image in product.imagesList {
            let slide:SliderImage = Bundle.main.loadNibNamed("SliderImage", owner: self, options: nil)?.first as! SliderImage
            slide.Image.image = UIImage(named: image)
            sliderImagesList.append(slide)
        }
        
        return sliderImagesList
    }
    
    func setupSlideScrollView(slides : [SliderImage]) {
        imagesScrollView.contentSize = CGSize(width: 319 * CGFloat(slides.count), height: 270)
        imagesScrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: 319 * CGFloat(i), y: 0, width: 319, height: 270)
            imagesScrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/319)
        imagesPageControl.currentPage = Int(pageIndex)
    }
    
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(imagesPageControl.currentPage) * imagesScrollView.frame.size.width
        imagesScrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
}
