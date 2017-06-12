//
//  ViewController.swift
//  RedBall
//
//  Created by tongle on 2017/6/12.
//  Copyright © 2017年 tong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建小红球
        let redBall = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        redBall.backgroundColor = UIColor.red
        //        redBall.layer.cornerRadius = 50
        self.view.addSubview(redBall)
        
        // 实例化一个POP
        let scale = POPSpringAnimation(propertyNamed:kPOPViewScaleXY)
        //设置结束时的值
        scale?.toValue = NSValue(cgPoint:CGPoint(x: 2, y: 2))
        //设置弹性、振幅，范围0-20
        scale?.springBounciness = 20
        //设置震动速度
        scale?.springSpeed = 1
        //给View加入动画
        redBall.pop_add(scale, forKey: "tongle")
        
        //y坐标位移动画
        let move = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        move?.toValue = 500
        move?.springBounciness = 20
        move?.springSpeed = 5
        //给layer加入动画
        redBall.layer.pop_add(move, forKey: "move")
        
        //旋转动画
        let spin = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
        spin?.toValue = Double.pi * 4
        spin?.springBounciness = 20
        spin?.springSpeed = 5
        //给layer加入动画
        redBall.layer.pop_add(spin, forKey: "spin")
        
        //背景颜色变化
        let color = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
        color?.toValue = UIColor.green
        color?.springBounciness = 20
        color?.springSpeed = 5
        //给view加入背景颜色变化动画
        redBall.pop_add(color, forKey: "color")
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

