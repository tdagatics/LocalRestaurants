//
//  AppDelegate.h
//  LocalRestaurants
//
//  Created by Anthony Dagati on 10/24/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

