//
//  AppDelegate.h
//  OpenWeatherProject
//
//  Created by Admin on 21.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

