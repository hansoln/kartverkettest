//
//  INAWebSource.m
//  mapboxtest
//
//  Created by Hans Olav Nome on 07.02.14.
//  Copyright (c) 2014 Hans Olav Nome. All rights reserved.
//

#import "INAWebSource.h"

@implementation INAWebSource
- (id)init
{
    if (!(self = [super init]))
        return nil;
    
    self.minZoom = 1;
    self.maxZoom = 11;
    
	return self;
}

- (NSURL *)URLForTile:(RMTile)tile
{
	NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
			  @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f",
			  self, tile.zoom, self.minZoom, self.maxZoom);
    
    NSString *baseURL = @"http://labs.kartverket.no/norgeskart/wms.html?id=topo2_WMS&url=http://openwms.statkart.no/skwms1/wms.topo2?&name=Topografisk%20norgeskart%202&layers=topo2_WMS#";
    
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@%d/%d/%d", baseURL,tile.zoom, tile.x, tile.y]];
}

- (NSString *)uniqueTilecacheKey
{
	return @"MapQuestOpenAerial";
}

- (NSString *)shortName
{
	return @"MapQuest Open Aerial";
}

- (NSString *)longDescription
{
	return @"Map tiles courtesy of MapQuest. Portions Courtesy NASA/JPL-Caltech and U.S. Depart. of Agriculture, Farm Service Agency.";
}

- (NSString *)shortAttribution
{
	return @"Tiles courtesy of MapQuest.";
}

- (NSString *)longAttribution
{
	return @"Tiles courtesy of MapQuest and OpenStreetMap contributors. Portions Courtesy NASA/JPL-Caltech and U.S. Depart. of Agriculture, Farm Service Agency.";
}


@end
