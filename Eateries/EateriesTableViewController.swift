//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by agoodis on 12.05.2018.
//  Copyright © 2018 agoodis. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {

    let restaurantNames = ["Ogonёk Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
    
    let restaurantImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    
    var restaurantIsVisited = [Bool](repeating: false, count: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell

        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
        return cell
    }
    
    func showAlert(index: Int, indexPath: IndexPath) {
        let ac = UIAlertController(title: nil, message: "Выберите действие", preferredStyle: .actionSheet)
        let call = UIAlertAction(title: "Позвонить: +7(921)999-999\(index)", style: .default) {(action: UIAlertAction) -> Void in
            let alertCont = UIAlertController(title: nil, message: "Вызов не может быть совершен", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertCont.addAction(ok)
            self.present(alertCont, animated: true, completion: nil)
            
        }
        let isVisitedTitle = self.restaurantIsVisited[indexPath.row] ? "Я не был здась" : "Я был здесь"
        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) {(action) in
            let cell = self.tableView.cellForRow(at: indexPath)
            
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        ac.addAction(call)
        ac.addAction(isVisited)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(index: indexPath.row, indexPath: indexPath)
    }

}
