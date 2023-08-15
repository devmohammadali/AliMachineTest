//
//  HomeViewController.swift
//  AliMachineTest
//
//  Created by Apple on 10/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var crossButton: UIButton!
    
    @IBOutlet weak var CollectionViewContainer: UIView!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var readMoreLabel: UILabel!
    @IBOutlet weak var imageView: UIView!
    
    @IBOutlet weak var imageLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var contentViewOne: UIView!
    @IBOutlet weak var contentViewTwo: UIView!
    
    @IBOutlet weak var collectionViewOne: UIView!
    @IBOutlet weak var collectionViewTwo: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    @IBAction func confrimButtonAction(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmViewController") as! ConfirmViewController
        secondViewController.modalPresentationStyle = .overFullScreen
        present(secondViewController, animated: true)
    }
 //MARK: - Basic Functions
    
    fileprivate func setup(){
        self.readMoreLabel.alpha = 0
        self.crossButton.alpha = 0
        self.discriptionLabel.alpha = 0
        self.CollectionViewContainer.alpha = 0
        contentViewOne.addTapGestureRecognizer { [weak self] action in
            self?.contentViewOne.isHidden = true
            self?.contentViewTwo.isHidden = true
            self?.setConstraint()
            UIView.transition(with: self!.view, duration: 0.3, options: .curveLinear, animations: {
                self?.view.layoutIfNeeded()
            }) { _ in
                self?.showDetailContent()
            }
        }
    }
    
//MARK: - Showing Content Details
    
    func showDetailContent(){
        UIView.transition(with: self.view, duration: 0.4, options: .curveLinear, animations: {
            self.readMoreLabel.alpha = 1
            self.discriptionLabel.alpha = 1
            self.CollectionViewContainer.alpha = 1
            self.setCollectionViewConstraint()
        })
    }
    
//MARK: - Functions of Constraints
    
    func setConstraint(){
        
        self.titleLabel.text = "CANDY BUST"
        
        let topConstraint = self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: imageView.topAnchor,constant: -20)
        let leadingConstraint = self.view.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -20)
        
        let topConstraintLabel = self.imageView.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: -10)
        
        let leadingConstraintLabel = self.imageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -20)
        
        let bottomConstraintButton = self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: actionButton.bottomAnchor,constant: 20)
        let leadingConstraintButton = self.view.leadingAnchor.constraint(equalTo: actionButton.leadingAnchor,constant: -20)
        let trailingConstraintButton = self.view.trailingAnchor.constraint(equalTo: actionButton.trailingAnchor,constant: 20)
        NSLayoutConstraint.activate([topConstraint, leadingConstraint,trailingConstraintButton,leadingConstraintButton,bottomConstraintButton, topConstraintLabel, leadingConstraintLabel])
    }
    
    
    func setCollectionViewConstraint(){
        self.crossButton.alpha = 1
        
        let topConstraintCross = self.imageView.topAnchor.constraint(equalTo: crossButton.topAnchor,constant: -10)
        
        let leadingConstraint = self.view.leadingAnchor.constraint(equalTo: collectionViewOne.leadingAnchor, constant: 00)
        
        let leadingConstraintCollectionViewTwo = self.collectionViewOne.trailingAnchor.constraint(equalTo: collectionViewTwo.leadingAnchor, constant: -20)
        
        NSLayoutConstraint.activate([leadingConstraint,leadingConstraintCollectionViewTwo,topConstraintCross])
        UIView.transition(with: self.view, duration: 0.4, options: .curveLinear, animations: {
            self.view.layoutIfNeeded()
        })
    }
}


/*
 
 UIView.animate(withDuration: 0.2, delay: 0,
                  options: [.curveEaseInOut],
                  animations: {
   contentViewBottomConstraint.constant = 10
                   self.view.layoutIfNeeded()
   })

 UIView.transition(with: self.view, duration: 0.2, options: .curveLinear, animations: {
       self.view.layoutIfNeeded()
   })
 
 */
/*
extension PaymentReviewViewController:setConstraintsProtocol {
  @objc func potentialInfoButtonAction(){
    self.mPratical.logScreenEvent(MParticleScreenEvent.paymentBillSummaryPotentialEarningKnowMoreClicked.event, eventDescription: MParticleScreenEvent.paymentBillSummaryPotentialEarningKnowMoreClicked.eventDescription, eventType: MParticleScreenEvent.paymentBillSummaryPotentialEarningKnowMoreClicked.eventType, objectType: MParticleScreenEvent.paymentBillSummaryPotentialEarningKnowMoreClicked.objectType)
    
    if self.potentialEarnDetailView.isHidden{
      self.showPotentialEarnDetailView()
    }else{
      self.hidePotentialEarnDetailView()
    }
    if !self.serviceFeeDetailView.isHidden{
      self.hideServiceFeeDetailView()
    }
  }
  
  
  @objc func feeInfoButtonAction(){
    self.mPratical.logScreenEvent(MParticleScreenEvent.paymentBillSummaryFeesKnowMoreClicked.event, eventDescription: MParticleScreenEvent.paymentBillSummaryFeesKnowMoreClicked.eventDescription, eventType: MParticleScreenEvent.paymentBillSummaryFeesKnowMoreClicked.eventType, objectType: MParticleScreenEvent.paymentBillSummaryFeesKnowMoreClicked.objectType)
    if !self.potentialEarnDetailView.isHidden{
      self.hidePotentialEarnDetailView()
    }
    
    if self.serviceFeeDetailView.isHidden{
      self.showServiceFeeDetailView()
    }else{
      self.hideServiceFeeDetailView()
    }
  }
  
  func setServiceFeeConstraint(_ imageView: UIImageView) {
    let topConstraint = self.serviceFeeDetailView.bottomAnchor.constraint(equalTo: imageView.topAnchor,constant: 3)
    let leadingConstraint = self.serviceFeeDetailView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20)
    NSLayoutConstraint.activate([topConstraint, leadingConstraint])
  }
  
  func setPotentialConstraint(_ imageView: UIImageView) {
    let bottomConstraint = self.potentialEarnDetailView.bottomAnchor.constraint(equalTo: imageView.topAnchor,constant: 1)
    let trailingConstraint = self.potentialEarnDetailView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20)
    NSLayoutConstraint.activate([bottomConstraint, trailingConstraint])
  }
  
  func animationSize(fromValue: CGSize, toValue: CGSize, animateView: UIView, duration: Double = 1){
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
  
  func animationPosition(fromValue: CGPoint, toValue: CGPoint, animateView: UIView, duration: Double = 1, completionBlock: @escaping (() -> Void)){
    CATransaction.begin()
    CATransaction.setCompletionBlock({
      completionBlock()
    })
    let animation = CABasicAnimation(keyPath: "position")
    animation.fromValue = fromValue
    animation.toValue = toValue
    animation.duration = duration
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.beginTime = CACurrentMediaTime()
    animateView.layer.add(animation, forKey: nil)
    CATransaction.commit()
  }
  
  func hideServiceFeeDetailView(){
    self.animationSize(fromValue: self.serviceFeeDetailView.frame.size, toValue: CGSize(), animateView: self.serviceFeeDetailView,duration: 0.2)
    
    self.animationPosition(fromValue: self.serviceFeeDetailView.center, toValue: CGPoint(x: self.serviceFeeDetailView.center.x - (self.serviceFeeDetailView.frame.width/2), y: self.serviceFeeDetailView.center.y + (self.serviceFeeDetailView.frame.height/2)), animateView: self.serviceFeeDetailView,duration: 0.2) {
      self.serviceFeeDetailView.isHidden = true
      self.billSummeryTableView.reloadData()
    }
  }
  
  func hidePotentialEarnDetailView(){
    self.animationSize(fromValue: self.potentialEarnDetailView.frame.size, toValue: CGSize(), animateView: self.potentialEarnDetailView,duration: 0.2)
    self.animationPosition(fromValue: self.potentialEarnDetailView.center, toValue: CGPoint(x: self.potentialEarnDetailView.center.x + (self.potentialEarnDetailView.frame.width/2), y: self.potentialEarnDetailView.center.y + (self.potentialEarnDetailView.frame.height/2)), animateView: self.potentialEarnDetailView,duration: 0.2) {
      self.potentialEarnDetailView.isHidden = true
      self.billSummeryTableView.reloadData()
    }
  }
  
  func showServiceFeeDetailView(){
    self.serviceFeeDetailView.isHidden = false
    self.animationSize(fromValue: CGSize(), toValue: self.serviceFeeDetailView.frame.size, animateView: self.serviceFeeDetailView,duration: 0.2)
    
    self.animationPosition(fromValue: CGPoint(x: self.serviceFeeDetailView.center.x - (self.serviceFeeDetailView.frame.width/2), y: self.serviceFeeDetailView.center.y + (self.serviceFeeDetailView.frame.height/2)), toValue: self.serviceFeeDetailView.center, animateView: self.serviceFeeDetailView,duration: 0.2) {
      self.billSummeryTableView.reloadData()
    }
  }
  
  func showPotentialEarnDetailView(){
    self.potentialEarnDetailView.isHidden = false
    self.animationSize(fromValue: CGSize(), toValue: self.potentialEarnDetailView.frame.size, animateView: self.potentialEarnDetailView,duration: 0.2)
    self.animationPosition(fromValue: CGPoint(x: self.potentialEarnDetailView.center.x + (self.potentialEarnDetailView.frame.width/2), y: self.potentialEarnDetailView.center.y + (self.potentialEarnDetailView.frame.height/2)), toValue: self.potentialEarnDetailView.center, animateView: self.potentialEarnDetailView,duration: 0.2) {
      self.billSummeryTableView.reloadData()
    }
  }
}
*/
