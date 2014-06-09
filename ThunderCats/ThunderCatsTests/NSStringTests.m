//
//  NSStringTests.m
//  ThunderCats
//
//  Created by William Grand on 5/29/14.
//  Copyright (c) 2014 Metova. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+TCAdditions.h"

@interface NSStringTests : XCTestCase

@end

@implementation NSStringTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// This might need to be modified based on what we decide is a valid email address.

- (void)testValidEmails
{
    NSArray *addresses = @[@"test@example.com",
                           @"test.test@mail.example.co.uk",
                           @"test.test@example.com",
                           @"a.nonymous@example.com",
                           @"name+tag@example.com",
                           @"a.name+tag@example.com"];
    
    for(int i = 0; i < addresses.count; i++){
        NSString *currentAddress = [addresses objectAtIndex:i];
        
        XCTAssertTrue([currentAddress tc_isValidEmailAddressFormat], @"The following address should succeed: %@", currentAddress);
    }
}

// This might need to be modified based on what we decide is a valid email address.

- (void)testInvalidEmails
{
    NSArray *addresses = @[@"me@",
                           @"@example.com",
                           @"me.@example.com",
                           @".me@example.com",
                           @"me@example..com",
                           @"me\\@example.com"];
    
    for(int i = 0; i < addresses.count; i++){
        NSString *currentAddress = [addresses objectAtIndex:i];
        
        XCTAssertFalse([currentAddress tc_isValidEmailAddressFormat], @"The following address should fail: %@", currentAddress);
    }
}

- (void)testContainsStringTrue
{
    NSString *fullString = @"This is a string";
    NSString *subString = @"This is a string";
    XCTAssertTrue([fullString tc_containsString:subString], @"Should find full string");
    
    fullString = @"This is a string";
    subString = @"This";
    XCTAssertTrue([fullString tc_containsString:subString], @"Should find first portion of string");
    
    fullString = @"string";
    subString = @"string";
    XCTAssertTrue([fullString tc_containsString:subString], @"Should find last portion of string");
    
    fullString = @"This is a string";
    subString = @" is a ";
    XCTAssertTrue([fullString tc_containsString:subString]);
    
    fullString = @"This is @!\\@#$ string";
    subString = @"@!\\@#$";
    XCTAssertTrue([fullString tc_containsString:subString], @"Should find substring of special characters");
    
    fullString = @"";
    subString = @"";
    XCTAssertFalse([fullString tc_containsString:subString], @"An empty string ");
}

- (void)testContainsStringFails
{
    NSString *fullString = @"This is a string";
    NSString *subString = @"xyz";
    XCTAssertFalse([fullString tc_containsString:subString], @"Should fail on invalid substring");
    
    fullString = @"This is a string";
    subString = @"";
    XCTAssertFalse([fullString tc_containsString:subString], @"Should not contain an empty string");
}

- (void)testWordCount
{
    NSString *fullString = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam interdum magna id metus euismod, eu consectetur neque posuere. Etiam quis.";
    
    XCTAssertEqual([fullString tc_wordCount].intValue, 20, @"String has 20 words, wordCount supplied %d", [fullString tc_wordCount].intValue);
    
    fullString = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam interdum magna id metus euismod, eu consectetur neque posuere. Etiam quis. ";
    
    XCTAssertEqual([fullString tc_wordCount].intValue, 20, @"TRAILING WHITE SPACE: String has 20 words, wordCount supplied %d", [fullString tc_wordCount].intValue);
    
    fullString = @" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam interdum magna id metus euismod, eu consectetur neque posuere. Etiam quis.";
    
    XCTAssertEqual([fullString tc_wordCount].intValue, 20, @"LEADING WHITE SPACE: String has 20 words, wordCount supplied %d", [fullString tc_wordCount].intValue);
}

//
//TEST NOTES
//
//If a string is ended with a new line character, this does not create a new line.  This simply ends the current line.  If there is any data after the newline character, a new line is then created.
// 
// Example: "\n" produces 1 new line.
//          "\n\n" produces 2 new lines.
//          "\n\n a" produces 3 new lines.
// 

- (void)testLineCount
{
    NSString *fullString = @"a";
    
    XCTAssertEqual([fullString tc_lineCount].intValue, 1, @"String has 1 lines, lineCount supplied %d", [fullString tc_lineCount].intValue);
    
    fullString = @"a \n a";
    
    XCTAssertEqual([fullString tc_lineCount].intValue, 2, @"String has 2 lines, lineCount supplied %d", [fullString tc_lineCount].intValue);
    
    fullString = @"\n";
    
    XCTAssertEqual([fullString tc_lineCount].intValue, 1, @"String has 1 lines, lineCount supplied %d", [fullString tc_lineCount].intValue);
    
    fullString = @"\n\n";
    
    XCTAssertEqual([fullString tc_lineCount].intValue, 2, @"String has 2 lines, lineCount supplied %d", [fullString tc_lineCount].intValue);
    
    fullString = @"\n\n a";
    
    XCTAssertEqual([fullString tc_lineCount].intValue, 3, @"String has 3 lines, lineCount supplied %d", [fullString tc_lineCount].intValue);
    
    fullString = @"\n a \n";
    
    XCTAssertEqual([fullString tc_lineCount].intValue, 2, @"String has 2 lines, lineCount supplied %d", [fullString tc_lineCount].intValue);
    
    fullString = @"\n a \n a";
    
        XCTAssertEqual([fullString tc_lineCount].intValue, 3, @"String has 3 lines, lineCount supplied %d", [fullString tc_lineCount].intValue);
}

- (void)testSentenceCount
{
    NSString *fullString = @"Here is a sentence.";
    
    XCTAssertEqual([fullString tc_sentenceCount].intValue, 1, @"String has 1 sentence, sentenceCount supplied %d", [fullString tc_sentenceCount].intValue);
    
    fullString = @"Here is a sentence. Here is a second sentence.";
    
    XCTAssertEqual([fullString tc_sentenceCount].intValue, 2, @"String has 2 sentence, sentenceCount supplied %d", [fullString tc_sentenceCount].intValue);
    
    fullString = @"Here is a loud sentence!";
    
    XCTAssertEqual([fullString tc_sentenceCount].intValue, 1, @"EXCLAMATION POINT: String has 1 sentence, sentenceCount supplied %d", [fullString tc_sentenceCount].intValue);
    
    fullString = @"Here is a loud sentence! Here is a second loud sentence!";
    
    XCTAssertEqual([fullString tc_sentenceCount].intValue, 2, @"EXCLAMATION POINT: String has 2 sentence, sentenceCount supplied %d", [fullString tc_sentenceCount].intValue);
    
    fullString = @"This sentence sounds mysterious...";
    
    XCTAssertEqual([fullString tc_sentenceCount].intValue, 1, @"ELLIPSES: String has 1 sentence, sentenceCount supplied %d", [fullString tc_sentenceCount].intValue);
    
    fullString = @"This sentence sounds mysterious... It isn't, however.";
    
    XCTAssertEqual([fullString tc_sentenceCount].intValue, 2, @"ELLIPSES: String has 2 sentence, sentenceCount supplied %d", [fullString tc_sentenceCount].intValue);
    
    fullString = @"This sentence sounds mysterious........";
    
    XCTAssertEqual([fullString tc_sentenceCount].intValue, 1, @"TRAILING DOTS: String has 1 sentence, sentenceCount supplied %d", [fullString tc_sentenceCount].intValue);
    
    fullString = @"I'm Ron Burgandy?";
    
    XCTAssertEqual([fullString tc_sentenceCount].intValue, 1, @"QUESTION MARK: String has 1 sentence, sentenceCount supplied %d", [fullString tc_sentenceCount].intValue);
    
    fullString = @"I'm Ron Burgandy? This is a second sentence.";
    
    XCTAssertEqual([fullString tc_sentenceCount].intValue, 2, @"QUESTION MARK: String has 2 sentence, sentenceCount supplied %d", [fullString tc_sentenceCount].intValue);
    
    
}


@end
