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

+(City *)initWithCurrentDictionary:(NSDictionary *)dict {
    
    City *lCity = [City new];
    
    lCity.name = dict[@"city"][@"name"];
                               
    if (lCity.name == nil) {
        lCity.name = dict[@"name"];
    } else {
        lCity.name = @"NOT FOUND!";
    }
    
        lCity.currentWeather = [Weather initCurrentWeatherWithDictionary:dict];
    
//    NSMutableArray *forecastWeather = [[NSMutableArray alloc] init];
//    
//    NSLog(@"Whole weather = %@", dict);
//    
//    NSLog(@"Forecast weather arrray = %@", dict[@"list"]);
//    
//    for (NSDictionary *forecastDict in dict[@"list"]) {
//        [forecastWeather addObject:[Weather initWeatherForecastWithDictionary:forecastDict]];
//    }
//    
//    lCity.forecastWeatherArray = forecastWeather;
//    
//    NSLog(@"%@", lCity.forecastWeatherArray);
    
    return lCity;
}

+(City *)initWithForecastDictionary:(NSDictionary *)dict {
    
    City *lCity = [City new];
    
    NSMutableArray *forecastWeather = [[NSMutableArray alloc] init];
    
        for (NSDictionary *forecastDict in dict[@"list"]) {
        [forecastWeather addObject:[Weather initWeatherForecastWithDictionary:forecastDict]];
    }
    
    lCity.forecastWeatherArray = forecastWeather;
    
    NSLog(@"%@", lCity.forecastWeatherArray);
    
    return lCity;
    
}
@end

