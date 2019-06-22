//
//  pickViewController.swift
//  SlideshowApp
//
//  Created by 日向亮博 on 2019/06/22.
//  Copyright © 2019 Hinata10. All rights reserved.
//

import UIKit

class pickViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var imageNo = 0
    let imageNameArray = [
    "IMG_0966", "fukuro", "jeans", "canon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: imageNameArray[imageNo])
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
