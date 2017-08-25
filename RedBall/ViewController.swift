//
//  ViewController.swift
//  RedBall
//
//  Created by tongle on 2017/6/12.
//  Copyright © 2017年 tong. All rights reserved.
//

import UIKit

let TLspin = "spin"
let TLmove = "move"
let TLcolor = "color"
let TLscale = "scale"

class ViewController: UIViewController {
    
    let redBall = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
    let scale = POPSpringAnimation(propertyNamed:kPOPViewScaleXY)
    let move = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
    let spin = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
    let color = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
    
 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        redBall.backgroundColor = UIColor.red
        
        self.view.addSubview(redBall)
        
        let array = ["放大","旋转","移动","变色","归位"]
        
        let segmentedControl = UISegmentedControl.init(items:array)
        
        segmentedControl.frame = CGRect(x:50,y:50,width:self.view.frame.size.width-100 ,height:30)
        
        segmentedControl.tintColor = UIColor.green
        
        segmentedControl.backgroundColor = UIColor.red
        
        segmentedControl.addTarget(self, action:#selector(segmentedControlChanged(segmented:)), for: UIControlEvents.valueChanged)
        
        self.view .addSubview(segmentedControl);
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func segmentedControlChanged(segmented : UISegmentedControl) {
        switch segmented.selectedSegmentIndex {
        case 0:
            self.redBallScale()
        case 1:
            self.redBallSpin()
        case 2:
            self.redBallMove()
        case 3:
            self.redBallColor()
        case 4:
            self.OriginRedBall()
        default:
            print("error");
        }
    }
    
    /**
        pop放大，旋转，移动，变色，还原动画
     1. springBounciness: 弹性振幅，范围0-20
     2. springSpeed: 震动速度
     3. pop_add: 加载动画
     **/
    
    func redBallScale()  {
        // 放大动画
        scale?.toValue = NSValue(cgPoint:CGPoint(x: 2, y: 2))
        scale?.springBounciness = 20
        scale?.springSpeed = 1
        redBall.pop_add(scale, forKey: TLscale)
    }
    func redBallSpin()  {
        //旋转动画
        spin?.toValue = Double.pi * 4
        spin?.springBounciness = 20
        spin?.springSpeed = 5
        redBall.layer.pop_add(spin, forKey: TLspin)
        
    }
    func redBallMove()  {
        //y坐标位移动画
        move?.toValue = 500
        move?.springBounciness = 20
        move?.springSpeed = 5
        redBall.layer.pop_add(move, forKey: TLmove)
    }
    func redBallColor()  {
        //背景颜色变化
        color?.toValue = UIColor.green
        color?.springBounciness = 20
        color?.springSpeed = 5
        redBall.pop_add(color, forKey: TLcolor)
        
    }
    func OriginRedBall() {
        //  scale
        scale?.toValue = NSValue(cgPoint:CGPoint(x: 1, y: 1))
        scale?.springBounciness = 20
        scale?.springSpeed = 1
        redBall.pop_add(scale, forKey: TLscale)
        //  move
        move?.toValue = 200
        move?.springBounciness = 20
        move?.springSpeed = 5
        redBall.layer.pop_add(move, forKey: TLmove)
        //  spin
        spin?.toValue = Double.pi * 4
        spin?.springBounciness = 20
        spin?.springSpeed = 5
        redBall.layer.pop_add(spin, forKey: TLspin)
        // color
        color?.springBounciness = 20
        color?.springSpeed = 5
        color?.toValue = UIColor.red
        redBall.pop_add(color, forKey: TLcolor)
    }
    
    

}


