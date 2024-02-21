//
//  CityDetailViewController.swift
//  RunnersWorld
//
//  Created by Cameron Crockett on 2/20/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    var city : CityState?
    var getParkLabel: UILabel!
    var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        if let selectedCity = city {
            getParkLabel = UILabel()
            getParkLabel.translatesAutoresizingMaskIntoConstraints = false
            getParkLabel.numberOfLines = 0
            getParkLabel.text = getPark(for: selectedCity)
            getParkLabel.font = .boldSystemFont(ofSize: 20.0)
            view.addSubview(getParkLabel)
            
            NSLayoutConstraint.activate([
                getParkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                getParkLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                getParkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                getParkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
            ])
        }
    }
    
    func getPark(for city: CityState) -> String {
        switch city.city {
        case "Atlanta":
            return "Atlanta is home to piedmont park. Encompassing approximately 185 acres, Piedmont Park offers trail running, road running, and even provides runners with a gravel half mile track. Piedmont park is also the largest park inside of metro Atlanta."
        case "Dallas":
            return "Owned by the City of Dallas, Carpenter Park is located near the eastern edge of Downtown Dallas. Encompassing 6 acres, Carpenter allows for trail running and road running. It also has many amenities such as outdoor basketball courts."
        case "Austin":
            return "Zilker Metropolitan Park is located in south Austin, that is composed of 250 acres of publicly owned land. Seeing it's massive size, Zilker allows for all types of running, whether it be trail, road, or track work."
        case "Las Vegas":
            return "Sunset Park in Las Vegas is located near Harry Reid International Airport in the southeastern portion of the valley. It provides a two mile loop paved track, as well as 3.5 miles of trails to run."
        case "San Diego":
            return "It is no question San Diego has one of the most beautiful parks in the US, being Balboa Park. Balboa Park has every type of running you could imagine. Outside of running, it provides 18 museums, numerous amounts of gardens, and home to the world famous San Diego Zoo."
        case "Tampa":
            return "Upper Tampa Bay Park is a scenic park that is known for its beautiul natural landscapes. Trails throughout Bay Park go through wetlands, forest, or along the waterfront. The park also has trails of all lengths, making it perfect for any level of runner."
        case "Nashville":
            return "Edwin Warner Park is massive, spanning over 2684 acres and located in the western part of Nashville. There are numerous hiking trails, even across the Little Harpeth River."
        case "Chicago":
            return "Lincoln Park covers over 1208 acres and is the cities greenest space. The park is adjacent to Lake Michigan's shoreline and provides Lakefront Trail for any runner who wishes to run next to Lake Michigan."
        case "Portland":
            return "Forest Park, encompassing over 5100 acres, is one of the largest urban forest in the US. It is home to an assortment of trails. It is home to the famous Wildwood Trail, spanning over 30 miles."
        case "Boston":
            return "Franklin Park is home to the famous Franklin Park loop that is approximately 2.5 miles. It is also home to a public track, named White Stadium. This provides a unique professional track for track based workouts."
        default:
            return "no park info."
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
