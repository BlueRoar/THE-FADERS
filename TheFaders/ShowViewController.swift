//
//  ShowViewController.swift
//  OSCTest
//
//  Created by James Hurwitz on 9/19/19.
//  Copyright © 2019 Devin Roth. All rights reserved.
//

import UIKit
import SwiftOSC
import VerticalSteppedSlider


class ShowViewController: UIViewController {

    @IBOutlet weak var slider1: VSSlider!
    @IBOutlet weak var slider2: VSSlider!
    @IBOutlet weak var slider3: VSSlider!
    @IBOutlet weak var slider4: VSSlider!
    @IBOutlet weak var slider5: VSSlider!
    @IBOutlet weak var slider6: VSSlider!
    @IBOutlet weak var slider7: VSSlider!
    @IBOutlet weak var slider8: VSSlider!
    @IBOutlet weak var slider9: VSSlider!
    @IBOutlet weak var slider10: VSSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
       //code for labels//  label1.text = String(format: "%.02f", slider1.value)
                            //label1.text = String(format: "%.02f", slider1.value)
    }
    
    //Slider Functions
@IBAction func slider1changed(_ sender: Any) {

    let message = OSCMessage(slider1address, slider1.value)
    client.send(message)
    }
    //
    @IBAction func slider2changed(_ sender: Any) {
        
        let message = OSCMessage(slider2address, slider2.value)
        client.send(message)
    }
    //
    @IBAction func slider3changed(_ sender: Any) {
        let message =
        OSCMessage(slider3address, slider3.value)
        client.send(message)
    }
    
    @IBAction func slider4changed(_ sender: Any) {
        let message =
            OSCMessage(slider4address, slider4.value)
        client.send(message)
    }
    
    @IBAction func slider5changed(_ sender: Any) {
        let message =
            OSCMessage(slider5address, slider5.value)
        client.send(message)
    }
    
    @IBAction func slider6changed(_ sender: Any) {
        let message =
            OSCMessage(slider6address, slider6.value)
        client.send(message)
    }
    
    @IBAction func slider7changed(_ sender: Any) {
        let message =
            OSCMessage(slider7address, slider7.value)
        client.send(message)
    }
    @IBAction func slider8changed(_ sender: Any) {
        let message =
            OSCMessage(slider8address, slider8.value)
        client.send(message)
    }
    @IBAction func slider9changed(_ sender: Any) {
        let message =
            OSCMessage(slider9address, slider9.value)
        client.send(message)
    }
    @IBAction func slider10changed(_ sender: Any) {
        let message =
            OSCMessage(slider10address, slider10.value)
        client.send(message)
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // disable status bar
    override var prefersStatusBarHidden : Bool {
        return true
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


