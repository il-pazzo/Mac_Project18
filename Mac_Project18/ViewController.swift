//
//  ViewController.swift
//  Mac_Project18
//
//  Created by Glenn Cole on 10/28/18.
//  Copyright © 2018 Glenn Cole. All rights reserved.
//
//  Worked-through tutorial from Paul Hudson's "Hacking With macOS"
//  https://www.hackingwithswift.com/store/hacking-with-macos
//

import Cocoa

class ViewController: NSViewController {
    
    @objc dynamic var temperatureCelsius: Double = 25.0 {
        didSet {
            updateFahrenheit()
        }
    }
    @objc dynamic var temperatureFahrenheit: Double = 50.0
    
    @objc dynamic var icon: String {
        
        switch temperatureCelsius {
            
        case let temp where temp < 0:
            return "⛄️"
        case 0...10:
            return "❄️"
        case 10...20:
            return "☁️"
        case 20...30:
            return "⛅️"
        case 30...40:
            return "☀️"
        case 40...50:
            return "🔥"
        default:
            return "💀"
        }
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateFahrenheit()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func setNilValueForKey(_ key: String) {
        
        if key == "temperatureCelsius" {
            temperatureCelsius = 0.0
        }
    }
    
    override class func keyPathsForValuesAffectingValue( forKey key: String ) -> Set<String> {
        
        if key == "icon" {
            return [ "temperatureCelsius" ]
        }
        else {
            return []
        }
    }
    
    func updateFahrenheit() {
        
        let celsius = Measurement( value: temperatureCelsius, unit: UnitTemperature.celsius )
        
        temperatureFahrenheit = round( celsius.converted(to: .fahrenheit ).value )
    }

    @IBAction func reset(_ sender: NSButton) {

        temperatureCelsius = 50.0
    }
    
}

