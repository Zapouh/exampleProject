//
//  HomeViewController.swift
//  Deal
//
//  Created by Pierre Doury on 30/09/2022.
//

import UIKit


protocol HomeViewControllerOutput: AnyObject {
    func requestContent()
}

final class HomeViewController: UIViewController {

    @IBOutlet var selectAddressView: SelectAddressView!
    @IBOutlet var citiesStackView: UIStackView!
    
    var output: HomeViewControllerOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: add loader view
        self.output?.requestContent()
    }
}

extension HomeViewController: HomeViewPresenterOutput {
    func display(_ model: HomeViewModel) {
        // TODO: foreach city and populate citiesStackView with NearbyCitiesView
        print("Model receive: \(model.cities)")
    }
}
