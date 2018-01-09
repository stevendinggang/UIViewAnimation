//
//  ViewController.swift
//  CoreAnimation
//
//  Created by 开心粮票 on 2018/1/9.
//  Copyright © 2018年 eeee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var boxView: UIView?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addUIView()

        let button = UIButton(frame: CGRect(x: 10, y: 344, width: 200, height: 44)
        )
        button.backgroundColor = UIColor.red
        button.setTitle("恢复", for:UIControlState.normal) //普通状态下的文字
        button .addTarget(self, action: #selector(addBoxAnimationContinue), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)

        let buttonx = UIButton(frame: CGRect(x: 10, y: 300, width: 200, height: 44)
        )
        buttonx.backgroundColor = UIColor.red
        buttonx.setTitle("暂停", for:UIControlState.normal) //普通状态下的文字
        buttonx .addTarget(self, action: #selector(addBoxStop), for: UIControlEvents.touchUpInside)
        self.view.addSubview(buttonx)
    }


    func addUIView() {
        let view = UIView.init(frame: CGRect(x: 0, y: 12, width: 100, height: 100)
)

        view.backgroundColor  = UIColor.blue
        self.view.addSubview(view)
        self.boxView = view
        UIView.animate(withDuration: 2) {
            view.frame = CGRect(x: 300, y: 300, width: 100, height: 100)
            view.backgroundColor = UIColor.red
        }

    }

    //MARK -
    @objc func addBoxStop() {
        if let view =  self.boxView {
            let time = view.layer.convertTime(CACurrentMediaTime(), from: nil)
            view.layer.speed = 0
            view.layer.timeOffset = time
        }
    }

    //MARK -
    @objc func addBoxAnimationContinue() {
        if let view =  self.boxView {
            let pauseTime = view.layer.timeOffset
            view.layer.speed = 1
            view.layer.timeOffset = 0
            view.layer.beginTime = 0
            let continueTime = view.layer.convertTime(CACurrentMediaTime(), from: view.layer)

            let timespace = continueTime - pauseTime
            view.layer.beginTime = timespace
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

