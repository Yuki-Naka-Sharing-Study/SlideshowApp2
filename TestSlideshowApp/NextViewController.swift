//
//  NextViewController.swift
//  TestSlideshowApp
//
//  Created by 仲優樹 on 2023/01/13.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var imageView2: UIImageView!

    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //遷移元から取得したimage(画像データ)をimageView2のimageに渡す
        imageView2.image = image
        
    }
    
    @IBAction func BackHome(_ sender: Any) {
        print("タップ")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        //NextViewControllerのimage(画像データ)をViewControllerのimage(変数)に渡す
        nextVC.image = imageView2.image!
        
        //画面遷移
        present(nextVC, animated: true, completion: nil)
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
