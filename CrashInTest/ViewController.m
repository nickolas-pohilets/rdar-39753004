#import "ViewController.h"
#import "CrashHelper.h"
#import "CrashInTest-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)triggerAssert:(id)sender {
    [CrashHelper raiseAssert];
}

- (IBAction)triggerNilCrash:(id)sender {
    [CrashHelper raiseNilElement];
}

- (IBAction)triggerBadAccess:(id)sender {
    [CrashHelper raiseBadAccess];
}

- (IBAction)triggerSwift:(id)sender {
    [CrashHelper raiseSwiftFatal];
}

@end
