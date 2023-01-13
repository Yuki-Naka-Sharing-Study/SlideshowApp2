//
//  ViewController.swift
//  TestSlideshowApp
//
//  Created by 仲優樹 on 2023/01/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画像を設定
        let sampleImage = UIImage(named: "winter.jpeg")
        image.image = sampleImage
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "NestViewController") as! ViewController

        //ViewControllerのimage(画像データ)をNextViewControllerのimage(変数)に渡す
        nextVC.image = image.image!

        //画面遷移
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func imageViewTapped(_ sender: Any) {
        print("タップ")
    }
}

