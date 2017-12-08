//
//  RefeashTableViewController.swift
//  xiala
//
//  Created by supin－tech on 2017/12/8.
//  Copyright © 2017年 ZhiXin. All rights reserved.
//

import UIKit

private let kRefeshViewH:CGFloat = 200

class RefeashTableViewController: UITableViewController {
    
    private var refreshView:RefreshView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshView = RefreshView(frame: CGRect(x:0, y:-kRefeshViewH, width:view.bounds.width, height:kRefeshViewH), scrollView: tableView)
        view.insertSubview(refreshView, at: 0)//放到tabView的下面
    }

    //滚动
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        refreshView.scrollViewDidScroll(scrollView)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return 20
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
   

   
}
