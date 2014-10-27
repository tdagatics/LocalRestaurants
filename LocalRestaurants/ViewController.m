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
        //zoomLocation.latitude = 33.126731;
       // zoomLocation.longitude= -76.580806;
        
    
     //   MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1, 1);
        
    //
      //  [_mapView setRegion:viewRegion animated:YES];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 33.109084;
    zoomLocation.longitude = -117.288364;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 10000, 10000);
    [_mapView setRegion:viewRegion animated:YES];
    _mapView.showsUserLocation = YES;
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"Restaurants";
    request.region = _mapView.region;
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        NSLog(@"Map Items: %@", response.mapItems);
        
    }];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        for (MKMapItem *item in response.mapItems) {
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = item.name;
            annotation.coordinate = item.placemark.coordinate;
            [_mapView addAnnotation:annotation];
        }}];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
