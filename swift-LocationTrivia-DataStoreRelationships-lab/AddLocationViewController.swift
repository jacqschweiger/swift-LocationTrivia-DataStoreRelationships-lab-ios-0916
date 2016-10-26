//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Jacqueline Minneman on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var latitudeField: UITextField!
    
    @IBOutlet weak var longitudeField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: {})
        
    }

    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        var latFloat: Float = 0
        var longFloat: Float = 0
        
        if let latitudeInput = latitudeField.text {
            latFloat = Float(Int(latitudeInput)!)
        }
        
        if let longitudeInput = longitudeField.text {
            longFloat = Float(Int(longitudeInput)!)
        }
        
        let newLocation = Location(name: nameField.text!, latitude: latFloat, longitude: longFloat)
        
        //access all the locations with details, then add in newly created location to the array of locations. once you go back to the LocationVC it reloads and the array now is longer and displays new info.
        LocationsDataStore.sharedInstance.locations.append(newLocation)

        self.dismiss(animated: true, completion: {})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //    nameField.accessibilityLabel = "nameField"
        //    nameField.accessibilityIdentifier = "nameField"
        //
        //    latitudeField.accessibilityLabel = "latitudeField"
        //    latitudeField.accessibilityIdentifier = "latitudeField"
        //
        //    longitudeField.accessibilityLabel = "longitudeField"
        //    longitudeField.accessibilityIdentifier = "longitudeField"
        //
        //    cancelButtonPressed.accessibilityLabel = "cancelButton"
        //    cancelButtonPressed.accessibilityIdentifier = "cancelButton"
        //
        //    saveButtonPressed.accessibilityLabel = "saveButton"
        //    saveButtonPressed.accessibilityIdentifier = "saveButton"    }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
