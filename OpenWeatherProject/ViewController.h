//
//  ViewController.h
//  OpenWeatherProject
//
//  Created by Admin on 21.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *cityNames;
@property (strong, nonatomic) NSArray *pageImages;

@end

