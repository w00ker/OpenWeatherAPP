//
//  ViewController.m
//  OpenWeatherProject
//
//  Created by Admin on 21.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"


@interface ViewController ()

@end

@implementation ViewController

 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create the data model
    _cityNames = @[@"Lviv", @"Kolomyya"];
    _pageImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    startingViewController.cityName = _cityNames[0];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    //self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.cityNames count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.cityNames count] == 0) || (index >= [self.cityNames count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    
    pageContentViewController.weatherImageFile = self.pageImages[index];
    pageContentViewController.pageIndex = index;
    pageContentViewController.cityName = _cityNames[index];
    
    return pageContentViewController;
}

# pragma mark - Count and Index for PageViewController

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.cityNames count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
