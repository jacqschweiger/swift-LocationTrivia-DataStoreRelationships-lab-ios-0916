//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Jacqueline Minneman on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddTriviaViewController: UIViewController {

    @IBOutlet weak var triviumTextField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: {})
    }

    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        
        //created instance of new trivia, saved when save pressed
        let newTrivium = Trivium(content: triviumTextField.text!, likes: 0)
        
        //this ATVC location is the one passed in from the TriviaVC segue, so we're working with the same location. we access that location's trivia property, and append new trivia to that array. this will appear when the TriviaVC reloads and recounts/redisplays the amount of trivia for the location.
        
        locationATVC.trivia.append(newTrivium)
    
        self.dismiss(animated: true, completion: {})
    }
    
    var locationATVC = Location()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        triviumTextField.accessibilityLabel = "Trivium Text Field"
//        triviumTextField.accessibilityIdentifier = "Trivium Text Field"
//        
//        cancelButtonPressed.accessibilityLabel = "Cancel Button"
//        cancelButtonPressed.accessibilityIdentifier = "Cancel Button"
//        
//        saveButtonPressed.accessibilityLabel = "Save Button"
//        saveButtonPressed.accessibilityIdentifier = "Save Button"
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
