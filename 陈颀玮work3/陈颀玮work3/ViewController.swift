//
//  ViewController.swift
//  陈颀玮work3
//
//  Created by 陈颀玮 on 2019/5/28.
//  Copyright © 2019 陈颀玮. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var months = ["january","februar","march","April","May","June","July","august","September","October","November","December"]
    var monthsCN = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]

    fileprivate func addImageView() {
        let image = UIImage(named: "pic1")
        let imgView = UIImageView(image: image)
        self.view.addSubview(imgView)
    }//一个插入图片的方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //addImageView()//调用添加图片方法
        
        let rect1 = CGRect(x: 0,y: 40,width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        let tableView = UITableView(frame: rect1)
        tableView.backgroundColor = UIColor.brown
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)//表格cell的设定

        UIApplication.shared.isNetworkActivityIndicatorVisible = true//应用运行时在状态栏的顶部显示风火轮
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthsCN.count
    }//cell的个数
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }//单个cell的高度
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
        if(cell == nil)
        {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
            }
            let rowNum = (indexPath as NSIndexPath).row
            cell?.textLabel?.text = monthsCN[rowNum]
            cell?.detailTextLabel?.text = months[rowNum]
            
            let yqcr = UIImage(named: "yqcr")
            let yqcrGray = UIImage(named: "yqcrGray")
            
            cell?.imageView?.image = yqcrGray
            cell?.imageView?.highlightedImage = yqcr
            
            
            return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == UITableViewCell.AccessoryType.none {
            cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        else{
            cell?.accessoryType = UITableViewCell.AccessoryType.none
        }
    }//cell的选中和非选中时的状态
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }//定义cell的编辑方式为删除模式
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            let rowNum = (indexPath as NSIndexPath).row
            monthsCN.remove(at: rowNum)
            
            let indexPaths = [indexPath]
            tableView.deleteRows(at: indexPaths, with: UITableView.RowAnimation.automatic)
        }
    }//此方法用来响应删除模式
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

