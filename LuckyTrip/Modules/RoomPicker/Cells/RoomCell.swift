//
//  RoomCell.swift
//  LuckyTrip
//
//  Created by Ali Omari on 4/13/19.
//  Copyright © 2019 Ali Omari. All rights reserved.
//

import UIKit
import AlamofireImage

class RoomCell: UITableViewCell {
    
    var room:Room!
    
    @IBOutlet weak var imgRoom: UIImageView!
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var lblRoomDescription: UILabel!
    @IBOutlet weak var lblRoomPrice: UILabel!
    @IBOutlet weak var lblRoomConfigurations: UILabel!
    @IBOutlet weak var lblMaxOccuancy: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    deinit {
        imgRoom.af.cancelImageRequest()
    }
    
    func populate(room:Room){
        self.room = room
        
        if let imageUrl = room.getImage(){
            imgRoom.af.setImage(withURL: imageUrl,placeholderImage:R.image.main_image()!)
        }else{
            imgRoom.image = R.image.main_image()
        }
        
        lblRoomName.text = room.name
        lblRoomDescription.text = room.roomDescription
        lblRoomPrice.text = room.price.getFormattedPrice()
        lblRoomConfigurations.text = room.getFormattedBedConfigurations()
        lblMaxOccuancy.text = "\(R.string.localizable.max_occupancy()) \(room.maxOccupancy ?? 0)"
    }
}
