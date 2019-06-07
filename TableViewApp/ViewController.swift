//
//  ViewController.swift
//  TableViewApp
//
//  Created by 西谷恭紀 on 2019/06/05.
//  Copyright © 2019 西谷恭紀. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    var resultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableViewをコーディングする際に必須
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /*
    viewDidLoadは1回しか呼ばれないので
    viewWillAppearで画面に戻ってきた際に再実行する
    */
    override func viewWillAppear(_ animated: Bool) {
        let cellRow = UserDefaults.standard.object(forKey: "row")!
        super.viewWillAppear(animated)
        
        //nilの可能性があるのでそれを許容する
        if UserDefaults.standard.object(forKey: "memo\(cellRow)") != nil {
            //文字列が入った配列であることを明記
            resultArray = UserDefaults.standard.object(forKey: "memo\(cellRow)") as! [String]
            
        }
        
        //Cellが作られるたり､画面に戻った際に再度デリゲートメソッドが呼ばれる
        tableView.reloadData()
        
    }
    
    //配列の中身分だけCellを返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath )
        
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }
    
    //Cellの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //EditingStyleデリートだったら配列のセルのスライドされた番号を消去
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let cellRow = UserDefaults.standard.object(forKey: "row")!
        //もしeditingStyleが配列のCellのスライドされた番号を消去する
        if editingStyle == .delete{
        //indexPath.rowで認識された場所と同じ場所で削除の処理が実行する
            resultArray.remove(at: indexPath.row)
            //消去したことを保存
            UserDefaults.standard.set(resultArray, forKey: "memo\(cellRow)")
            //tetableViewの更新
            tableView.reloadData()
        }
        
        
    }
    
    
}

