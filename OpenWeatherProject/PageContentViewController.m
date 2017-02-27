//
//  PageContentViewController.m
//  OpenWeatherProject
//
//  Created by Admin on 21.01.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import "PageContentViewController.h"
#import "ServerManager.h"
#import "City.h"
#import "Weather.h"
#import "ForecastCollectionCell.h"

@interface PageContentViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *windDirectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *atmPressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunriseLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunsetLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *forecastColectionView;

@property (strong, nonatomic) City *city;


@end

@implementation PageContentViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    _forecastColectionView.dataSource = self;
    _forecastColectionView.delegate = self;
    
    self.weatherImageView.image = [UIImage imageNamed:self.weatherImageFile];
    
    __weak typeof(self) weakSelf = self;
    
    [[ServerManager sharedManager] getCurrentWeatherWithCity:_cityName completionBlock:^(City *city, NSError *error) {
        
            if (error) {
                NSLog(@"ERROR: %@", error.localizedDescription);
            } else {

        weakSelf.dateLabel.text = [NSString stringWithFormat:@"%@", city.currentWeather.date];
        weakSelf.temperatureLabel.text = [NSString stringWithFormat:@"%ld\u00B0", (long)city.currentWeather.temperature];
        weakSelf.humidityLabel.text = [NSString stringWithFormat:@"%ld%%", (long)city.currentWeather.humidity];
        weakSelf.windSpeedLabel.text = [NSString stringWithFormat:@"%ldmps", (long)city.currentWeather.windSpeed];
        weakSelf.windDirectionLabel.text = [NSString stringWithFormat:@"%@ %ld\u00B0", city.currentWeather.windDirection, (long)city.currentWeather.windDegrees];
        weakSelf.atmPressureLabel.text = [NSString stringWithFormat:@"%ldhPa", (long)city.currentWeather.atmPressure];
        weakSelf.cityLabel.text = [NSString stringWithFormat:@"%@", city.name ];
        weakSelf.sunsetLabel.text = [NSString stringWithFormat:@"%@", city.currentWeather.sunset];
        weakSelf.sunriseLabel.text = [NSString stringWithFormat:@"%@", city.currentWeather.sunrise];
        weakSelf.city.currentWeather = city.currentWeather;
        
            }
    }];
    
    
    
    [[ServerManager sharedManager] getForecastWeatherWithCity:_cityName completionBlock:^(City *city, NSError *error) {
        
        if (error) {
            NSLog(@"ERROR: %@", error.localizedDescription);
        } else {
            weakSelf.city = city;
            [weakSelf.forecastColectionView reloadData];
        }
        
    }];
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _forecastColectionView.dataSource = self;
    _forecastColectionView.delegate = self;
    
//    self.weatherImageView.image = [UIImage imageNamed:self.weatherImageFile];
//    
//    __weak typeof(self) weakSelf = self;
//    
//    [[ServerManager sharedManager] getCurrentWeatherWithCity:_cityName completionBlock:^(City *city, NSError *error) {
//        
//        weakSelf.dateLabel.text = [NSString stringWithFormat:@"%@", city.currentWeather.date];
//        weakSelf.temperatureLabel.text = [NSString stringWithFormat:@"%ld\u00B0", (long)city.currentWeather.temperature];
//        weakSelf.humidityLabel.text = [NSString stringWithFormat:@"%ld%%", (long)city.currentWeather.humidity];
//        weakSelf.windSpeedLabel.text = [NSString stringWithFormat:@"%ldmps", (long)city.currentWeather.windSpeed];
//        weakSelf.windDirectionLabel.text = [NSString stringWithFormat:@"%@ %ld\u00B0", city.currentWeather.windDirection, (long)city.currentWeather.windDegrees];
//        weakSelf.atmPressureLabel.text = [NSString stringWithFormat:@"%ldhPa", (long)city.currentWeather.atmPressure];
//        weakSelf.cityLabel.text = [NSString stringWithFormat:@"%@", city.name ];
//        weakSelf.sunsetLabel.text = [NSString stringWithFormat:@"%@", city.currentWeather.sunset];
//        weakSelf.sunriseLabel.text = [NSString stringWithFormat:@"%@", city.currentWeather.sunrise];
//        weakSelf.city = city;
//        
////        [weakSelf.forecastColectionView reloadData];
//        
//        //NSLog(@"error - %@", error);
//        
//    }];
//    
//    
//
//    [[ServerManager sharedManager] getForecastWeatherWithCity:_cityName completionBlock:^(City *city, NSError *error) {
//        if (error) {
//            NSLog(@"ERROR: %@", error.localizedDescription);
//        } else {
//            weakSelf.city = city;
//            
//            [weakSelf.forecastColectionView reloadData];
//        }
//      
//    }];
//    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [_city.forecastWeatherArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    static NSString *identifier = @"ForecastCollectionCell";
    
    ForecastCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
  
    
    cell.backgroundColor = [UIColor whiteColor];
    
    Weather *lWeather = _city.forecastWeatherArray[indexPath.item];
    
    cell.maxTempLabel.text = lWeather.tempMax;
    cell.minTempLabel.text = lWeather.tempMin;
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
