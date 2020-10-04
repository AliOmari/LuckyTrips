//
//  BaseViewProtocol.swift
//  LuckyTrip
//
//  Created by Ali Omari on 4/13/19.
//  Copyright © 2019 Ali Omari. All rights reserved.
//

import Foundation

protocol BaseViewProtocol: class {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showMessage(title: String, message: String)
}

protocol BasePresenterProtocol: class {
    func viewDidLoad()
}
