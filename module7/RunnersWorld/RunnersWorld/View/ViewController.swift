//
//  ViewController.swift
//  RunnersWorld
//
//  Created by Cameron Crockett on 2/18/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var cityTableView: UITableView!
    var cities = [
        CityState(city: "Atlanta", state: "GA"),
        CityState(city: "Dallas", state: "TX"),
        CityState(city: "Austin", state: "TX"),
        CityState(city: "Las Vegas", state: "NV"),
        CityState(city: "San Diego", state: "CA"),
        CityState(city: "Tampa", state: "FL"),
        CityState(city: "Nashville", state: "TN"),
        CityState(city: "Chicago", state: "IL"),
        CityState(city: "Portland", state: "OR"),
        CityState(city: "Boston", state: "MA")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        cityTableView = UITableView()
        cityTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityTableView)
        
        NSLayoutConstraint.activate([
            cityTableView.topAnchor.constraint(equalTo: view.topAnchor),
            cityTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cityTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        cityTableView.isUserInteractionEnabled = true
        cityTableView.dataSource = self
        cityTableView.delegate = self
        cityTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cities[indexPath.row].city
        content.secondaryText = cities[indexPath.row].state
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = cities[indexPath.row]
        performSegue(withIdentifier: "citySegue", sender: selectedCity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "citySegue" {
            if let destinationViewController = segue.destination as? CityDetailViewController,
               let selectedCity = sender as? CityState {
                destinationViewController.city = selectedCity
            }
        }
    }
}

