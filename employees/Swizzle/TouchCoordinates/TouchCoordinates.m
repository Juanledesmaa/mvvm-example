//
//  TouchCoordinates.m
//  employees
//
//  Created by juan ledesma on 05/01/2022.
//

#include "TouchCoordinates.h"

@implementation TouchCoordinates
@synthesize touchCoordinatesArray;
+(TouchCoordinates *)touchCoordinates {
    static dispatch_once_t pred;
    static TouchCoordinates *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[TouchCoordinates alloc] init];
        shared.touchCoordinatesArray = [[NSMutableArray alloc]init];
    });
    return shared;
}
@end
