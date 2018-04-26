#import <Foundation/Foundation.h>

@interface CrashHelper : NSObject

+ (void)raiseAssert;
+ (void)raiseNilElement;
+ (void)raiseBadAccess;

@end
