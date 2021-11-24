//
//  ViewController.swift
//  OSCTest
//
//  Created by Devin Roth on 2017-11-10.
//  Copyright © 2017 Devin Roth. All rights reserved.
//

import UIKit

//import framework
import SwiftOSC

// Setup Client. Change address from localhost if needed.
var client = OSCClient(address: "localhost", port: 8080)
var addressPattern = "/cue/5/"
var address = OSCAddressPattern(addressPattern)

var slider1address = OSCAddressPattern("/eos/sub/1")
var slider2address = OSCAddressPattern("/eos/sub/2")
var slider3address = OSCAddressPattern("/eos/sub/3")
var slider4address = OSCAddressPattern("/eos/sub/4")
var slider5address = OSCAddressPattern("/eos/sub/5")
var slider6address = OSCAddressPattern("/eos/sub/6")
var slider7address = OSCAddressPattern("/eos/sub/7")
var slider8address = OSCAddressPattern("/eos/sub/8")
var slider9address = OSCAddressPattern("/eos/sub/9")
var slider10address = OSCAddressPattern("/eos/sub/10")


var ipAddress = "localhost"
var port = 8080

class ViewController: UIViewController {
    
    // User defaults
    private var defaults = UserDefaults.standard
    
    //Variables

    

    
    // UI Elements
    @IBOutlet weak var ipAddressLabel: UITextField!
    @IBOutlet weak var portLabel: UITextField!
    @IBOutlet weak var addressPatternLabel: UITextField!

    override var prefersStatusBarHidden : Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // load ip address
        if let getipAddress = defaults.string(forKey: "ipAddress") {
            ipAddress = getipAddress
            if getipAddress == "" {
                ipAddress = "localhost"
            }
            ipAddressLabel.text = ipAddress
            
        }
       
        //load port
        port = defaults.integer(forKey: "port")
        print(port)
        if port == 0 {
            port = 8080
        }
        portLabel.text = String(port)
        

        //load address pattern
        addressPattern = defaults.string(forKey: "address") ?? "/cue/5/"
        addressPatternLabel.text = addressPattern
       
        // set client
        client = OSCClient(address: ipAddress, port: port)
        
        
        
        
        
        
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Connect UI and send OSC message

    @IBAction func ipAddressTextField(_ sender: UITextField) {
        
        if let message = sender.text {
            ipAddress = message
            client = OSCClient(address: ipAddress, port: port)
            
            defaults.set(ipAddress, forKey: "ipAddress")
        }
    }
    
    @IBAction func portTextField(_ sender: UITextField) {
        
        if let text = sender.text {
            if let number = Int(text) {
                print(number)
                port = number
                client = OSCClient(address: ipAddress, port: port)
                
                defaults.set(port, forKey: "port")
            }
        }
    }
    
    @IBAction func addressPatternTextField(_ sender: UITextField) {
        
        if let text = sender.text {
            address = OSCAddressPattern(text)
        }
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let message = OSCMessage(address, Int(sender.value))
        client.send(message)
    }
    
    @IBAction func slider(_ sender: UISlider) {
        let message = OSCMessage(address, sender.value)
        client.send(message)
    }
    
    @IBAction func switcher(_ sender: UISwitch) {
        let message = OSCMessage(address, sender.isOn)
        client.send(message)
    }
    
    @IBAction func impulse(_ sender: UIButton) {
        let message = OSCMessage(address)
        client.send(message)
    }

    
    @IBAction func sendText(_ sender: UIButton) {
        let sendit = OSCMessage(slider1address)
        client.send(sendit)
    }
    
// disable status bar

    
}


extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
