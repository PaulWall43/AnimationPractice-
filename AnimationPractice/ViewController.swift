//
//  ViewController.swift
//  AnimationPractice
//
//  Created by Paul Wallace on 7/11/16.
//  Copyright © 2016 Macy's. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var animatedView: UIView!
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    let animationArr : [String] = ["Spring", "PopOut", "Shake", "Squeeze"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        
        animatedView.layer.cornerRadius = 10.0
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: [], animations: {
                self.animatedView.center.x -= self.view.frame.width
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animationArr.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animationArr[row] 
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        decideAnimation(animationArr[row])
    }
    
    func decideAnimation(string: String){
        let view = animatedView
        if(string == "Shake"){
            shakeAnimation(view)
        } else if (string == "Spring"){
            springAnimation(view)
        } else if (string == "PopOut"){
            borderAnimation(view)
        } else if (string == "Squeeze"){
            squeezeAnimation(view)
        }
    }
    
    
    //make a function enumeration?
    func shakeAnimation(viewToAnimate: UIView){
        UIView.animateWithDuration(0.1, animations: {
            viewToAnimate.center.x += viewToAnimate.bounds.width/4

            }, completion: {
        finished in
                UIView.animateWithDuration(0.1, animations: {
                    viewToAnimate.center.x -= viewToAnimate.bounds.width/2
                    }, completion: {
                finished in
                        UIView.animateWithDuration(0.1, animations: {
                            viewToAnimate.center.x += viewToAnimate.bounds.width/4
                            }, completion: nil)
                })
        
        
        })
    }
    
    func springAnimation(viewToAnimate: UIView){
        UIView.animateWithDuration(0.25, animations: {
            viewToAnimate.transform = CGAffineTransformMakeScale(1.3, 1.3)

            }, completion: {

                finished in
                UIView.animateWithDuration(0.2, animations: {
                    viewToAnimate.transform = CGAffineTransformMakeScale(0.8, 0.8)

                    }, completion: {

                        finished in
                        UIView.animateWithDuration(0.15, animations: {
                            viewToAnimate.transform = CGAffineTransformMakeScale(1.1, 1.1)
                            }, completion: {
                                finished in
                                UIView.animateWithDuration(0.10, animations: {
                                    viewToAnimate.transform = CGAffineTransformMakeScale(1.0, 1.0)
                                })
                        })
                })
                
        })
    }
    
    func squeezeAnimation(viewToAnimate: UIView){
        UIView.animateWithDuration(0.25, animations: {
            viewToAnimate.transform = CGAffineTransformMakeScale(1.5, 0.7)
            
            }, completion: {
                
                finished in
                UIView.animateWithDuration(0.2, animations: {
                    viewToAnimate.transform = CGAffineTransformMakeScale(0.7, 1.5)
                    
                    }, completion: {
                        
                        finished in
                        UIView.animateWithDuration(0.15, animations: {
                            viewToAnimate.transform = CGAffineTransformMakeScale(1.2, 0.9)
                            }, completion: {
                                finished in
                                UIView.animateWithDuration(0.10, animations: {
                                    viewToAnimate.transform = CGAffineTransformMakeScale(1.0, 1.0)
                                })
                        })
                })
                
        })
    }
    
    func borderAnimation(sender: AnyObject) {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 0
        animation.toValue = animatedView.frame.width/2
        animation.duration = 0.3
        
        animatedView.layer.addAnimation(animation, forKey: "cornerRadius")
        animatedView.layer.cornerRadius = animatedView.frame.width/2
        /*Make bigger then smaller progressively*/
    }
//
//        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 1 * Int64(NSEC_PER_SEC))
//        dispatch_after(time, dispatch_get_main_queue(), {
//
//            
//            self.animatedView.layer.removeAllAnimations()
//            self.animatedView.frame = self.animatedView.frame
//            UIView.animateWithDuration(0.25, animations: {
//                self.animatedView.center.x = self.view.center.x
//            })
//        })
        
        
//        UIView.animateWithDuration(0.2, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [.Autoreverse], animations: {
//                self.animatedView.center.x -= self.animatedView.bounds.width/4
//            }, completion: nil)
}

