//
//  Weather.m
//  OpenWeatherProject
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import "Weather.h"

@implementation Weather

//Current weather
+(Weather *)initCurrentWeatherWithDictionary:(NSDictionary *)dict {
    
    Weather *currentWeather = [Weather new];
    
    currentWeather.temperature = [dict[@"main"][@"temp"]     integerValue];
    currentWeather.humidity    = [dict[@"main"][@"humidity"] integerValue];
    currentWeather.windSpeed   = [dict[@"wind"][@"speed"]    floatValue];
    currentWeather.windDegrees = [dict[@"wind"][@"deg"]      integerValue];
    currentWeather.windDirection = [currentWeather windDirectionFromDegrees: [dict[@"wind"][@"deg"] integerValue]];
    currentWeather.atmPressure = [dict[@"main"][@"pressure"] integerValue];
    currentWeather.tempMin     = [NSString stringWithFormat:@"%f", [dict[@"main"][@"temp_min"] floatValue]];
    currentWeather.tempMax     = [dict[@"main"][@"temp_max"] stringValue];
    
    currentWeather.sunrise = [currentWeather dateFormatterForDate:[NSDate dateWithTimeIntervalSince1970:[dict[@"sys"][@"sunrise"] integerValue]] withFormat:@"HH:mm"];
    
    currentWeather.sunset = [currentWeather dateFormatterForDate:[NSDate dateWithTimeIntervalSince1970:[dict[@"sys"][@"sunset"] integerValue]] withFormat:@"HH:mm"];
    
    currentWeather.date = [currentWeather dateFormatterForDate:[NSDate dateWithTimeIntervalSince1970:[dict[@"dt"] integerValue]] withFormat:@"dd.MM.yyyy"];
    
    for (NSDictionary *subWeather in dict[@"weather"]) {
        currentWeather.currentSkyDescription = subWeather[@"main"];
    }
    
    return currentWeather;
}


//Weather forecast
+(Weather *)initWeatherForecastWithDictionary:(NSDictionary *)dict {
    
    Weather *weatherForecast = [Weather new];
    
    weatherForecast.tempMin  = [NSString stringWithFormat:@"%.f", [dict[@"temp"][@"min"] floatValue]];
    weatherForecast.tempMax  = [NSString stringWithFormat:@"%.f", [dict[@"temp"][@"max"] floatValue]];

    for (NSDictionary *subWeather in dict[@"weather"]) {
        weatherForecast.forecastSkyDescription = subWeather[@"main"];
        break;
        
    }
    
    return weatherForecast;
}


#pragma mark - DateFormatter

-(NSString *)dateFormatterForDate:(NSDate *)date withFormat:(NSString *)format{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setDateFormat:format];
    
    NSString *newDate = [dateFormatter stringFromDate:date];
    
    return newDate;
}

#pragma mark - WindDirectionConverter

- (NSString *)windDirectionFromDegrees:(NSInteger)degrees
{
    static NSArray *directions;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Initialize array on first call.
        directions = @[@"N", @"NNE", @"NE", @"ENE", @"E", @"ESE", @"SE", @"SSE",
                       @"S", @"SSW", @"SW", @"WSW", @"W", @"WNW", @"NW", @"NNW"];
    });
    
    NSInteger i = (degrees + 11.25)/22.5;
    return directions[i % 16];
}

@end
