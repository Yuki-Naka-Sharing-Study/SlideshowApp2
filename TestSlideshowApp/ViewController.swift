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
    }
    
    @IBAction func imageViewTapped(_ sender: Any) {
        print("タップ")
        
        // 画像を設定
        let sampleImage = UIImage(named: "winter.jpeg")
        imageView.image = sampleImage
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController

        //ViewControllerのimage(画像データ)をNextViewControllerのimage(変数)に渡す
        nextVC.imageView = imageView.image!
        
        //画面遷移
        present(nextVC, animated: true, completion: nil)
    }
}

