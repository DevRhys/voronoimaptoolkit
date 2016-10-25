//
//  BHEVoronoiCell.h
//  Pods
//
//  Created by Rhys Jones on 10/25/16.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Cell.h"
#import "BHEVoronoiCellTower.h"


@interface BHEVoronoiCell : NSObject

@property (nonatomic, strong) Cell *cell;
@property (nonatomic, strong) BHEVoronoiCellTower *tower;
@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithCell:(Cell *)cell tower:(BHEVoronoiCellTower *)tower;

- (NSArray *)edges;
- (NSArray *)vertices;



// Dump this soon
- (MKPolygon *)overlay;


@end
