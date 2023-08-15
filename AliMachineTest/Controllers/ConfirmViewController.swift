//
//  ConfirmViewController.swift
//  AliMachineTest
//
//  Created by Apple on 11/08/23.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var nameStack: UIStackView!
    @IBOutlet weak var subNameStack: UIStackView!
    @IBOutlet weak var imageStack: UIStackView!
    @IBOutlet weak var titleView: UIView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animationSize(fromValue: CGSize(), toValue: titleView.frame.size, animateView: self.titleView)
        self.animationPosition(fromValue: CGPoint(x: self.view.frame.width, y: imageStack.center.y), toValue: imageStack.center, animateView: imageStack,duration: 1)
        self.animationPosition(fromValue: CGPoint(x: self.view.frame.width, y: subNameStack.center.y), toValue: subNameStack.center, animateView: subNameStack,duration: 1.5)
        self.animationPosition(fromValue: CGPoint(x: self.view.frame.width, y: nameStack.center.y), toValue: nameStack.center, animateView: nameStack,duration: 1.8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subNameStack.alpha = 0
        nameStack.alpha = 0
        imageStack.alpha = 0
        titleView.alpha = 0
    }
    
    @IBAction func dismissButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
//MARK: - Functions of Animations
    
    func animationSize(fromValue: CGSize, toValue: CGSize, animateView: UIView, duration: Double = 1){
        animateView.alpha = 1
        let animation = CABasicAnimation(keyPath: "bounds.size")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animateView.layer.add(animation, forKey: nil)
    }
    
    func animationPosition(fromValue: CGPoint, toValue: CGPoint, animateView: UIView, duration: Double = 1){
        animateView.alpha = 1
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animateView.layer.add(animation, forKey: nil)
    }
}
