//
//  BackgroundDetector.m
//  employees
//
//  Created by juan ledesma on 05/01/2022.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIApplication.h>
#include "TouchCoordinates.h"
#include "Swizzler.h"

@implementation NSObject (backgroundStateDetector)

- (void)swizzledApplicationDidEnterBackground:(UIApplication *)application;
{
    NSMutableArray *sharedTouchCoordinates = [TouchCoordinates touchCoordinates].touchCoordinatesArray;
    
    if (sharedTouchCoordinates.count > 10)
    {
        NSIndexSet *lastTenIndexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange((sharedTouchCoordinates.count - 10), 10)];
        NSArray *lastTenObjects = [sharedTouchCoordinates objectsAtIndexes:lastTenIndexes];
        [self printCoordinatesArray:lastTenObjects];
    } else {
        [self printCoordinatesArray:sharedTouchCoordinates];
    }

    [self swizzledApplicationDidEnterBackground:application];
}

- (void)printCoordinatesArray:(NSArray *)array
{
    for (NSString *element in array)
    {
       NSLog(@"%@", element);
    }

    NSLog(@"You just printed the last %lu recorded touchs by the user, congrats!", array.count);
}
@end


@interface BackgroundStateDetector : NSObject {}
- (id) init;
@end

@implementation BackgroundStateDetector

- (id) init
{
     if (![ super init ]) return nil;

    SEL swizzledSelector = @selector( swizzledApplicationDidEnterBackground: );
    SEL originalSelector = @selector(applicationDidEnterBackground: );
    
    Swizzler *swizzler = [[Swizzler alloc] init];
    [swizzler swizzle:[[UIApplication sharedApplication].delegate class] withOriginalMethod:originalSelector withSwizzledMethod:swizzledSelector];

    return self;
}
@end
