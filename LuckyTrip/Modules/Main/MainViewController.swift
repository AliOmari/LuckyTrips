//
//  MainViewController.swift
//  LuckyTrip
//
//  Created Ali Omari on 4/13/19.
//  Copyright © 2019 Ali Omari. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {

	var presenter: MainPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func browseAction(_ sender: Any) {
        presenter?.browseButtonDidPressed()
    }
}
