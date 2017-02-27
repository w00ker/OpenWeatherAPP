//
//  City.h
//  OpenWeatherProject
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Weather;
@interface City : NSObject

@property (copy, nonatomic) NSString *name;
@property (weak, nonatomic) Weather *currentWeather;
@property (strong, nonatomic) NSArray *forecastWeatherArray;
//@property (weak, nonatomic) Weather *forecastWeather;

+(City *)initWithCurrentDictionary:(NSDictionary *)dict;
+(City *)initWithForecastDictionary:(NSDictionary *)dict;

@end
