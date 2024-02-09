//
//  ViewController.swift
//  MyAdventure
//
//  Created by Cameron Crockett on 2/8/24.
//

import UIKit

class ViewController: UIViewController {

    // UI Components.
    
    var characterLabel: UIImageView!
    var sideCharacterLabel: UIImageView!
    var textLabel : UILabel!
    var choiceOne : UIButton!
    var choiceTwo : UIButton!
    var textLabelState : Int = 0
    var characterLogic = CharacterLogic()
    var startOverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtons()
        // Do any additional setup after loading the view.
    }
    
    // entire UI configuration and setup.
    
    func setupUI() {
        
        characterLabel = UIImageView(image: UIImage(named: "knight")) // knight photo in Assets.
        sideCharacterLabel = UIImageView(image: UIImage(named: "princess")) // princess photo in Assets.
        
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        characterLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        characterLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        sideCharacterLabel.translatesAutoresizingMaskIntoConstraints = false
        sideCharacterLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sideCharacterLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        textLabel = UILabel()
        textLabel.text = "The Princess has been kidnapped, you must save her! Choose a method of transport to the secret villian lair."
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        
        choiceOne = UIButton()
        choiceOne.setTitle("Fly Dragon", for: .normal)
        choiceOne.setTitleColor(.white, for: .normal)
        choiceOne.contentHorizontalAlignment = .center
        choiceOne.contentVerticalAlignment = .center
        choiceOne.layer.borderWidth = 3.0
        choiceOne.layer.borderColor = UIColor.white.cgColor
        choiceOne.backgroundColor = UIColor.clear
        choiceOne.layer.cornerRadius = 6
        choiceOne.titleLabel?.adjustsFontSizeToFitWidth = true
        choiceOne.titleLabel?.numberOfLines = 0
        choiceOne.titleLabel?.lineBreakMode = .byWordWrapping
        choiceOne.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
        
        choiceTwo = UIButton()
        choiceTwo.setTitle("Take Ship", for: .normal)
        choiceTwo.setTitleColor(.white, for: .normal)
        choiceTwo.contentVerticalAlignment = .center
        choiceTwo.contentHorizontalAlignment = .center
        choiceTwo.layer.borderWidth = 3.0
        choiceTwo.layer.borderColor = UIColor.white.cgColor
        choiceTwo.backgroundColor = UIColor.clear
        choiceTwo.layer.cornerRadius = 6
        choiceTwo.titleLabel?.adjustsFontSizeToFitWidth = true
        choiceTwo.titleLabel?.numberOfLines = 0
        choiceTwo.titleLabel?.lineBreakMode = .byWordWrapping
        choiceTwo.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
        
        let backgroundImage = UIImageView(image: UIImage(named: "castlebackground"))
        backgroundImage.frame = view.bounds
        backgroundImage.contentMode = .scaleAspectFill
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        let textStackView = UIStackView(arrangedSubviews: [textLabel])
        textStackView.axis = .horizontal
        textStackView.alignment = .center
        textStackView.distribution = .equalSpacing
        textStackView.spacing = 20
        
        let buttonStackView = UIStackView(arrangedSubviews: [choiceOne, choiceTwo])
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 20
        
        let characterStackView = UIStackView(arrangedSubviews: [characterLabel, sideCharacterLabel])
        characterStackView.axis = .horizontal
        characterStackView.alignment = .center
        characterStackView.distribution = .equalSpacing
        characterStackView.spacing = 30
        
        view.insertSubview(backgroundImage, at: 0)
        stackView.addArrangedSubview(characterStackView)
        stackView.addArrangedSubview(textStackView)
        stackView.addArrangedSubview(buttonStackView)
        
        choiceOne.frame = CGRect(x: 20, y: 20, width: 130, height: 100)
        choiceTwo.frame = CGRect(x: 20, y: 20, width: 130, height: 100)
        choiceOne.addTarget(self, action: #selector(choiceOneButton(_:)), for: .touchUpInside)
        choiceTwo.addTarget(self, action: #selector(choiceTwoButton(_:)), for: .touchUpInside)
        
        view.addSubview(stackView)
        textLabel.preferredMaxLayoutWidth = view.bounds.width - 40 // for horizontal textLabel formatting.
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraint configurations.
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo:
                        view.trailingAnchor, constant: -25),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            choiceOne.widthAnchor.constraint(equalToConstant: 130),
            choiceOne.heightAnchor.constraint(equalToConstant: 100),
            choiceTwo.widthAnchor.constraint(equalToConstant: 130),
            choiceTwo.heightAnchor.constraint(equalToConstant: 100),
            textStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
    
    // text transition animation.
    
    func updateText(with new: String) {
        UIView.transition(with: textLabel, duration: 1.0, options: .transitionCrossDissolve, animations: {
            self.textLabel.text = new
        }, completion: nil)
    }
    
    /*
     * Button logic to determine how the storyline progresses.
     * Dispatch a queue to have a short intermission between a new game and a win or loss scenario.
    */
    
    @IBAction func choiceOneButton(_ sender: UIButton) {
        if textLabelState == 0 { 
            updateText(with: characterLogic.updateTextField(0))
            choiceOne.setTitle("Run down the stairs to save the princess", for: .normal)
            choiceTwo.setTitle("Take the dragon down to the front gate", for: .normal)
           textLabelState = 1
        } else if choiceOne.currentTitle == "Run down the stairs to save the princess" {
            updateText(with: characterLogic.updateTextField(2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.updateUIGameOver()
            }
        } else {
            updateText(with: characterLogic.updateTextField(3))
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.updateUIGameOver()
            }
        }
    }
    
    /*
     * Button logic to determine how the storyline progresses.
     * Dispatch a queue to have a short intermission between a new game and a win or loss scenario.
    */
    
    @IBAction func choiceTwoButton(_ sender: UIButton) {
        if textLabelState == 0 {
            updateText(with: characterLogic.updateTextField(1))
            choiceOne.setTitle("Fight the guardian at the gate", for: .normal)
            choiceTwo.setTitle("Jump off the bridge and swim to the secret hidden cellar", for: .normal)
            textLabelState = 1
        } else if choiceTwo.currentTitle == "Jump off the bridge and swim to the secret hidden cellar" {
            updateText(with: characterLogic.updateTextField(5))
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.updateUIGameOver()
            }
        } else {
            updateText(with: characterLogic.updateTextField(4))
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.updateUIGameOver()
            }
        }
    }
    
    // resetting our UI.
    
    func updateUIGameOver() {
        choiceOne.isEnabled = false
        choiceTwo.isEnabled = false
        
        characterLabel.isHidden = true
        sideCharacterLabel.isHidden = true
        
        textLabel.text = "Game Over! Start Over?"
        
        self.startOverButton = UIButton()
        startOverButton.setTitle("Start Over", for: .normal)
        startOverButton.setTitleColor(.white, for: .normal)
        startOverButton.layer.borderWidth = 3.0
        startOverButton.layer.borderColor = UIColor.white.cgColor
        startOverButton.backgroundColor = .clear
        startOverButton.layer.cornerRadius = 6
        startOverButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        startOverButton.addTarget(self, action: #selector(startOverButtonTapped), for: .touchUpInside)
        
        view.addSubview(startOverButton)
        startOverButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startOverButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startOverButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startOverButton.widthAnchor.constraint(equalToConstant: 150),
            startOverButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Again, resetting our UI.
    
    @objc func startOverButtonTapped() {
        textLabel.text = "The Princess has been kidnapped, you must save her! Choose a method of transport to the secret villian lair."
        setupButtons()
        characterLabel.isHidden = false
        sideCharacterLabel.isHidden = false
        startOverButton.removeFromSuperview()
    }
    
    func setupButtons() {
        choiceOne.setTitle("Fly Dragon", for: .normal)
        choiceTwo.setTitle("Take Ship", for: .normal)
        choiceOne.isEnabled = true
        choiceTwo.isEnabled = true
        textLabelState = 0
    }
}

