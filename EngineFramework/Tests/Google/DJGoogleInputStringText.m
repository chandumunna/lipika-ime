/*
 * LipikaIME is a user-configurable phonetic Input Method Engine for Mac OS X.
 * Copyright (C) 2013 Ranganath Atreya
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 */

#import "DJGoogleSchemeFactory.h"
#import <XCTest/XCTest.h>
#import "DJStringBufferManager.h"

@interface DJGoogleInputStringText : XCTestCase {
    DJStringBufferManager* manager;
}

@end

@interface DJStringBufferManager (Test)

-(id)initWithEngine:(DJInputMethodEngine *)myEngine;

@end

@interface DJInputMethodEngine (Test)

-(id)initWithScheme:(id<DJInputMethodScheme>)inputScheme;

@end

@implementation DJGoogleInputStringText

-(void)setUp {
    [super setUp];
    NSString *filePath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:@"GoogleSchemes/TestMultipleReplay.scm"];
    DJGoogleInputScheme* scheme = [DJGoogleSchemeFactory inputSchemeForSchemeFile:filePath];
    DJInputMethodEngine* engine = [[DJInputMethodEngine alloc] initWithScheme:scheme];
    manager = [[DJStringBufferManager alloc] initWithEngine:engine];
}

-(void)tearDown {
    [manager flush];
    [super tearDown];
}

-(void)testHappyCase_NilOutput {
    // abcdf should output pqs
    NSString* output = [manager outputForInput:@"a"];
    XCTAssertEqualObjects(@"a", [manager input], @"Unexpected input: %@", [manager input]);
    output = [manager outputForInput:@"b"];
    XCTAssertEqualObjects(@"ab", [manager input], @"Unexpected input: %@", [manager input]);
    output = [manager outputForInput:@"c"];
    XCTAssertEqualObjects(@"abc", [manager input], @"Unexpected input: %@", [manager input]);
    output = [manager outputForInput:@"d"];
    XCTAssertEqualObjects(@"abcd", [manager input], @"Unexpected input: %@", [manager input]);
    output = [manager outputForInput:@"f"];
    XCTAssertEqualObjects(@"abcdf", [manager input], @"Unexpected input: %@", [manager input]);
    output = [manager outputForInput:@"g"];
    XCTAssertEqualObjects(@"abcdfg", [manager input], @"Unexpected input: %@", [manager input]);
    output = [manager outputForInput:@" "];
    XCTAssertEqualObjects(output, @"qs ", @"Unexpected output: %@", output);
}

@end
