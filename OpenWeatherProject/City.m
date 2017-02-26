//
//  City.m
//  OpenWeatherProject
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import "City.h"
#import "Weather.h"

@implementation City

+(City *)initWithDictionary:(NSDictionary *)dict {
    
    City *lCity = [City new];
    
    lCity.name = dict[@"city"][@"name"];
                               
    if (lCity.name == nil) {
        lCity.name = dict[@"name"];
    } else {
        lCity.name = @"NOT FOUND!";
    }
    
        lCity.currentWeather = [Weather initCurrentWeatherWithDictionary:dict];
    
    NSMutableArray *forecastWeather = [NSMutableArray array];
    
    for (NSDictionary *forecastDict in dict[@"list"]) {
        [forecastWeather addObject:[Weather initWeatherForecastWithDictionary:forecastDict]];
    }
    
    lCity.forecastWeatherArray = forecastWeather;
    
    return lCity;
}

@end

