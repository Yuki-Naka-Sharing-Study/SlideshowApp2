//
//  ViewController.swift
//  TestSlideshowApp
//
//  Created by 仲優樹 on 2023/01/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func Back(sender: AnyObject) {

      // 表示している画像の番号を1減らす
      dispImageNo -= 1

      // 表示している画像の番号を元に画像を表示する
      displayImage()
        
    }

    @IBAction func Go(sender: AnyObject) {

      // 表示している画像の番号を1増やす
      dispImageNo += 1

      // 表示している画像の番号を元に画像を表示する
      displayImage()
        
    }

    /// 表示している画像の番号
    var dispImageNo = 0

    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {

        // 画像の名前の配列
        let imageNameArray = [
            "winter.jpeg",
            "spring.jpeg",
            "summer.jpeg",
        ]
        
        // 画像の番号が正常な範囲を指しているかチェック

        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }

        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]

        // 画像を読み込み
        let image = UIImage(named: name)

        // Image Viewに読み込んだ画像をセット
        imageView.image = image
            
    }
    
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
        @IBOutlet weak var playbackStopButton: UIButton!
    
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
    
    // 再生/停止ボタンを押した時の処理
        @IBAction func slideShowButton(_ sender: Any) {
            // 再生中か停止しているかを判定
            if (timer == nil) {
                // 再生時の処理を実装

                // タイマーをセットする
                timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

                // ボタンの名前を「停止」にする
                playbackStopButton.setTitle("停止", for: .normal)

            } else {
                // 停止時の処理を実装
                // タイマーを停止する
                timer.invalidate()

                // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
                timer = nil

                // ボタンの名前を「再生」にする
                playbackStopButton.setTitle("再生", for: .normal)
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
