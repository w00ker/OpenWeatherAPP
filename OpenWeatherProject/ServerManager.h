//
//  ServerManager.h
//  OpenWeatherProject
//
//  Created by Admin on 24.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;

@interface ServerManager : NSObject

+ (ServerManager *)sharedManager;
- (void)getForecastWeatherWithCity:(NSString *)cityName completionBlock: (void(^)(City *city, NSError *error)) completion;
- (void)getCurrentWeatherWithCity:(NSString *)cityName completionBlock: (void(^)(City *city, NSError *error)) completion;

@end
