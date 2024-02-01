//
//  ViewController.swift
//  Timer
//
//  Created by Cameron Crockett on 1/30/24.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
     var timeLabel: UILabel!
     var timerLabel: UILabel!
     var startStopButton: UIButton!
     var datePicker: UIDatePicker!
    
    var timer: Timer?
    var timeRemaining: TimeInterval = 0
    var musicPlayer : AVAudioPlayer?
    var isMusicPlaying = false
    
    /*
     Lifecycle functions.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage()
        setupUI()
        startStopButton.setTitle("Start Timer", for: .normal)
        timerLabel.text = "Time Remaining: 00:00:00"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDateTime()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }
    
    /*
     UI setup with constraints and elements.
     */
    
    func setupUI() {
        timeLabel = UILabel()
        timeLabel.textColor = .white
        
        
        timerLabel = UILabel()
        timerLabel.textColor = .white
        timerLabel.text = "Time Remaining 00:00:00"
        view.addSubview(timerLabel)
        
        startStopButton = UIButton()
        startStopButton.setTitleColor(.white, for: .normal)
        startStopButton.layer.borderWidth = 2.0
        startStopButton.layer.cornerRadius = 5.0
        startStopButton.layer.borderColor = UIColor.white.cgColor
        startStopButton.setTitle("Start Timer / Stop Music", for: .normal)
        startStopButton.addTarget(self, action: #selector(startStopButtonTapped), for: .touchUpInside)
        view.addSubview(startStopButton)
        
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .countDownTimer
        datePicker.backgroundColor = .white
        view.addSubview(datePicker)
        
        view.addSubview(timeLabel)
        view.addSubview(timerLabel)
        view.addSubview(startStopButton)
        view.addSubview(datePicker)
        
        let startStopStack = UIStackView(arrangedSubviews: [startStopButton, timerLabel])
        startStopStack.axis = .vertical
        startStopStack.spacing = 5
        startStopStack.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [timeLabel, datePicker, startStopStack])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
            timeLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            datePicker.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            startStopStack.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: startStopStack.bottomAnchor)
        ])
        
    }

    func backgroundImage() {
        let currentDateTime = Date()
        let calender = Calendar.current
        let hour = calender.component(.hour, from: currentDateTime)
        var imageName = ""
        
        if hour >= 0 && hour < 12 { // if we're between 0:00 and 12:00 hours, use first, else second image.
            imageName = "nighttime.jpg"
        } else {
            imageName = "daytime.png"
        }
        if let backgroundImage = UIImage(named: imageName) { // setting our image accordingly.
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            print("Error loading background :(") // error handling.
        }
    }
    
    @objc func startStopButtonTapped() {
        if isMusicPlaying {
            stopMusic()
            startStopButton.setTitle("Start Timer", for: .normal)
        } else {
            if timer != nil {
                stopTimer()
                startStopButton.setTitle("Start Timer", for: .normal)
            } else {
                startTimer()
                setTimerLabel()
                startStopButton.setTitle("Stop Timer", for: .normal)
            }
        }
    }
    
    func startTimer() {
        stopTimer()
        if timer == nil {
            setTimerLabel()
        }
        let countDown = datePicker.countDownDuration
        timeRemaining = countDown
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)

        updateDateTimeContinuously()
    }
    
    
    func playMusic() {
        if let audioURL = Bundle.main.url(forResource: "musicplayer", withExtension: "mp3") {
            do {
                musicPlayer = try AVAudioPlayer(contentsOf: audioURL)
                musicPlayer?.prepareToPlay()
                musicPlayer?.play()
                isMusicPlaying = true
            } catch {
                print("Error playing audio.")
            }
        }
    }
    
    func stopMusic() {
        musicPlayer?.stop()
        musicPlayer = nil
        isMusicPlaying = false
        startStopButton.setTitle("Start Timer", for: .normal)
    }
    
    @objc func updateTimer() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            setTimerLabel()
        } else {
            stopTimer()
            playMusic()
            startStopButton.setTitle("Stop Music", for: .normal)
        }
    }
    
    func setTimerLabel() {
        let hours = Int(timeRemaining) / 3600
        let minutes = Int(timeRemaining) / 60 % 60
        let seconds = Int(timeRemaining) % 60
        
        timerLabel.text = String(format: "Time Remaining: %02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateDateTime() {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "E, dd MMM yyyy HH:mm:ss"
        let currentDateTime = Date()
        let dateString = dateFormat.string(from: currentDateTime)
        timeLabel.text = dateString
        
    }
    
    func updateDateTimeContinuously() {
        let dateTimeTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateDateTime), userInfo: nil, repeats: true)
        RunLoop.current.add(dateTimeTimer, forMode: .common)
    }
}

