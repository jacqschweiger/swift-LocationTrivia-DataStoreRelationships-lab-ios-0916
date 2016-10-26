//
//  LocationsTableViewController.swift
//  
//
//  Created by Jacqueline Minneman on 10/24/16.
//
//

import UIKit

class LocationsTableViewController: UITableViewController {
    //fills the table with all the locations
    
    //all the locations, can call on locations to access their details
    var store = LocationsDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityLabel = "Locations Table"
        tableView.accessibilityIdentifier = "Locations Table"
        
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
        
    }
    
    //updates table with new locatation when reloaded
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //locations array in LocationDataStore is updated with new location, increasing count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocationsDataStore.sharedInstance.locations.count
    }

    //labels contain details from locations array in LocationDataStore per selected row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        
        cell.textLabel?.text = LocationsDataStore.sharedInstance.locations[indexPath.row].name
        cell.detailTextLabel?.text = String(LocationsDataStore.sharedInstance.locations[indexPath.row].trivia.count)
       
        return cell
    } 


    //moves from LocationVC to TriviaVC. why use location and not the trivia specifically? LocationsDataStore.sharedInstance.locations[indexPath.row] = one specific location depending on what you tapped. TriviaVC will be filled with info from that one location.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let dest = segue.destination as? TriviaTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow{
                    dest.locationTTVC = LocationsDataStore.sharedInstance.locations[indexPath.row]
                }
            }
            
    //moves from LocationVC to Add Location.
        } else if segue.identifier == "showAdd" {
            _ = segue.destination as? AddLocationViewController
            }
        }
    
    }

