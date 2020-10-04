//
//  RoomPickerViewController.swift
//  LuckyTrip
//
//  Created Ali Omari on 4/13/19.
//  Copyright © 2019 Ali Omari. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class RoomPickerViewController: BaseViewController, RoomPickerViewProtocol {

	var presenter: RoomPickerPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func setupViews() {
        tableView.register(UINib(resource: R.nib.roomCell),
                           forCellReuseIdentifier: R.reuseIdentifier.roomCell.identifier)
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        presenter?.dismissButtonDidPressed()
    }
    
    func populateRooms() {
        tableView.reloadData()
    }
}
extension RoomPickerViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.rooms?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.roomCell.identifier,
            for: indexPath) as! RoomCell
        let room = presenter!.rooms![indexPath.row]
        cell.populate(room: room)
        
        return cell
    }
}
extension RoomPickerViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 334.0
    }
}