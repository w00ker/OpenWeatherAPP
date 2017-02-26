//
//  Weather.h
//  OpenWeatherProject
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (assign, nonatomic) NSInteger temperature;
@property (assign, nonatomic) NSInteger humidity;
@property (assign, nonatomic) NSInteger windSpeed;
@property (assign, nonatomic) NSString *windDirection;
@property (assign, nonatomic) NSInteger windDegrees;
@property (assign, nonatomic) float     tempMin;
@property (assign, nonatomic) float     tempMax;
@property (assign, nonatomic) NSInteger atmPressure;
@property (strong, nonatomic) NSString *currentSkyDescription;
@property (strong, nonatomic) NSString *forecastSkyDescription;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *sunrise;
@property (strong, nonatomic) NSString *sunset;

+(Weather *)initCurrentWeatherWithDictionary:(NSDictionary *)dict;
+(Weather *)initWeatherForecastWithDictionary:(NSDictionary *)dict;

@end
