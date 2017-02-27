//
//  ForecastCollectionCell.h
//  OpenWeatherProject
//
//  Created by Admin on 14.02.17.
//  Copyright © 2017 SashaBudz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *forecastWeatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *maxTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@end
