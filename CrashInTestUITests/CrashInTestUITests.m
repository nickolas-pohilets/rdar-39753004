#import <XCTest/XCTest.h>
#import "CrashHelper.h"
#import "CrashInTestUITests-Swift.h"

@interface CrashInTestUITests : XCTestCase

@end

@implementation CrashInTestUITests
{
    XCUIApplication* app;
}

- (void)setUp {
    [super setUp];
    
    self.continueAfterFailure = NO;
    app = [[XCUIApplication alloc] init];
    [app launch];
}

- (void)tearDown {
    [app terminate];
    app = nil;
    [super tearDown];
}

- (void)wait {
    BOOL ok = [app.staticTexts[@"ai_dummy"] waitForExistenceWithTimeout:10];
    (void)ok;
}

- (void)testAssert {
    [app.buttons[@"ai_btn_assert"] tap];
    [self wait];
}

- (void)testNil {
   [app.buttons[@"ai_btn_nil"] tap];
   [self wait];
}

 - (void)testBadAccess {
     [app.buttons[@"ai_btn_bad_access"] tap];
     [self wait];
 }

- (void)testSwiftFatal {
    [app.buttons[@"ai_btn_swift"] tap];
    [self wait];
}

//- (void)testAssertInTestRunner {
//    [CrashHelper raiseAssert];
//}
//
//- (void)testNilInTestRunner {
//    [CrashHelper raiseNilElement];
//}
//
//- (void)testBadAccessInTestRunner {
//    [CrashHelper raiseBadAccess];
//}
//
//- (void)testSwiftFatalInTestRunner {
//    [CrashHelper raiseSwiftFatal];
//}

@end
