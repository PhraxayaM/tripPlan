//
//  TripVC.swift
//  tripPlan
//
//  Created by MattHew Phraxayavong on 7/8/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//
import UIKit

class TripVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView = UITableView()
    var theTrip: Trip!
    var store: CoreDataStack!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 30, width: self.view.bounds.width - 120, height: 35)
        label.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        label.font = UIFont(name: "Frutiger", size: 25)
        label.text = theTrip.tripname
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        let button = UIButton(frame: CGRect(x: 0, y: 30, width: 70, height: 35))
        button.setTitle("Back", for: .normal)
        button.titleLabel?.sizeToFit()
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        
        self.view.addSubview(button)
        self.view.addSubview(label)
        
        tableView.register(wPointCell.self, forCellReuseIdentifier: "wpcell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: label.frame.maxY, width: self.view.bounds.width, height: self.view.bounds.height - label.frame.maxY)
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        createHeader()
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        createHeader()
        tableView.reloadData()
    }
    @objc func backPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }
    func createHeader()
    {
        let vieww = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.4))
        let label = UILabel()
        label.frame = CGRect(x: 20, y: self.view.bounds.height * 0.2, width: self.view.bounds.width - 40, height: 60)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Frutiger-HeavyItalic", size: 20)
        label.text = theTrip.tripname
        label.textAlignment = .center
        label.numberOfLines = 2
        let buttons = UIButton(frame: CGRect(x: 10, y: label.frame.maxY + 20, width: self.view.bounds.width - 20, height: 35))
        buttons.setTitleColor(.red, for: .normal)
        buttons.setTitle("Add more waypoints?", for: .normal)
        buttons.addTarget(self, action: #selector(addWP), for: .touchUpInside)
        if let wps = theTrip.waypoints
        {
            if(wps.count < 1)
            {
                label.text = "You don't have any \nwaypoints for your trip."
                buttons.setTitle("Start", for: .normal)
            }
        }
        
        vieww.addSubview(label)
        vieww.addSubview(buttons)
        tableView.tableHeaderView = vieww
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.view.bounds.height * 0.4
    }
    @objc func addWP()
    {
        let vc = wPointVC()
        vc.theTrip = self.theTrip
        vc.store = self.store
        self.present(vc, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let wps = theTrip.waypoints
        {
            return wps.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            theTrip.removeWP(index: indexPath.row)
            store.saveContext()
            tableView.deleteRows(at: [indexPath], with: .fade)
            createHeader()
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = wPointVC()
        vc.theTrip = self.theTrip
        vc.store = self.store
        self.present(vc, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = wPointCell()
        if let wp = theTrip.waypoints{
            cell.WPName.text = wp[indexPath.row].name
        }
        return cell
    }
}
