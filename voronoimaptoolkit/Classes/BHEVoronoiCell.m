//
//  BHEVoronoiCell.m
//  Pods
//
//  Created by Rhys Jones on 10/25/16.
//
//

#import "BHEVoronoiCell.h"
#import "Vertex.h"
#import "Halfedge.h"

@implementation BHEVoronoiCell

- (instancetype)initWithCell:(Cell *)cell tower:(BHEVoronoiCellTower *)tower {
    self = [super init];
    if (self) {
        _cell = cell;
        _tower = tower;
        _color = tower.color;
    }
    return self;
}

- (NSArray *)edges {
    return self.cell.halfedges;
}

- (NSArray *)vertices {
    
    NSMutableArray *vertices = [NSMutableArray array];
    Vertex *startPoint;
    Vertex *endPoint;
    
    // create an array of vertices of the cell from the half-edges, eliminating duplicates
    for (Halfedge *halfEdge in [self.cell halfedges]) {
        startPoint = halfEdge.getStartpoint;
        endPoint = halfEdge.getEndpoint;
        // is the start point already in the array?
        if (![vertices containsObject:startPoint]) {
            [vertices addObject:startPoint];
        }
        // is the end point already in the array?
        if (![vertices containsObject:endPoint]) {
            [vertices addObject:endPoint];
        }
    }
    
    return vertices;
}



// Dump this soon
- (MKPolygon *)overlay {
    
    MKMapPoint points[[self.vertices count]];
    int index = 0;
    for (Vertex *vertex in self.vertices) {
        points[index] = MKMapPointMake(vertex.x, vertex.y);
        index++;
    }
    
    // Create polygonal overlay based on vertices
    return [MKPolygon polygonWithPoints:points count:[self.vertices count]];
    
    
    //overlay.overlayColor = self.color;
    
}

@end
