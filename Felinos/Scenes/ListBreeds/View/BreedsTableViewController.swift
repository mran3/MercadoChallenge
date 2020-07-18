//
//  BreedsTableViewController.swift
//  Felinos
//
//  Created by Andrés A.
//  Copyright © 2020 Andrés A.. All rights reserved.
//

import UIKit


class BreedsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var presenter = ListBreedsPresenter()
    var breeds = [Breed]()
    var valueToPass = Breed()
    private let heightRow = 44
    
    private let jsonParser = JSONParser()
    let apiConfig = APIConfig()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewController = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.showIndicator()
        presenter.getBreeds()
        tableView.reloadData()
    }
    
    func hideIndicator(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
        }
    }
    
    func breedsLoaded(){
        DispatchQueue.main.async {
            self.hideIndicator()
            self.tableView.reloadData()
        }
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
        return BreedService.breeds.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellBreed", for: indexPath)
        
        cell.textLabel?.text = BreedService.breeds[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightRow)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        valueToPass = BreedService.breeds[indexPath.row]
        self.performSegue(withIdentifier: "DetailBreed", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailBreed" {
            let controller = segue.destination as! DetailBreedViewController
            controller.dataBreed = valueToPass
        }
    }
    
    
}
