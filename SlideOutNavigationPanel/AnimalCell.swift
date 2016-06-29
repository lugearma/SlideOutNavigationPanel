//
//  AnimalCell.swift
//  SlideOutNavigationPanel
//
//  Created by Luis Arias on 29/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configureForAnimal(animalInRow: Animal) {
        self.petImage.image = animalInRow.image
        self.nameLabel.text = animalInRow.title
        self.descriptionLabel.text = animalInRow.creator
    }
}
