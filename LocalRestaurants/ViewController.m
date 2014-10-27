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
    zoomLocation.latitude = 42.364506;
    zoomLocation.longitude = -71.057899;
    
    
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1000, 1000);
    [_mapView setRegion:viewRegion animated:YES];
    _mapView.showsUserLocation = YES;
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"Lobster Rolls";
    request.region = _mapView.region;
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    /*[search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        NSLog(@"Map Items: %@", response.mapItems);
        
    }];*/
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        for (MKMapItem *item in response.mapItems) {
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = item.name;
            annotation.coordinate = item.placemark.coordinate;
            annotation.subtitle = [NSString stringWithFormat:@"%@, %@ %@",
                                   item.placemark.addressDictionary[@"Street"],
                                   item.placemark.addressDictionary[@"State"],
                                   item.placemark.addressDictionary[@"ZIP"]];
            [_mapView addAnnotation:annotation];
        }}];
    MKLocalSearchRequest *request2 = [[MKLocalSearchRequest alloc] init];
    request2.naturalLanguageQuery = @"Sushi";
    request2.region = _mapView.region;
    MKLocalSearch *search2 = [[MKLocalSearch alloc] initWithRequest:request2];
    [search2 startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        for (MKMapItem *item in response.mapItems) {
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = item.name;
            annotation.subtitle = item.description;
            NSLog(@"Item description is: %@", item.description);
            annotation.coordinate = item.placemark.coordinate;
            annotation.subtitle = [NSString stringWithFormat:@"%@, %@, %@",
                                   item.placemark.addressDictionary[@"Street"],
                                   item.placemark.addressDictionary[@"State"],
                                   item.placemark.addressDictionary[@"ZIP"]];
            [_mapView addAnnotation:annotation];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
