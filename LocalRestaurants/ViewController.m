//
//  ViewController.m
//  LocalRestaurants
//
//  Created by Anthony Dagati on 10/24/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController ()

@end

@implementation ViewController

- (void) viewWillAppear:(BOOL)animated
{
      //  CLLocationCoordinate2D zoomLocation;
        //zoomLocation.latitude = 39.281516;
       // zoomLocation.longitude= -76.580806;
        
    
     //   MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1, 1);
        
    //
      //  [_mapView setRegion:viewRegion animated:YES];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.mapView.userLocation.title);
    
    _mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
