//
//  ViewController.m
//  Hematuria Meter
//
//  Created by Jim Ryan Quitevis on 2015-09-23.
//  Copyright © 2015 Jim Ryan Quitevis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _pages = @[@"Chart", @"Color1", @"Color2", @"Color3", @"Color4", @"Color5"];
    
    _currentPage = 0;
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    NSArray *viewControllers = @[[self viewControllerAtIndex:0]];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [_pages indexOfObject:viewController.restorationIdentifier];
    _currentPage = currentIndex;
    
    if ((_currentPage - 1) < 0) {
        return nil;
    }
    
    _currentPage--;
    
    return [self viewControllerAtIndex:_currentPage];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [_pages indexOfObject:viewController.restorationIdentifier];
    _currentPage = currentIndex;
    
    if (_currentPage + 1 >= [_pages count]) {
        return nil;
    }
    
    _currentPage++;
    
    return [self viewControllerAtIndex:_currentPage];
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index
{
    UIViewController *controller = nil;
    controller = [self.storyboard instantiateViewControllerWithIdentifier:[_pages objectAtIndex:index]];
    return controller;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end
