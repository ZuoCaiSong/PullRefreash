//
//  RefreshView.swift
//  xiala
//
//  Created by supin－tech on 2017/12/8.
//  Copyright © 2017年 ZhiXin. All rights reserved.
//

import UIKit

private let KSceneHeight:CGFloat = 120.0

class RefreshView: UIView {

    private unowned var scrollView: UIScrollView
    
    private var progress:CGFloat = 0.0
    
    init(frame: CGRect,scrollView: UIScrollView) {
        self.scrollView = scrollView
        super.init(frame: frame)
        
        updateBackgroundColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- 设置背景色
    func updateBackgroundColor(){
        backgroundColor = UIColor(white: 0.7*progress + 0.2, alpha: 1.0) //1是全白，0是全黑
    }
    
    // MARK:-
    func setupRefreshItems(){
        let groundImageView = UIImageView(image: UIImage(named: "ground"))
        let buildingImageView = UIImageView(image:UIImage(named: "building"))
    }
    
    //滚动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 1.先拿到刷新视图可见区域的 高度
        let refreshViewVisibleHeight = max(0,-scrollView.contentOffset.y - scrollView.contentInset.top) //保证是正值
        // 2.计算当前滚动的进度 0 - 1
        progress = min(refreshViewVisibleHeight / KSceneHeight,1) //有可能会超过1
        // 3. 根据进度来改变背景色
        updateBackgroundColor()
    }
    
}
/*
extension RefreshView: UIScrollViewDelegate{
 
    //滚动
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 1.先拿到刷新视图可见区域的 高度
        let refreshViewVisibleHeight = max(0,-scrollView.contentOffset.y - scrollView.contentInset.top) //保证是正值
        // 2.计算当前滚动的进度 0 - 1
        progress = min(refreshViewVisibleHeight / KSceneHeight,1) //有可能会超过1
        // 3. 根据进度来改变背景色
        updateBackgroundColor()
    }
}
 */
