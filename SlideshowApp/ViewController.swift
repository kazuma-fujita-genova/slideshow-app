//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 藤田和磨 on 2018/10/02.
//  Copyright © 2018年 藤田和磨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let images = ["IMG_1457", "IMG_1460", "IMG_1462", "IMG_1463", "IMG_1464"]
    
    var image_index: Int = 0
    
    let start_image_index: Int = 0
    
    let max_image_index: Int = 4
    
    let timer_interval: Double = 2
    
    var timer: Timer!
    
    var returnImage:UIImage!
    
    @IBOutlet weak var imageArea: UIButton!
    
    @IBOutlet weak var playImageButton: UIButton!
    
    @IBOutlet weak var nextImageButton: UIButton!
    
    @IBOutlet weak var prevImageButton: UIButton!
    
    @IBAction func imageViewer(_ sender: Any) {
    }
    
    @IBAction func prevImage(_ sender: Any) {
        self.prevImageShow()
    }
    
    @IBAction func playImage(_ sender: Any) {
        if self.playImageButton.isSelected {
            self.playImageButton.setTitle("▶", for: UIControlState())
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
            self.playImageButton.isSelected = false
            self.nextImageButton.isEnabled = true
            self.prevImageButton.isEnabled = true
        }
        else {
            self.playImageButton.setTitle("■", for: UIControlState())
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: self.timer_interval, target: self, selector: #selector(nextImageSelector(_:)), userInfo: nil, repeats: true)
            }
            self.playImageButton.isSelected = true
            self.nextImageButton.isEnabled = false
            self.prevImageButton.isEnabled = false
        }
    }
    
    @IBAction func nextImage(_ sender: Any) {
        self.nextImageShow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.playImageButton.isSelected = false
        self.imageArea.setImage(UIImage(named: self.images[self.start_image_index]), for: UIControlState())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let enlargeViewController:EnlargeViewController = segue.destination as! EnlargeViewController
        enlargeViewController.enlargeImage = self.imageArea.currentImage
        enlargeViewController.image_index = self.image_index
    }
    
    @IBAction func returnBack(_ segue: UIStoryboardSegue) {
        self.imageArea.setImage(self.returnImage, for: UIControlState())
    }
    
    @objc func nextImageSelector(_ timer: Timer) {
        self.nextImageShow()
    }
    
    private func nextImageShow() {
        if self.image_index == self.max_image_index {
            self.image_index = self.start_image_index
        }
        else {
            self.image_index += 1
        }
        self.imageArea.setImage(UIImage(named: self.images[self.image_index]), for: UIControlState())
    }
    
    private func prevImageShow() {
        if self.image_index == self.start_image_index {
            self.image_index = self.max_image_index
        }
        else {
            self.image_index -= 1
        }
        self.imageArea.setImage(UIImage(named: self.images[self.image_index]), for: UIControlState())

    }
}

