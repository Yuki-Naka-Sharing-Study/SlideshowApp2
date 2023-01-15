//
//  ViewController.swift
//  TestSlideshowApp
//
//  Created by 仲優樹 on 2023/01/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画像を設定
        let sampleImage = UIImage(named: "winter.jpeg")
        imageView.image = sampleImage
    }
    
    @IBAction func imageViewTapped(_ sender: Any) {
        print("タップ")

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        //ViewControllerのimage(画像データ)をNextViewControllerのimage(変数)に渡す
        nextVC.image = imageView.image!
        
        //画面遷移
        present(nextVC, animated: true, completion: nil)
    }
    
    // outletの接続
        @IBOutlet weak var startButton: UIButton!
        @IBOutlet weak var imageView: UIImageView!

        // 配列に指定するindex番号を宣言
        var nowIndex:Int = 0

        // スライドショーに使用するタイマーを宣言
        var timer: Timer!

        // スライドショーさせる画像の配列を宣言
        var imageArray:[UIImage] = [
            UIImage(named: "winter.jpeg")!,
            UIImage(named: "spring.jpeg")!,
            UIImage(named: "summer.jpeg")!
        ]
    
    // 再生ボタンを押した時の処理
        @IBAction func slideShowButton(_ sender: Any) {
            // 再生中か停止しているかを判定
            if (timer == nil) {
                // 再生時の処理を実装

                // タイマーをセットする
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

                // ボタンの名前を停止に変える
                startButton.setTitle("停止", for: .normal)

            } else {
                // 停止時の処理を実装
                // タイマーを停止する
                timer.invalidate()

                // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
                timer = nil

                // ボタンの名前を再生に直しておく
                startButton.setTitle("停止", for: .normal)
            }
            
        }
    
    @objc func changeImage() {
            // indexを増やして表示する画像を切り替える
            nowIndex += 1

            // indexが表示予定の画像の数と同じ場合
            if (nowIndex == imageArray.count) {
                // indexを一番最初の数字に戻す
                nowIndex = 0
            }
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
        }
    
}
