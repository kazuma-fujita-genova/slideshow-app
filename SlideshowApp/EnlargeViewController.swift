//
//  EnlargeViewController.swift
//  SlideshowApp
//
//  Created by 藤田和磨 on 2018/10/02.
//  Copyright © 2018年 藤田和磨. All rights reserved.
//

import UIKit

class EnlargeViewController: UIViewController {

    @IBOutlet weak var enlargeImageView: UIImageView!
    
    var enlargeImage:UIImage!
    
    var image_index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.enlargeImageView.image = self.enlargeImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController:ViewController = segue.destination as! ViewController
        viewController.returnImage = self.enlargeImage
        viewController.image_index = self.image_index
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
