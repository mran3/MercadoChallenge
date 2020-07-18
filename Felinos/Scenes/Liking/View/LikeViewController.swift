//
//  LikeViewController.swift
//  Felinos
//
//  Copyright © 2020 Andrés A. All rights reserved.
//

import UIKit
import Koloda
class LikeViewController: UIViewController {
    
    private var presenter = LikePresenter()
    var images:[UIImage] = []
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myKolodaView: KolodaView!
    private let jsonParser = JSONParser()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        myKolodaView.dataSource = self
        myKolodaView.delegate = self
        presenter.viewController = self
        presenter.getImagesForVotes()
    }
    
    func hideIndicator(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
        }
    }
    
    func downloadImgsFromURLs(){
        for url in presenter.cardImagesURLs {
            
            
            self.jsonParser.fetchImage(from: url, completion: { [weak self] (imageData, error) in
                guard let self = self else {
                    print("Failed self unwrapping")
                    return
                }
                
                if let data = imageData {
                    self.images.append(data)
                    if url == self.presenter.cardImagesURLs.last {
                        DispatchQueue.main.async {
                            self.myKolodaView.reloadData()
                            self.hideIndicator()
                        }
                    }
                } else {
                    print("Error loading image - Like")
                }
            })
        }
        
    }
    
    
}

//MARK Koloda Protocols

extension LikeViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        resultLabel.text = "No hay más gatitus"
        let endImageView = UIImageView(image: UIImage(named: "catPlaceholder"))
        endImageView.frame = myKolodaView.frame
        view.addSubview(endImageView)
    }
    
    func koloda(_ koloda: KolodaView, draggedCardWithPercentage finishPercentage: CGFloat, in direction: SwipeResultDirection) {
        guard finishPercentage > 20 else {
            return
        }
        if (direction == .right || direction == .bottomRight || direction == .topRight){
            resultLabel.text = "¡TE GUSTO! 😻"
            resultLabel.textColor = UIColor.green
        } else {
            resultLabel.text = "¡NO TE GUSTO! 😿"
            resultLabel.textColor = UIColor.red
        }
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if (direction == .right || direction == .bottomRight || direction == .topRight){
            UserDefaults.addLiked(id: self.presenter.imagesCats[index].id)
            
        } else {
            UserDefaults.addDisLiked(id: self.presenter.imagesCats[index].id)
        }
        resetLabel()
        
    }
    
    func resetLabel() {
        resultLabel.text = "¿Te gusto? 😼"
        resultLabel.textColor = Color.condorYellow
    }
    
}

extension LikeViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return images.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let image = images[index]
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        return imageView
    }
    
    
}
