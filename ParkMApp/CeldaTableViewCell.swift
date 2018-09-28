//
//  CeldaTableViewCell.swift
//  ParkMApp
//
//  Created by CICE on 28/9/18.
//  Copyright © 2018 CICE. All rights reserved.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {
    
   
    
    @IBOutlet weak var imagenCelda: UIImageView!
    @IBOutlet weak var nombreText: UILabel!
    
    
    
    override func awakeFromNib() {
                
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        
        

        // Configure the view for the selected state
    }

}
