//
//  touchesBeganDetector.m
//  employees
//
//  Created by juan ledesma on 03/01/2022.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIApplication.h>
#include "Swizzler.h"
#include "TouchCoordinates.h"

@implementation  UIResponder (touchDetector)
- (void)swizzledTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView: touch.view];
    NSString *touchCoordinateString = [NSString stringWithFormat:@"Touch made at coordinate x:%f and y:%f", touchPoint.x, touchPoint.y];
    [self saveLastTouchPointStringData:touchCoordinateString withTimeStamp:[self getCurrentTimeStamp]];
    [self swizzledTouchesBegan:touches withEvent:event];
}

- (NSString *)getCurrentTimeStamp
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeString = [dateFormatter stringFromDate:[NSDate date]];
    NSString *timeStampString = [NSString stringWithFormat:@"The Timestamp is: %@", timeString];
    return timeStampString;
}

- (void)saveLastTouchPointStringData:(NSString *)touchPointString withTimeStamp:(NSString *) timeStampString
{
    NSMutableArray *sharedTouchCoordinates = [TouchCoordinates touchCoordinates].touchCoordinatesArray;
    NSString *coordinateTimeStampString = [NSString stringWithFormat:@"%@ - %@", touchPointString, timeStampString];
    [sharedTouchCoordinates addObject:coordinateTimeStampString];
}
@end

@interface TouchDetector : NSObject {}
- (id) init;
@end

@implementation TouchDetector

- (id) init
{
     if (![ super init ]) return nil;

    SEL swizzledSelector = @selector(swizzledTouchesBegan:withEvent:);
    SEL originalSelector = @selector(touchesBegan:withEvent:);

    Swizzler *swizzler = [[Swizzler alloc] init];
    [swizzler swizzle:[UIResponder class] withOriginalMethod:originalSelector withSwizzledMethod:swizzledSelector];
    return self;
}
@end



