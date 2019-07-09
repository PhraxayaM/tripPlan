//
//  ViewController.swift
//  tripPlan
//
//  Created by MattHew Phraxayavong on 7/8/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView = UITableView()
    var storage: CoreDataStack!
    var trips: [Trip]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(TripCell.self, forCellReuseIdentifier: "tripcell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        tableView.separatorStyle = .none
        
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchTrips()
    }
    func createHeader()
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 35))
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 0, width: self.view.bounds.width - 40, height: 35)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Frutiger-HeavyItalic", size: 25)
        label.text = "My Planned Trips"
        label.textAlignment = .center
        let button = UIButton(frame: CGRect(x: self.view.bounds.width - 100, y: 0, width: 100, height: 35))
        button.setTitle("Add Trip", for: .normal)
        button.titleLabel?.sizeToFit()
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(addTrip), for: .touchUpInside)
        view.addSubview(label)
        view.addSubview(button)

        tableView.tableHeaderView = view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.view.bounds.height * 0.1
    }

    @objc func addTrip()
    {
        print("add trip pressed")
        let vc = CreateTrip()
        vc.store = self.storage
        self.present(vc, animated: true, completion: nil)
    }
    func fetchTrips()
    {
        self.storage.fetchPersistedData {
            
            (fetchItemsResult) in
            
            switch fetchItemsResult {
            case let .success(items):
                self.trips = items
            case .failure(_):
                self.trips.removeAll()
            }
            
            self.tableView.reloadData()
            self.view.addSubview(self.tableView)
            self.createHeader()
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let item = self.trips[indexPath.row]
            storage.persistentContainer.viewContext.delete(item)
            storage.saveContext()
            trips.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TripVC()
        vc.theTrip = self.trips[indexPath.row]
        vc.store = self.storage
        self.present(vc, animated: true, completion: nil)
    }  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TripCell()
        cell.nameOfTrip.text = trips[indexPath.row].tripname
        return cell
    }
}
