//
//  SearchViewController.swift
//  MercadoChallenge
//
//  Created by troquer on 7/19/20.
//  Copyright © 2020 Andrés A. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "searchView"
        dismissKey()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func searchProducts(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showProductsList", sender: self)
    }
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let productList = segue.destination as! ProductsTableViewController
        productList.searchTerm = searchBox.text
    }
    
    
}

extension SearchViewController {
    func dismissKey()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
