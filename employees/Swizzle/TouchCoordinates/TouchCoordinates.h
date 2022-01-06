//
//  TouchCoordinates.h
//  employees
//
//  Created by juan ledesma on 05/01/2022.
//

#ifndef TouchCoordinates_h
#define TouchCoordinates_h

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface TouchCoordinates : NSObject
@property (nonatomic, retain) NSMutableArray * touchCoordinatesArray;
  +(TouchCoordinates*)touchCoordinates;
@end

#endif /* TouchCoordinates_h */
