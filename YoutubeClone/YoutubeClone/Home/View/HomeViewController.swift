//
//  HomeViewController.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 03/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var presenter = HomePresenter(delegate: self)
    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
          await presenter.getHomeObjects()
        }
    }
}

extension HomeViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        print("list: ", list)
    }
    
    
}
