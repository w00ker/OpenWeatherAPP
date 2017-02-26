//
//  ServerManager.m
//  OpenWeatherProject
//
//  Created by Admin on 24.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import "ServerManager.h"
#import "AFNetworking.h"
#import "City.h"


#define API_KEY = 4642e275346faa648a25ed961926aab3;

@interface ServerManager()

@property(strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation ServerManager

+ (ServerManager *)sharedManager {
    
    static ServerManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    
    return manager;
    
}

#pragma mark - API Request

- (instancetype)init {
    
    self = [super init];
    
    if (self != nil) {
        
        NSURL *baseURL = [NSURL URLWithString:@"http://api.openweathermap.org"];
        
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
        
    }
    
    return self;
}

- (void)getForecastWeatherWithCity:(NSString *)cityName completionBlock: (void(^)(City *city, NSError *error)) completion {
    
    NSString *urlString = [NSString stringWithFormat:@"/data/2.5/forecast/daily?q=%@&APPID=4642e275346faa648a25ed961926aab3&mode=json&units=metric&cnt=7", cityName];
    
    [self.sessionManager GET:urlString parameters:nil progress:nil

     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         
         //NSLog(@"%@", responseObject);

         City *lCity = [City initWithDictionary:responseObject];
         
         completion(lCity, nil);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completion(nil, error);
        
    }];
}

- (void)getCurrentWeatherWithCity:(NSString *)cityName completionBlock: (void(^)(City *city, NSError *error)) completion{
    
    NSString *urlString = [NSString stringWithFormat:@"/data/2.5/weather?q=%@&APPID=4642e275346faa648a25ed961926aab3&units=metric", cityName];
    
    [self.sessionManager GET:urlString parameters:nil progress:nil
     
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         
                         NSLog(@"%@", responseObject);
                         
                         City *lCity = [City initWithDictionary:responseObject];
                         
                         completion(lCity, nil);
                         
                         
                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         
                         completion(nil, error);
                         
                         NSLog(@"%@", error);
                         
                     }];
}

@end

