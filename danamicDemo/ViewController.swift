//
//  ViewController.swift
//  danamicDemo
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 wenwen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //背景视图，用来承载内容
    @IBOutlet weak var backView: UIView!
    //懒加载定义一个dynamic对象
    lazy var animator = UIDynamicAnimator(referenceView: self.backView)
    //i定义物理行为
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //给物理动画对象添加行为
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        //应该是碰撞底部反弹的意思
        collision.translatesReferenceBoundsIntoBoundary = true
    }
    @IBAction func Add(_ sender: Any) {
//        生成label
        let width = Int(backView.bounds.width/10)
        let randx = Int(arc4random()%10)*width
        let label=UILabel(frame: CGRect(x: randx, y: 20, width: width, height: width))
        label.backgroundColor=UIColor.red;
        label.text="A"
        label.textAlignment = .center
        
        

        backView.addSubview(label)
//        添加重力和碰撞
        gravity.addItem(label)
        collision.addItem(label)
    }
    @IBAction func Up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    @IBAction func Down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    @IBAction func Left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    @IBAction func Right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    @IBAction func Delete(_ sender: Any) {
        for item in backView.subviews{
            if item is UILabel{
                item.removeFromSuperview()
                
                gravity.removeItem(item)
                collision.removeItem(item)
            }
        }
    }
    

}

