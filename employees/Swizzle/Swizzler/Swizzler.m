//
//  Swizzler.m
//  employees
//
//  Created by juan ledesma on 05/01/2022.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#include "Swizzler.h"

@implementation Swizzler : NSObject
- (void)swizzle:(Class)c withOriginalMethod:(SEL)originalMethod withSwizzledMethod:(SEL)swizzledMethod
{
    Method origMethod = class_getInstanceMethod(c, originalMethod );
    Method newMethod  = class_getInstanceMethod(c, swizzledMethod );

    if(class_addMethod(c, originalMethod, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
    {
        class_replaceMethod(c, swizzledMethod, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations( origMethod, newMethod );
    }
}

@end
