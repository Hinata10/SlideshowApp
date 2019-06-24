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
//        if self.timer != nil{
//            let tar = sender as! UIButton
//            tar.isEnabled = false
//        }
        susumu.isEnabled = true
        imageNo += 1
        if imageNo > 3{
            imageNo = 0
        }
        slideView.image = UIImage(named: imageNameArray[imageNo])
    }
    @IBOutlet weak var susumu: UIButton!
    @IBAction func modoru(_ sender: Any) {
        modoru.isEnabled = true
        imageNo -= 1
        if imageNo < 0{
            imageNo = 3
        }
        slideView.image = UIImage(named: imageNameArray[imageNo])
    }
    @IBOutlet weak var modoru: UIButton!
    //画像につける番号と画像データ配列を宣言する。
    var imageNo = 0
    let imageNameArray = [
        "IMG_0966", "fukuro", "jeans", "canon"]
    //タイマー
    var timer: Timer!
    //タイマー用の時間の変数
    var timer_sec: Float = 0
    //スライドショーの進行
    @objc func updateTimer(_ timer: Timer){
        if imageNo > 2{
            imageNo = 0
        }else{
            imageNo += 1
        }
        slideView.image = UIImage(named: imageNameArray[imageNo])
    }
    var isPlaying = false
    //再生停止ボタン
    @IBAction func saiseiteishi(_ sender: Any) {
        //上記の文のみだと押したら押しただけタイマーが作動し、複数のタイマーが存在してしまう。
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            //動作中のタイマーを一つに限定するためnilの時だけタイマーが動くようにする。
            susumu.isEnabled = false
            modoru.isEnabled = false
        }else if timer != nil{
            self.timer.invalidate()  //タイマーを停止するメソッド
            self.timer = nil  //timer == nilで認識できるようnilにしておく。
            self.timer_sec = 0  //一応ゼロにしとく。
            susumu.isEnabled = true
            modoru.isEnabled = true
        }
    }
    //prepareを使って画像を渡す。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let Pick:pickViewController = segue.destination as! pickViewController
        //imageNoだけでどの画像かを渡す事ができるので、
        //遷移元のimageNoと遷移先のimageNoをPickとしてリンクさせる。
        Pick.imageNo = imageNo
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slideView.image = UIImage(named: imageNameArray[imageNo])
        
    }
    @IBAction func back(_ segue: UIStoryboardSegue){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

