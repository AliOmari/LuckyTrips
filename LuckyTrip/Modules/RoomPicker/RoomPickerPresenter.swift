//
//  RoomPickerPresenter.swift
//  LuckyTrip
//
//  Created Ali Omari on 4/13/19.
//  Copyright © 2019 Ali Omari. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class RoomPickerPresenter: RoomPickerPresenterProtocol {

    weak private var view: RoomPickerViewProtocol?
    var interactor: RoomPickerInteractorProtocol?
    private let router: RoomPickerWireframeProtocol

    var rooms:[Room]?
    
    init(interface: RoomPickerViewProtocol, interactor: RoomPickerInteractorProtocol?, router: RoomPickerWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor?.getRooms()
    }
    
    func dismissButtonDidPressed() {
        router.dismissViewController()
    }
    
    func roomsLoaded(rooms: [Room]?) {
        view?.hideLoadingIndicator()
        self.rooms = rooms
        view?.populateRooms()
    }
    
    func roomsLoadingFailed(error: String) {
        view?.hideLoadingIndicator()
        view?.showMessage(title: R.string.localizable.error_title(), message: error)
    }
}
