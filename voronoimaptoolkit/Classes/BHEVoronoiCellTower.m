//
//  BHEVoronoiCellTower.m
//  Pods
//
//  Created by Rhys Jones on 10/25/16.
//
//


#import "BHEVoronoiCellTower.h"
#import "BHEConstants.h"

@implementation BHEVoronoiCellTower

// Designated Initializer
- (instancetype)initWithLocation:(CLLocation *)location name:(NSString *)title {
    self = [super init];
    if (self) {
        _title = title;
        _location = location;
        _color = [[UIColor alloc] initWithRed:arc4random()%256/256.0 green:arc4random()%256/256.0 blue:arc4random()%256/256.0 alpha:1.0];
        
        MKMapPoint mkMapPoint = MKMapPointForCoordinate(location.coordinate);
        
        [self setCoord:CGPointMake(mkMapPoint.x, mkMapPoint.y)];
    }
    return self;
}

- (instancetype)initWithLocation:(CLLocation *)location {
    return [self initWithLocation:location name:kBaseCellTowerTitle];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.location = [aDecoder decodeObjectForKey:@"location"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.uuID = [aDecoder decodeObjectForKey:@"uuID"];
        self.color = [aDecoder decodeObjectForKey:@"color"];
        
        // will this work? Hm. Should the superclass do this?
        [self setCoord:[aDecoder decodeCGPointForKey:@"coord"]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.location forKey:@"location"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.uuID forKey:@"uuID"];
    [aCoder encodeObject:self.color forKey:@"color"];
    
    // same question as above
    [aCoder encodeCGPoint:self.coord forKey:@"coord"];
}

- (CLLocationDistance)distanceFromCellTower:(BHEVoronoiCellTower *)tower {
    if (self.location) {
        return [self.location distanceFromLocation:tower.location];
    }
    return -1;
}

- (CLLocationDistance)distanceFromLocation:(CLLocation *)location {
    if (self.location) {
        return [self.location distanceFromLocation:location];
    }
    return -1;
}

- (NSString *)description {
    NSString *description = [NSString stringWithFormat:@"%@ (%@): LAT: %f, LONG: %f", self.title, self.uuID.UUIDString, self.location.coordinate.latitude, self.location.coordinate.longitude];
    return description;
}

- (void)setLocation:(CLLocation *)location {
    MKMapPoint mkMapPoint = MKMapPointForCoordinate(location.coordinate);
    
    [self setCoord:CGPointMake(mkMapPoint.x, mkMapPoint.y)];
    _location = location;
}

@end
