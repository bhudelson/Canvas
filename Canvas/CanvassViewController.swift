//
//  CanvassViewController.swift
//  Canvas
//
//  Created by Blake Hudelson on 2/17/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class CanvassViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    @IBOutlet weak var trayArrowView: UIImageView!
    
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trayDownOffset = 200
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanView(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            trayOriginalCenter = trayView.center
        
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            
            if velocity.y > 0 {
                //UIView.animateWithDuration(0.3, animations: { () -> Void in self.trayView.center = self.trayDown
                //UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: <#T##UIViewAnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
            
            //})
            self.trayArrowView.transform = CGAffineTransformMakeRotation(CGFloat(180 * M_PI / 180))
            
            } else {
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in self.trayView.center = self.trayUp
                    
                    self.trayArrowView.transform = CGAffineTransformMakeRotation(CGFloat(0 * M_PI / 180))
                    
                })
                
            }
            
        }
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didPanFace(sender: UIPanGestureRecognizer) {
        var imageView = sender.view as! UIImageView
        newlyCreatedFace = UIImageView(image: imageView.image)
        view.addSubview(newlyCreatedFace)
        newlyCreatedFace.center = imageView.center
        newlyCreatedFace.center.y += trayView.frame.origin.y
        var translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
        }
    }

}
