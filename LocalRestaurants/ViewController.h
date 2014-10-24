//
//  ViewController.h
//  LocalRestaurants
//
//  Created by Anthony Dagati on 10/24/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

