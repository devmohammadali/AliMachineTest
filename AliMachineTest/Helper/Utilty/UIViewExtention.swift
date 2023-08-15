//
//  UIViewExtention.swift
//  AliMachineTest
//
//  Created by Apple on 10/08/23.
//

import UIKit

extension UIView {

  @IBInspectable var cornerRadius: CGFloat {

   get{
        return layer.cornerRadius
    }
    set {
        layer.cornerRadius = newValue
        layer.masksToBounds = newValue > 0
    }
  }

  @IBInspectable var borderWidth: CGFloat {
    get {
        return layer.borderWidth
    }
    set {
        layer.borderWidth = newValue
    }
  }

  @IBInspectable var borderColor: UIColor? {
    get {
        return UIColor(cgColor: layer.borderColor!)
    }
    set {
        layer.borderColor = newValue?.cgColor
    }
  }
}


// MARK: - Tap Gesture
extension UIView: Thread{
  public func addTapGestureRecognizer(action: Action?) {
    runOnMainThread {
      self.isUserInteractionEnabled = true
      self.tapGestureRecognizerAction = action
      let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture))
      self.addGestureRecognizer(tapGestureRecognizer)
    }
  }
  
  @objc private func handleTapGesture(sender: UITapGestureRecognizer) {
    if let action = tapGestureRecognizerAction {
      action?(sender)
    }
  }
  
  public func addLongPressGestureRecognizer(action: LongAction?) {
    runOnMainThread {
      self.isUserInteractionEnabled = true
      self.longPressGestureRecognizerAction = action
      let tapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPressGesture))
      self.addGestureRecognizer(tapGestureRecognizer)
    }
  }
  
  @objc private func handleLongPressGesture(sender: UILongPressGestureRecognizer) {
    if let action = longPressGestureRecognizerAction {
      action?(sender)
    }
  }
  
  public typealias Action = ((UITapGestureRecognizer) -> Void)?
  private var tapGestureRecognizerAction: Action? {
    set(value) {
      if let newValue = value {
        objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
      }
    }
    get {
      let tapGesture = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
      return tapGesture
    }
  }
  
  public typealias LongAction = ((UILongPressGestureRecognizer) -> Void)?
  private var longPressGestureRecognizerAction: LongAction? {
    set(value) {
      if let newValue = value {
        objc_setAssociatedObject(self, &AssociatedObjectKeys.longPressGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
      }
    }
    get {
      let longPressGesture = objc_getAssociatedObject(self, &AssociatedObjectKeys.longPressGestureRecognizer) as? LongAction
      return longPressGesture
    }
  }
  
  private struct AssociatedObjectKeys {
      static var tapGestureRecognizer = "tapGesture"
    static var longPressGestureRecognizer = "longPressGesture"
  }
}

protocol Thread {
    func runOnMainThread(_ closure: @escaping () -> Void)
    func delay(_ delay: Double, closure: @escaping () -> Void)
}

extension Thread {
  func runOnMainThread(_ closure: @escaping () -> Void) {
    DispatchQueue.main.async(execute: closure)
  }
  
  func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
      deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
  }
}
