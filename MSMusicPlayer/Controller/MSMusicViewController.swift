//
//  MSMusicViewController.swift
//  MSMusicPlayer
//
//  Created by Mind Stand on 08/02/17.
//  Copyright © 2017 Mind Stand. All rights reserved.
//

import UIKit
import AVFoundation

class MSMusicViewController: UIViewController {

    var trackId: Int = 0
    var library = MusicLibrary().library
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var buttonsView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Music Player"
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ic_background")!)
        
        buttonsView.layer.cornerRadius = 15
        
        // Do any additional setup after loading the view.
        songTitleLabel.text = library[trackId]["title"]
        artistLabel.text = library[trackId]["artist"]
        
        
        let path = NSBundle.mainBundle().pathForResource("\(trackId)", ofType: "mp3")
        
        if let path = path {
            let mp3URL = NSURL(fileURLWithPath: path)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: mp3URL)
                audioPlayer.play()
                
                //Cover Image
                UIGraphicsBeginImageContext(self.view.frame.size)
                UIImage(named: library[trackId]["coverImage"]!)?.drawInRect(self.view.bounds)
                
                let coverImage: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
                
                UIGraphicsEndImageContext()
                
                self.view.backgroundColor = UIColor(patternImage: coverImage!)
                
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    
    @IBAction func pauseButtonAction(sender: UIButton) {
        if audioPlayer.playing {
            audioPlayer.pause()
        }
        //        else {
        //            audioPlayer.play()
        //        }
    }
    
    @IBAction func playButtonAction(sender: UIButton) {
        if !audioPlayer.playing {
            audioPlayer.play()
        }
    }
    
    @IBAction func stopButtonAction(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
    
    @IBAction func nextSongButtonAction(sender: UIButton) {
        
        if trackId < (library.count - 1) {
            
            trackId += 1
        }
        else {
            trackId = 0
        }
        print(trackId)
        songTitleLabel.text = library[trackId]["title"]
        artistLabel.text = library[trackId]["artist"]
        
        audioPlayer.currentTime = 0
        
        
        let path = NSBundle.mainBundle().pathForResource("\(trackId)", ofType: "mp3")
        
        if let path = path {
            let mp3URL = NSURL(fileURLWithPath: path)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: mp3URL)
                audioPlayer.play()
                
                //Cover Image
                UIGraphicsBeginImageContext(self.view.frame.size)
                UIImage(named: library[trackId]["coverImage"]!)?.drawInRect(self.view.bounds)
                
                let coverImage: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
                
                UIGraphicsEndImageContext()
                
                self.view.backgroundColor = UIColor(patternImage: coverImage!)
                
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    
    @IBAction func previousSongButtonAction(sender: UIButton) {
        
        if trackId > 0 {
            
            trackId -= 1
        }
        else{
            trackId = library.count - 1
        }
        
        songTitleLabel.text = library[trackId]["title"]
        artistLabel.text = library[trackId]["artist"]
        
        audioPlayer.currentTime = 0
        
        let path = NSBundle.mainBundle().pathForResource("\(trackId)", ofType: "mp3")
        
        if let path = path {
            let mp3URL = NSURL(fileURLWithPath: path)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: mp3URL)
                audioPlayer.play()
                
                //Cover Image
                UIGraphicsBeginImageContext(self.view.frame.size)
                UIImage(named: library[trackId]["coverImage"]!)?.drawInRect(self.view.bounds)
                
                let coverImage: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
                
                UIGraphicsEndImageContext()
                
                self.view.backgroundColor = UIColor(patternImage: coverImage!)
                
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
