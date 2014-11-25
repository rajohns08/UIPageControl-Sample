//
//  ViewController.m
//  PageController
//
//  Created by Adam Johns on 11/25/14.
//  Copyright (c) 2014 Adam Johns. All rights reserved.
//

#import "ViewController.h"
#import "RegularViewController.h"
#import "AnotherViewController.h"
#import "DashBaseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create page view controller
    _pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    
    NSArray *viewControllers = @[[self viewControllerAtIndex:0]];
    [_pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    _pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
    
    _outletPageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _outletPageControl.currentPageIndicatorTintColor = [UIColor blackColor];
}

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed {
    
    if (completed) {
        NSUInteger currentIndex = [[_pageViewController.viewControllers lastObject] index];
        _outletPageControl.currentPage = currentIndex;
    }
    
    
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((DashBaseViewController *) viewController).index;
    
    if (index == 0) {
        return nil;
    }
    else {
        return [self viewControllerAtIndex:0];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((DashBaseViewController *) viewController).index;
    
    if (index == 0) {
        return [self viewControllerAtIndex:1];
    }
    else {
        return nil;
    }
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    switch (index) {
        case 1: {
            AnotherViewController *tableView = [self.storyboard instantiateViewControllerWithIdentifier:@"AnotherView"];
            tableView.index = 1;
            return tableView;
        } break;
        default: {
            RegularViewController *regularView = [self.storyboard instantiateViewControllerWithIdentifier:@"RegularView"];
            regularView.index = 0;
            return regularView;
        } break;
    }
}

@end
