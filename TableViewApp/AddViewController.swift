//
//  AddViewController.swift
//  TableViewApp
//
//  Created by 西谷恭紀 on 2019/06/05.
//  Copyright © 2019 西谷恭紀. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self

    }
    @IBAction func addText(_ sender: UIButton) {
        let cellRow = UserDefaults.standard.object(forKey: "row")!
        // create the alert
        let alert = UIAlertController(title: "Error", message: "文字を入力して下さい｡", preferredStyle: UIAlertController.Style.alert)
        
        switch textField.text {
        case "":
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
            break
        default:
            //現在の配列を取り出す
            if (UserDefaults.standard.object(forKey: "memo\(cellRow)") != nil) {
                //arrayの中に保存するデータがString型であることを明記する
                array = UserDefaults.standard.object(forKey: "memo\(cellRow)") as! [String]
                //arrayの中にtextFieldのtextプロパティを追加する
                array.append(textField.text!)
                //保存が完了
                UserDefaults.standard.set(array, forKey: "memo\(cellRow)")
            }
        }
        
        /*
        if (textField.text == String("")) {
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
            
            }
        */
        
        
        
        
        
        //追加ボタンを押した際に1つ前の画面に遷移させる
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //上の方でUITextFieldDelegateと書いた時点で使えるようになるデリゲートメソッド
    //return key が押されたタイミングでキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //return key が押されたタイミングでキーボードを閉じる
        textField.resignFirstResponder()
        return true
    }

}
