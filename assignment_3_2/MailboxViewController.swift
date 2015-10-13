//
//  MailboxViewController.swift
//  assignment_3_2
//
//  Created by Marlon Misra on 2015-10-06.
//  Copyright © 2015 Marlon Misra. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var message: UIImageView!
    var messageCenterInitial = CGPoint()
    
    @IBOutlet weak var feed: UIImageView!
    var feedCenterInitial = CGPoint()
    
    @IBOutlet weak var leftMessage: UIView!
    var leftMessageInitial = CGPoint()
    
    
    @IBOutlet weak var rightMessage: UIView!
    var rightMessageInitial = CGPoint()
    
    @IBOutlet weak var archiveIcon: UIImageView!
    var archiveIconInitial = CGPoint()
    
    @IBOutlet weak var laterIcon: UIImageView!
    var laterIconInitial = CGPoint()
    
    @IBOutlet weak var listIcon: UIImageView!
    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var deleteIcon: UIImageView!
    
    @IBOutlet weak var listPage: UIImageView!
    
    @IBOutlet weak var reschedulePage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1202 + 86)
        view.backgroundColor = UIColor.greenColor()
        
        listPage.alpha = 0
        reschedulePage.alpha = 0
        listIcon.alpha = 0
        deleteIcon.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onPann(sender: AnyObject) {
        //get point velocity and translation
        var point = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        var translation = sender.translationInView(view)
        
        
        //When pan beings
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture started at: \(point)")
            
            //Store original point of message
            messageCenterInitial = message.center
            feedCenterInitial = feed.center
            
            leftMessageInitial = leftMessage.center
            archiveIconInitial = archiveIcon.center
            
            rightMessageInitial = rightMessage.center
            laterIconInitial = laterIcon.center
      
            
            
        
        }
            
        //Pan starts to change
        else if sender.state == UIGestureRecognizerState.Changed {
            //change msg location
            message.center = CGPoint(x: messageCenterInitial.x + translation.x, y: messageCenterInitial.y)
        
            if translation.x < -260 {
                rightMessage.center = CGPoint(x: rightMessageInitial.x + translation.x + 60, y: rightMessageInitial.y)
                background.backgroundColor = UIColor.brownColor()
                laterIcon.alpha = 0
                listIcon.alpha = 1
                
            }
            
            else if translation.x < -60 {
                rightMessage.center = CGPoint(x: rightMessageInitial.x + translation.x + 60, y: rightMessageInitial.y)
                background.backgroundColor = UIColor.orangeColor()
                laterIcon.alpha = 1
                listIcon.alpha = 0
                archiveIcon.alpha = 0
                
            }
            
            else if translation.x < -30 {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.laterIcon.alpha = 1
                    }, completion: { (completed) -> Void in
                        //nothing
                })
            
            background.backgroundColor = UIColor.grayColor()
            }
            
            else if translation.x < 30 {
                rightMessage.center = CGPoint(x: rightMessageInitial.x, y: rightMessageInitial.y)
                
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.laterIcon.alpha = 0.5
                    self.archiveIcon.alpha = 0.5
                    }, completion: { (completed) -> Void in
                        //nothing
                        
                })
            }
            
            else if translation.x < 60 {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.archiveIcon.alpha = 1
                    }, completion: { (completed) -> Void in
                        //nothing
                })
                background.backgroundColor = UIColor.grayColor()
            }
            
            else if translation.x < 260 {
                leftMessage.center = CGPoint(x: leftMessageInitial.x + translation.x - 60, y: leftMessageInitial.y)
                background.backgroundColor = UIColor.greenColor()
                laterIcon.alpha = 0
                listIcon.alpha = 0
                archiveIcon.alpha = 1
                deleteIcon.alpha = 0
            }
            
            else if translation.x > 260 {
                leftMessage.center = CGPoint(x: leftMessageInitial.x + translation.x - 60, y: leftMessageInitial.y)
                
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                background.backgroundColor = UIColor.redColor()
            }
            
            else {
                //nada
            }
            print("Gesture changed at: \(point) \(translation)")
        }
        
        //Pan ended
        else if sender.state == UIGestureRecognizerState.Ended {
            
            //snap message back
            if translation.x < -260 {
                archiveIcon.alpha = 0
                
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    //move msg back
                    self.message.center = CGPoint(x: self.messageCenterInitial.x - 320, y: self.messageCenterInitial.y)
                    
                    //move icons back
                    self.rightMessage.center = CGPoint(x: self.rightMessageInitial.x - 320, y: self.rightMessageInitial.y)
                    
                    self.listPage.alpha = 1
                    
                    print("Gesture ended at: \(point)")
                    }, completion: { (completed) -> Void in
                        //nada
                })
            }
            
            else if translation.x < -60 {
                archiveIcon.alpha = 0
                
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    self.message.center = CGPoint(x: self.messageCenterInitial.x - 320, y: self.messageCenterInitial.y)
                    
                    self.reschedulePage.alpha = 1
                    
                    print("Gesture ended at \(point)")
                    
                    }, completion: { (completed) -> Void in
                        //nada
                })
            }
            
            else if translation.x < 60 {
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    
                    //msg back to center
                    self.message.center = CGPoint(x: self.messageCenterInitial.x, y: self.messageCenterInitial.y)
                    
                    //move icons back
                    self.rightMessage.center = CGPoint(x: self.rightMessageInitial.x, y: self.rightMessageInitial.y)
                    
                    self.leftMessage.center = CGPoint(x: self.leftMessageInitial.x, y: self.leftMessageInitial.y)
                    
                    self.archiveIcon.alpha = 0.5
                    self.laterIcon.alpha = 0.5
                    
                    print("Gesture ended at \(point)")
                    
                    
                    
                    }, completion: { (completed) -> Void in
                        //nada
                })
            }
            
            else if translation.x < 260 {
                self.archiveIcon.alpha = 1
                self.laterIcon.alpha = 0
                
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    //move msg back to center
                    self.message.center = CGPoint(x: self.messageCenterInitial.x + 320, y: self.messageCenterInitial.y)
                    
                    //icons back
                    self.leftMessage.center = CGPoint(x: self.leftMessageInitial.x + 320, y: self.leftMessageInitial.y)
                    
                    print("Gesture ended at \(point)")
                    }, completion: { (completed) -> Void in
                        //move up and down feed
                        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
                            self.feed.center = CGPoint(x: self.feedCenterInitial.x, y: self.feedCenterInitial.y - 86)
                            }, completion: { (completed) -> Void in
                                self.feed.center = CGPoint(x: self.feedCenterInitial.x, y: self.feedCenterInitial.y)
                        })
                        
                        //replace assets to original states
                        UIView.animateWithDuration(0, delay: 1, options: [], animations: { () -> Void in
                            self.message.center = CGPoint(x: self.messageCenterInitial.x, y: self.messageCenterInitial.y)
                            
                            //icons back
                            self.rightMessage.center = CGPoint(x: self.rightMessageInitial.x, y: self.rightMessageInitial.y)
                            
                            self.leftMessage.center = CGPoint(x: self.leftMessageInitial.x, y: self.leftMessageInitial.y)
                            
                            self.background.backgroundColor = UIColor.grayColor()
                            
                            self.deleteIcon.alpha = 0
                            
                            self.archiveIcon.alpha = 1
                            
                            self.laterIcon.alpha = 1
                            
                            
                            }, completion: { (completed) -> Void in
                                //nada
                        })
                })
            }
            
            else {
                self.deleteIcon.alpha = 1
                self.archiveIcon.alpha = 0
                self.laterIcon.alpha = 0
                
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    //move msg back
                    
                    self.message.center = CGPoint(x: self.messageCenterInitial.x + 320, y: self.messageCenterInitial.y)
                    
                    self.leftMessage.center = CGPoint(x: self.leftMessageInitial.x + 320, y: self.leftMessageInitial.y)
                    
                    print("Gesture stops at \(point)")
                    
                    }, completion: { (completed) -> Void in
                        //move up down feed
                        UIView.animateWithDuration(1, delay: 0, options: [UIViewAnimationOptions.Autoreverse], animations: { () -> Void in
                            self.feed.center = CGPoint(x: self.feedCenterInitial.x, y: self.feedCenterInitial.y - 86)
                            }, completion: { (completed) -> Void in
                                self.feed.center = CGPoint(x: self.feedCenterInitial.x, y: self.feedCenterInitial.y)
                        })
                })
                
                //replace assets
                UIView.animateWithDuration(0, delay: 1, options: [], animations: { () -> Void in
                    self.message.center = CGPoint(x: self.messageCenterInitial.x, y: self.messageCenterInitial.y)
                    
                    //icons back
                    self.rightMessage.center = CGPoint(x: self.rightMessageInitial.x, y: self.rightMessageInitial.y)
                    
                    self.leftMessage.center = CGPoint(x: self.leftMessageInitial.x, y: self.leftMessageInitial.y)
                    
                    self.background.backgroundColor = UIColor.grayColor()
                    
                    self.deleteIcon.alpha = 0
                    self.archiveIcon.alpha = 1
                    self.laterIcon.alpha = 1
                    
                    }, completion: { (completed) -> Void in
                        //nada
                })
            }
            
        }

    }
        

    ///tap to get out of reschedule screen
    
    @IBAction func onTapp(sender: AnyObject) {
        UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
            self.reschedulePage.alpha = 0
            self.listPage.alpha = 0
            self.listIcon.alpha = 0
            }) { (completed) -> Void in
                //nada
        }
        
        //move feed
        UIView.animateWithDuration(1, delay: 0, options: [UIViewAnimationOptions.Autoreverse], animations: { () -> Void in
            self.feed.center = CGPoint(x: self.feedCenterInitial.x, y: self.feedCenterInitial.y - 86)
            }) { (completed) -> Void in
                self.feed.center = CGPoint(x: self.feedCenterInitial.x, y: self.feedCenterInitial.y)
        }
        
        //replace assets
        UIView.animateWithDuration(0, delay: 0, options: [], animations: { () -> Void in
            self.message.center = CGPoint(x: self.messageCenterInitial.x, y: self.messageCenterInitial.y)
            
            //icons back
            self.rightMessage.center = CGPoint(x: self.rightMessageInitial.x, y: self.rightMessageInitial.y)
            
            self.leftMessage.center = CGPoint(x: self.leftMessageInitial.x, y: self.leftMessageInitial.y)
            
            self.background.backgroundColor = UIColor.grayColor()
            
            self.deleteIcon.alpha = 0
            self.archiveIcon.alpha = 1
            self.laterIcon.alpha = 1
            
            }, completion: { (completed) -> Void in
                //nada
        })
    }
    
    
    
    
    
    
    
    
    
    }


