//
//  CityDetailViewController.swift
//  RunnersWorld
//
//  Created by Cameron Crockett on 2/20/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    var city : CityState?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        if let selectedCity = city {
            print("Selected City: \(selectedCity.city), \(selectedCity.state)")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
