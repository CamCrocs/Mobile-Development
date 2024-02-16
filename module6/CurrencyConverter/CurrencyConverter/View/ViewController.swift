//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Cameron Crockett on 2/14/24.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel : UILabel!
    var currencyAmountLabel : UILabel!
    var currencyAmountTextField : UITextField!
    var currencyOneLabel : UILabel!
    var currencyTwoLabel: UILabel!
    var currencyThreeLabel: UILabel!
    var currencyFourLabel : UILabel!
    var currencyOneSwitch : UISwitch!
    var currencyTwoSwitch : UISwitch!
    var currencyThreeSwitch : UISwitch!
    var currencyFourSwitch : UISwitch!
    var convertButton : UIButton!
    var errorMessageLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelSetup()
        convertButtonSetup()
        setupStackView()
    }
    
    func titleLabelSetup() {
        
        titleLabel = UILabel()
        titleLabel.text = "Currency Converter"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    func setupStackView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        
        currencyAmountLabel = UILabel()
        currencyAmountLabel.text = "Enter USD:"
        currencyAmountLabel.textColor = .black
        currencyAmountLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        
        currencyAmountTextField = UITextField()
        currencyAmountTextField.layer.borderWidth = 3.0
        currencyAmountTextField.layer.borderColor = UIColor.black.cgColor
        currencyAmountTextField.layer.cornerRadius = 10.0
        currencyAmountTextField.placeholder = "Enter $"
        currencyAmountTextField.borderStyle = .roundedRect
        
        horizontalStackView.addArrangedSubview(currencyAmountLabel)
        horizontalStackView.addArrangedSubview(currencyAmountTextField)
        
        let currencyOneStackView = UIStackView()
        currencyOneStackView.axis = .horizontal
        currencyOneStackView.spacing = 10
        
        currencyOneLabel = UILabel()
        currencyOneLabel.text = "Chinese Yuan:"
        currencyOneLabel.textColor = .black
        currencyOneLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        
        currencyOneSwitch = UISwitch()
        
        currencyOneStackView.addArrangedSubview(currencyOneLabel)
        currencyOneStackView.addArrangedSubview(currencyOneSwitch)
        
        let currencyTwoStackView = UIStackView()
        currencyTwoStackView.axis = .horizontal
        currencyTwoStackView.spacing = 10
        
        currencyTwoLabel = UILabel()
        currencyTwoLabel.text = "Indian Rupee:"
        currencyTwoLabel.textColor = .black
        currencyTwoLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        
        currencyTwoSwitch = UISwitch()
        
        currencyTwoStackView.addArrangedSubview(currencyTwoLabel)
        currencyTwoStackView.addArrangedSubview(currencyTwoSwitch)
        
        let currencyThreeStackView = UIStackView()
        currencyThreeStackView.axis = .horizontal
        currencyThreeStackView.spacing = 10
        
        currencyThreeLabel = UILabel()
        currencyThreeLabel.text = "Mexican Peso:"
        currencyThreeLabel.textColor = .black
        currencyThreeLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        
        currencyThreeSwitch = UISwitch()
        
        currencyThreeStackView.addArrangedSubview(currencyThreeLabel)
        currencyThreeStackView.addArrangedSubview(currencyThreeSwitch)
        
        let currencyFourStackView = UIStackView()
        currencyFourStackView.axis = .horizontal
        currencyFourStackView.spacing = 10
        
        currencyFourLabel = UILabel()
        currencyFourLabel.text = "Russian Ruble:"
        currencyFourLabel.textColor = .black
        currencyFourLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        
        currencyFourSwitch = UISwitch()
        
        currencyFourStackView.addArrangedSubview(currencyFourLabel)
        currencyFourStackView.addArrangedSubview(currencyFourSwitch)
        
        stackView.addArrangedSubview(horizontalStackView)
        stackView.addArrangedSubview(currencyOneStackView)
        stackView.addArrangedSubview(currencyTwoStackView)
        stackView.addArrangedSubview(currencyThreeStackView)
        stackView.addArrangedSubview(currencyFourStackView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            convertButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
    
    func convertButtonSetup() {

        convertButton = UIButton()
        convertButton.setTitle("Convert", for: .normal)
        convertButton.setTitleColor(.white, for: .normal)
        convertButton.contentHorizontalAlignment = .center
        convertButton.contentVerticalAlignment = .center
        convertButton.layer.borderWidth = 3.0
        convertButton.layer.borderColor = UIColor.gray.cgColor
        convertButton.layer.cornerRadius = 10
        convertButton.backgroundColor = .black
        convertButton.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10.0,
        leading: 15.0, bottom: 10.0, trailing: 15.0)
        
        convertButton.configuration = buttonConfig
        view.addSubview(convertButton)
        convertButton.addTarget(self, action: #selector(navigate(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            convertButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            convertButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @IBAction func navigate(_ sender: UIButton) {
        guard let text = currencyAmountTextField.text, let amount = Int(text), amount % 1 == 0 && amount > 0 else {
            displayError(message: "please enter a whole #.")
            return
        }
        let dollarAmountViewController = DollarAmountViewController()
        dollarAmountViewController.dollarAmount = Int(currencyAmountTextField.text ?? "") ?? 0
        dollarAmountViewController.currencyOneSwitchState = currencyOneSwitch.isOn
        dollarAmountViewController.currencyTwoSwitchState = currencyTwoSwitch.isOn
        dollarAmountViewController.currencyThreeSwitchState = currencyThreeSwitch.isOn
        dollarAmountViewController.currencyFourSwitchState = currencyFourSwitch.isOn
        dollarAmountViewController.modalPresentationStyle = .fullScreen
        self.present(dollarAmountViewController, animated: true, completion: nil)
    }
    
    func displayError(message: String) {
        errorMessageLabel?.removeFromSuperview()
        
        errorMessageLabel = UILabel()
        errorMessageLabel?.text = message
        errorMessageLabel?.textColor = .red
        errorMessageLabel?.font = UIFont.systemFont(ofSize: 10.0)
        errorMessageLabel?.frame = CGRect(x: 20, y: 20, width: 5, height: 5)
        errorMessageLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(errorMessageLabel!)
        
        NSLayoutConstraint.activate([
            errorMessageLabel!.topAnchor.constraint(equalTo: currencyAmountTextField.bottomAnchor, constant: 8),
            errorMessageLabel!.leadingAnchor.constraint(equalTo: currencyAmountTextField.leadingAnchor),
            errorMessageLabel!.trailingAnchor.constraint(equalTo: currencyAmountTextField.trailingAnchor)
        ])
        
        currencyAmountTextField.layer.borderColor = UIColor.red.cgColor
    }
}

