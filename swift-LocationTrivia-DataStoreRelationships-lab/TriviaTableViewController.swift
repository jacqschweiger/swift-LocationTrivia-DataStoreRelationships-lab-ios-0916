//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Jacqueline Minneman on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TriviaTableViewController: UITableViewController {
    
    //variable to hold location to be used to access trivia. specific location set by segue in LocationVC.
    var locationTTVC = Location()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.accessibilityLabel = "Trivia Table"
        tableView.accessibilityIdentifier = "Trivia Table"
        
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "Add Trivia Button"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "Add Trivia Button"
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    
    //for this specific/selected location (from LocVC segue), amount of trivia = number of rows.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationTTVC.trivia.count
    }

    //update labels on trivia page with trivia info from location sent by segue.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        
        cell.textLabel?.text = locationTTVC.trivia[indexPath.row].content
        cell.detailTextLabel?.text = String(locationTTVC.trivia[indexPath.row].likes)
        
        
        return cell
    
    }
    
    //move from Trivia page to Add Trivia by clicking on add button. Add Trivia's selected location will be current/TriviaVC's location, which was set by LocationVC segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTrivia" {
            let dest = segue.destination as! AddTriviaViewController
            dest.locationATVC = locationTTVC
        }
    }


}
