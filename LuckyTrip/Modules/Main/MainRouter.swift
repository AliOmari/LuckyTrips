//
//  MainRouter.swift
//  LuckyTrip
//
//  Created Ali Omari on 4/13/19.
//  Copyright © 2019 Ali Omari. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MainRouter: MainWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = R.storyboard.main.mainViewController()!
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func goToRoomPickerViewController() {
        let vc = RoomPickerRouter.createModule()
        viewController?.present(vc, animated: true, completion: nil)
    }
}