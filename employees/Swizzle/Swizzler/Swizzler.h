//
//  Swizzler.h
//  employees
//
//  Created by juan ledesma on 05/01/2022.
//

#ifndef Swizzler_h
#define Swizzler_h

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Swizzler : NSObject {}
- (void)swizzle:(Class)c withOriginalMethod:(SEL)originalMethod withSwizzledMethod:(SEL)swizzledMethod;
@end

#endif /* Swizzler_h */
