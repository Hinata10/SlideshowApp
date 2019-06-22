//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 日向亮博 on 2019/06/22.
//  Copyright © 2019 Hinata10. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideView: UIImageView!
//    @IBAction func kakudai(_ sender: Any) {
//        performSegue(withIdentifier: "kakudai", sender: nil)
//    }
    @IBAction func kakudai(_ sender: Any) {
        performSegue(withIdentifier: "kakudai", sender: nil)
    }
    
    @IBAction func susumu(_ sender: Any) {
        imageNo += 1
        if imageNo > 3{
            imageNo = 0
        }
        slideView.image = UIImage(named: imageNameArray[imageNo])
    }
    @IBAction func modoru(_ sender: Any) {
        imageNo -= 1
        if imageNo < 0{
            imageNo = 3
        }
        slideView.image = UIImage(named: imageNameArray[imageNo])
    }
   //画像につける番号と画像データ配列を宣言する。
    var imageNo = 0
    let imageNameArray = [
        "IMG_0966", "fukuro", "jeans", "canon"]
    //タイマー
    var timer: Timer!
    //タイマー用の時間の変数
    var timer_sec: Float = 0
    //
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 2.0
    }
    //再生停止ボタン
    @IBAction func saiseiteishi(_ sender: Any) {
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        imageNo += 1
        if imageNo < 3{
            imageNo = 0
        }
        slideView.image = UIImage(named: imageNameArray[imageNo])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //        if segue.identifier == "kakudai"{
        //            let pickViewController:PickViewController = segue.destination as! PickViewController
        ////            NextViewController.xy = textfield.text!
        //            pickViewController.img = slideView.image!
        //        }
        let Pick:pickViewController = segue.destination as! pickViewController
        //imageNoだけでどの画像かを渡す事ができるので、
        //遷移元のimageNoと遷移先のimageNoをPickとしてリンクさせる。
        Pick.imageNo = imageNo
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slideView.image = UIImage(named: imageNameArray[imageNo])
        //        timer = Timer.scheduledTimer(withTimeInterval: 1.0, selector: ////#selector(onTimer(_timer: Timer)), userInfo: nil, repeats: true)
    }
    @IBAction func back(_ segue: UIStoryboardSegue){
        
    }
    //    @objc func onTimer(_timer: Timer){
    //        print("Timer")
    //        imageNo += 1
    //        displayImage()
    //    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

