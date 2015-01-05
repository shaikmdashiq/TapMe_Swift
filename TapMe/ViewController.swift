//
//  ViewController.swift
//  TapMe
//
//  Created by Shaik MD Ashiq on 24/10/14.
//  Copyright (c) 2014 ak46. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIAlertViewDelegate {
    
   @IBOutlet weak var scoreLabel : UILabel!
    
   @IBOutlet weak var timerLabel : UILabel!
    
    var count:Int=0
    var second:Int=30
    var timer=NSTimer()

    var buttonbeep = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ButtonTap", ofType: "wav")!)
    var secondBeep = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("SecondBeep", ofType: "wav")!)
    var backgroundMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("VIP", ofType: "mp3")!)
    
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayer1=AVAudioPlayer()
    var audioPlayer2=AVAudioPlayer()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor=UIColor(patternImage: UIImage (named:"bg_tile.png")!)
        scoreLabel.backgroundColor=UIColor(patternImage: UIImage (named:"field_score.png")!)
        timerLabel.backgroundColor=UIColor(patternImage: UIImage (named:"field_time.png")!)
        
        audioPlayer=AVAudioPlayer(contentsOfURL: backgroundMusic, error: nil)
        audioPlayer.volume=0.3
       audioPlayer.play()
        
        gameSetup()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func gameSetup()
    {
        count=0
        second=30
        var times=1.0
        
        scoreLabel.text="Score : \(count)"
        timerLabel.text="Time : \(second)"
       
       timer = NSTimer.scheduledTimerWithTimeInterval(times, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
      
    }
        
    
    func subtractTime()
    {
        second--
        timerLabel.text="Time : \(second)"
        audioPlayer2=AVAudioPlayer(contentsOfURL: secondBeep, error: nil)
        audioPlayer2.play()
        
        
        if(second==0)
        {
            timer.invalidate()
            
            let alert=UIAlertView()
            alert.title="Time is up!"
            alert.message="You scored \(count) Points"
            alert.addButtonWithTitle("Play Again")
            alert.show()
            alert.delegate=self
        }
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int)
    {
        
        gameSetup()
    }
    
   @IBAction func buttonPressed()
    {
        audioPlayer1=AVAudioPlayer(contentsOfURL: buttonbeep, error: nil)
        audioPlayer1.play()
        count++
        scoreLabel.text="Score \(count)"
    }

}

