//
//  ViewController.h
//  PageController
//
//  Created by Adam Johns on 11/25/14.
//  Copyright (c) 2014 Adam Johns. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDataSource, UINavigationControllerDelegate, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UIPageControl *outletPageControl;

@end

