//
//  ProductsTableViewController.swift
//  MercadoChallenge
//
//  Created by Andrés A.
//  Copyright © 2020 Andrés A.. All rights reserved.
//

import UIKit


class ProductsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var presenter = ListProductsPresenter()
    var products = [Product]()
    var valueToPass = Product()
    var searchTerm: String?
    private let heightRow = 44
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewController = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.showIndicator()
        presenter.getProducts(searchTerm: searchTerm ?? "")
        tableView.reloadData()
        view.accessibilityIdentifier = "productListView"

    }
    
    func hideIndicator(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
        }
    }
    
    func productsLoaded(products:[Product]){
        self.products = products
        self.hideIndicator()
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
    func showIndicator(){
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.activityIndicator)
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellProduct", for: indexPath)
        
        cell.textLabel?.text = self.products[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightRow)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        valueToPass = self.products[indexPath.row]
        self.performSegue(withIdentifier: "showProductDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetail" {
            let controller = segue.destination as! ProductDetailViewController
            controller.productData = valueToPass
        }
    }
    
    
}
