//
//  ViewController.swift
//  SampleSwift2017
//
//  Created by Windy on 2017/7/3.
//  Copyright © 2017年 Windy. All rights reserved.
//

import UIKit

private let cellID = "CellID"
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        
        
        layoutUI()
    }
}

private typealias LayoutUI = ViewController // typealias 用为您的扩展取个好听的名字
extension LayoutUI{
    func layoutUI(){
        
        let tableView = UITableView(frame: view.bounds, style: .grouped);
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(tableView)
    }
}

private typealias TableViewDataSource = ViewController
extension TableViewDataSource : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = "\(indexPath.row)"
        
//        guard #available(iOS 9, *) else { return nil }
        
        
        if #available(iOS 9.0, *) {
            cell?.textLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.callout)
        } else {
            cell?.textLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        }
        
        
        
        return cell!
    }

}



