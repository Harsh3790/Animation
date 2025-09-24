//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Paras Technologies on 23/09/25.
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var view_box:UIView!
//    @IBOutlet weak var view_box_width: NSLayoutConstraint!
//    @IBOutlet weak var view_box_height: NSLayoutConstraint!
//    var animator: UIViewPropertyAnimator!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let slider = UISlider()
//        slider.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(slider)
//
//        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        slider.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        let redBox = UIView(frame: CGRect(x: -64, y: 0, width: 128, height: 128))
//        redBox.translatesAutoresizingMaskIntoConstraints = false
//        redBox.backgroundColor = UIColor.red
//        redBox.center.y = view.center.y
//        view.addSubview(redBox)
//        animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) { [unowned self, redBox] in
//            redBox.center.x = self.view.frame.width
//            redBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
//            
//        }
//        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
//    }
//    @objc func sliderChanged(_ sender: UISlider) {
//        animator.fractionComplete = CGFloat(sender.value)
//        animator.addAnimations {
//            redBox.backgroundColor = .green
//        }
//    }
//    
//    @IBAction func animateView(_ sender : UIButton){
////        view_box_width.constant += 100
////        view_box_height.constant += 100
//        UIView.animateKeyframes(withDuration: 4, delay: 0, animations: {
//            
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
//                self.view_box.backgroundColor = .magenta
//            })
//            
//            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
//                self.view_box.alpha = 0.5
//            })
//            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
//                self.view_box.center.x = self.view.bounds.width - 100
//            })
//            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
//                self.view_box.center.x = self.view.bounds.width - 200
//            })
//        })
//    }
//}
//    
import UIKit


class ViewController: UIViewController {
    var animator: UIViewPropertyAnimator!
    let box = UIView(frame: CGRect(x: 50, y: 200, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Add red box
        box.backgroundColor = .red
        view.addSubview(box)

        // Step 1: First animation (move to right)
        animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut) {
            self.box.center.x += 200
        }

        // Step 2: When first animation completes → run next
        animator.addCompletion { position in
            if position == .end {
                // Second animation: change color
                let secondAnimator = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut) {
                    self.box.backgroundColor = .blue
                }
                secondAnimator.addCompletion { _ in
                    // Third animation: rotate
                    UIViewPropertyAnimator.runningPropertyAnimator(
                        withDuration: 1.0,
                        delay: 0,
                        options: [],
                        animations: {
                            self.box.transform = CGAffineTransform(rotationAngle: .pi/2)
                        }
                    )
                }
                secondAnimator.startAnimation()
            }
        }

        // Start the first animation
        animator.startAnimation()
    }
    @IBAction func animateView(_ sender : UIButton){
////        view_box_width.constant += 100
////        view_box_height.constant += 100
//        UIView.animateKeyframes(withDuration: 4, delay: 0, animations: {
//
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
//                self.view_box.backgroundColor = .magenta
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
//                self.view_box.alpha = 0.5
//            })
//            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
//                self.view_box.center.x = self.view.bounds.width - 100
//            })
//            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
//                self.view_box.center.x = self.view.bounds.width - 200
//            })
//        })
//    }
}
