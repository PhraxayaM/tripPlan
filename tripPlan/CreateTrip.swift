//
//  CreateTrip.swift
//  tripPlan
//
//  Created by MattHew Phraxayavong on 7/8/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class CreateTrip: UIViewController, UITextFieldDelegate{
    
    var textField = UITextField()
    var store: CoreDataStack!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9087456597, green: 1, blue: 0.7463781039, alpha: 1)
        textField.delegate = self
        
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 30, width: self.view.bounds.width - 120, height: 35)
        label.textColor = #colorLiteral(red: 0.5376570423, green: 0.1360948351, blue: 0.7463781039, alpha: 1)
        label.font = UIFont(name: "Frutiger", size: 25)
        label.text = "Add Trip"
        label.textAlignment = .center
        
        let button = UIButton(frame: CGRect(x: self.view.bounds.width - 40, y: 30, width: 35, height: 35))
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addTrip), for: .touchUpInside)
        button.setTitleColor(.blue, for: .normal)
        
        let button2 = UIButton(frame: CGRect(x: 0, y: 30, width: 70, height: 35))
        button2.setTitle("Cancel", for: .normal)
        button2.titleLabel?.sizeToFit()
        button2.setTitleColor(.blue, for: .normal)
        button2.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(button2)
        
        textField.frame = CGRect(x: 10, y: self.view.bounds.height / 2, width: self.view.bounds.width - 20, height: 40)
        textField.placeholder = "Name of trip "
        textField.delegate = self
        textField.returnKeyType = .done
        textField.textAlignment = .center

        self.view.addSubview(textField)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        perform(#selector(addTrip))
        textField.resignFirstResponder()
        return true
    }
    
    @objc func addTrip()
    {
        print(textField.text!)
        let viewContext = store.persistentContainer.viewContext
        let newTrip = NSEntityDescription.insertNewObject(forEntityName: "Trip", into: viewContext) as! Trip
        
        newTrip.tripname = textField.text!
        newTrip.waypoints = []
        store.saveContext()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func backPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
