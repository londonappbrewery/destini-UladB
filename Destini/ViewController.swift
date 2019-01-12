//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    let allStories = StoryBank()
    
    // TODO Step 5: Initialise instance variables here
    var storyIndex = 1
    var branch : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        
    findStory(forStoryIndex: storyIndex)
        
    }

    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        // TODO Step 4: Write an IF-Statement to update the views
        if sender.tag == 1 {

            storyIndex = storyIndex + 2
            
        }
        
        else if sender.tag == 2 {
            
            storyIndex = storyIndex + 1
            
        }
                
        // TODO Step 6: Modify the IF-Statement to complete the story
        print(storyIndex)
        print(branch)
        
        findStory(forStoryIndex: storyIndex)
    }
    
    
    //figure out how to add if statement here
    //or a separate function how to guide through the story, try to make as generic as possible
    func findStory(forStoryIndex : Int) {
        
        if storyIndex == 1 && branch == "" {
            display(storyNumber: 1)
        }
        else if storyIndex == 3 && branch == "" {
            display(storyNumber: 3)
            branch = "a"
        }
        else if storyIndex == 2 && branch == "" {
            display(storyNumber: 2)
            branch = "b"
        }
        else if storyIndex == 5 && branch == "a" {
            display(storyNumber: 6)
            hideButtonsReset()
        }
        else if storyIndex == 4 && branch == "a" {
            display(storyNumber: 5)
            hideButtonsReset()
        }
        else if storyIndex == 3 && branch == "b" {
            display(storyNumber: 4)
            hideButtonsReset()
        }
        else if storyIndex == 4 && branch == "b" {
            display(storyNumber: 3)
        }
        else if storyIndex == 6 && branch == "b" {
            display(storyNumber: 6)
            hideButtonsReset()
        }
        else if storyIndex == 5 && branch == "b" {
            display(storyNumber: 5)
            hideButtonsReset()
        }
    }
    
    func display(storyNumber : Int) {
        
        storyTextView.text = allStories.list[storyNumber].storyText
        
        topButton.setTitle(allStories.list[storyNumber].storyAnswer1, for: .normal)
        bottomButton.setTitle(allStories.list[storyNumber].storyAnswer2, for: .normal)
        
    }
    func hideButtonsReset(){
        topButton.isHidden = true
        bottomButton.isHidden = true
        let alert = UIAlertController(title: "The End", message: "Want to do it again?", preferredStyle: .actionSheet)
        let restartGame = UIAlertAction(title: "Start Again", style: .default) { (UIAlertAction) in
            self.startOver()
        }
        let endGame = UIAlertAction(title: "Exit", style: .default) { (UIAlertAction) in
            exit(0)
        }
        alert.addAction(restartGame)
        alert.addAction(endGame)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.present(alert,animated: true)
        })
        
    }
    
    func startOver(){
        
        storyIndex = 1
        branch = ""
        findStory(forStoryIndex: storyIndex)
        topButton.isHidden = false
        bottomButton.isHidden = false
    }
}
