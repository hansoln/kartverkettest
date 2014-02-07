//
//  INAViewController.m
//  mapboxtest
//
//  Created by Hans Olav Nome on 07.02.14.
//  Copyright (c) 2014 Hans Olav Nome. All rights reserved.
//

#import "INAViewController.h"
#import "RMWMS.h"
#import "RMWMSSource.h"
#import <Mapbox.h>

@interface INAViewController ()
@property (weak, nonatomic) IBOutlet RMMapView *mapView;

@end


#define kRetinaMapID @"examples.map-zswgei2n"
#define kNormalMapID @"examples.map-zswgei2n"

@implementation INAViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    RMWMS *wms = [RMWMS new];
    wms.urlPrefix = @"http://opencache.statkart.no/gatekeeper/gk/gk.open?";
    wms.layers = @"topo2";
    
    RMWMSSource *source = [RMWMSSource new];
    source.wms = wms;
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:source];
    
    mapView.hideAttribution = YES;
    [mapView setShowLogoBug:NO];
    
    mapView.zoom = 0;

    
    [mapView setUserTrackingMode:RMUserTrackingModeFollowWithHeading];
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

@end
