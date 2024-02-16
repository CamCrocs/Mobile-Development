//
//  DollarAmountViewController.swift
//  CurrencyConverter
//
//  Created by Fletcher Crockett on 2/15/24.
//

import UIKit

class DollarAmountViewController: UIViewController {
    var dollarAmount : Int = 0
    var currencyOneSwitchState = false
    var currencyTwoSwitchState = false
    var currencyThreeSwitchState = false
    var currencyFourSwitchState = false
    
    var convert = ConverterLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    func labelConfig() -> UILabel {
        let label = UILabel()
        if dollarAmount % 1 == 0 && dollarAmount > 0 {
            label.text = "Amount in USD: $\(dollarAmount)"
        }
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.textColor = UIColor.red
        return label
    }
    
    
    func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        
        let mainView = labelConfig()
        stackView.addArrangedSubview(mainView)
    
        convert.setSwitch(currencyOneSwitchState, for: 1)
        convert.setSwitch(currencyTwoSwitchState, for: 2)
        convert.setSwitch(currencyThreeSwitchState, for: 3)
        convert.setSwitch(currencyFourSwitchState, for: 4)
        
        let convertedAmounts = convert.convertAmount(dollarAmount)
        
        displayAmount(title: "Chinese Yuan:", amount: convertedAmounts.chineseAmount, in: stackView)
        displayAmount(title: "Indian Rupee:", amount: convertedAmounts.indianAmount, in: stackView)
        displayAmount(title: "Mexican Peso:", amount: convertedAmounts.mexicanAmount, in: stackView)
        displayAmount(title: "Russian Ruble:", amount: convertedAmounts.russianAmount, in: stackView)
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func displayAmount(title: String, amount: Int, in stackView: UIStackView) {
        if amount % 1 == 0 && amount > 0 {
            let label = UILabel()
            let currencyTitle = NSAttributedString(string: title, attributes: [.font: UIFont.boldSystemFont(ofSize: 16.0)])
            let currencyColor = NSAttributedString(string: "\(amount)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            let combineAttributes = NSMutableAttributedString()
            combineAttributes.append(currencyTitle)
            combineAttributes.append(NSAttributedString(string: "        "))
            combineAttributes.append(currencyColor)
            label.attributedText = combineAttributes
            stackView.addArrangedSubview(label)
        }
    }
}
