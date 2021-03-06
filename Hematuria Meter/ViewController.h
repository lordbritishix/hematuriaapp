//
//  ViewController.h
//  Hematuria Meter
//
//  Created by Jim Ryan Quitevis on 2015-09-23.
//  Copyright © 2015 Jim Ryan Quitevis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pages;
@property NSInteger currentPage;
@end

