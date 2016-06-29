//
//  SidePanelViewController.swift
//  SlideOutNavigationPanel
//
//  Created by Luis Arias on 28/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

protocol SidePanelViewControllerDelegate {
    func animalSelected(animal: Animal)
}

class SidePanelViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var animals = Animal.allDogs()
    
    struct TabelView {
        struct CellIdentifiers {
            static let AnimalCell = "AnimalCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
}

extension SidePanelViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath) as! AnimalCell
        cell.configureForAnimal(animals[indexPath.row])
        return cell
    }
}

extension SidePanelViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}