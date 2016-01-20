//
//  ViewController.swift
//  Multiples
//
//  Created by Chad Wollenberg on 1/18/16.
//  Copyright © 2016 Chad Wollenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    //properties
    var Multnum:Int = 0
    var MaxNum:Int = 0
    var currentNum:Int = 0
    var workingNum:Int = 0
    
    

    
    //outlets
    @IBOutlet weak var titleLogo: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var multipleField: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var statLbl: UILabel!
    @IBOutlet weak  var ErrorLbl: UIButton!
    
    @IBOutlet weak var winnerbtn: UIButton!

    
    @IBAction func onPlayBtnPressed (sender: UIButton!) {
        
        if multipleField.text != nil && multipleField.text != "" {
            playBtn.hidden = true
            multipleField.hidden = true
            
            statLbl.hidden = false
            addBtn.hidden = false
            
            Multnum = Int(multipleField.text!)!
            currentNum = Multnum
            statLbl.text = "tap 'add' to add!"
            findMaxNum()
        } else {
            showErrorBtn()
        }
        
    }
    
    @IBAction func onAddBtnPressed (sender: UIButton!) {
        addcurrentandmultiple()
        updatestatLbl()
        if isGameOver(){
            showWinnerScreen()
        }
    }
    @IBAction func onErrorLblPressed (sender: UIButton!) {
        multipleField.text = ""
        ErrorLbl.hidden = true
        
    }
    
    @IBAction func onWinnerPress (sender: UIButton!) {
        restartGame()
    }
    //functions
    
    func addcurrentandmultiple() {
        workingNum = currentNum
       currentNum = Multnum + currentNum
    }
    
    func updatestatLbl() {
        statLbl.text = " \(workingNum) + \(Multnum) = \(currentNum) "
    }
    func findMaxNum(){
        MaxNum = Multnum * 20
    }
    func isGameOver() ->Bool {
        if currentNum >= MaxNum {
            return true
        } else {
            return false
        }
        
    }
    func restartGame() {
        winnerbtn.hidden = true
        showLogo()
        showstarterscreen()
        currentNum = 0
        Multnum = 0
        MaxNum = 0
        workingNum = 0
        multipleField.text = ""
    }
    
    func showErrorBtn() {
        ErrorLbl.hidden = false
    }
    
    func showWinnerScreen() {
        winnerbtn.hidden = false
        hideLogo()
        HideStarterScreen()
        HidePlayScreen()
    }
    
    
    func HideStarterScreen() {
        playBtn.hidden = true
        multipleField.hidden = true
    }
    
    func HidePlayScreen() {
        statLbl.hidden = true
        addBtn.hidden = true
    }
    
    func showstarterscreen() {
        playBtn.hidden = false
        multipleField.hidden = false
    }
    
    func showPlayScreen() {
        statLbl.hidden = false
        addBtn.hidden = false
    }
    
    func hideLogo() {
        titleLogo.hidden = true
    }
    
    func showLogo(){
        titleLogo.hidden = false
    }
}