#import "CrashHelper.h"

@implementation CrashHelper

+ (void)raiseAssert {
    NSParameterAssert(nil);
}

+ (void)raiseNilElement {
    id x = nil;
    NSMutableArray* arr = [NSMutableArray new];
    [arr addObject:x];
}

+ (void)raiseBadAccess {
    char const * str = NULL;
    NSLog(@"%s", str + 1);
}

@end
