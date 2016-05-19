//
//  NSStringTests.m
//  ThunderCats
//
//  Copyright (c) 2015 Metova Inc.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import <XCTest/XCTest.h>
#import "NSString+TCAdditions.h"


@interface NSStringTests : XCTestCase

@end


@implementation NSStringTests

- (void)testValidUUIDFormat
{
    NSString *uuid = [NSString tc_UUID];
    XCTAssertEqual(uuid.length, 36, @"UUID should have 36 characters total");
    XCTAssertEqual([uuid stringByReplacingOccurrencesOfString:@"-" withString:@""].length, 32, @"UUID should have 32 hexadecimal digits");
    XCTAssertEqual([uuid componentsSeparatedByString:@"-"].count, 5, @"UUID should have 5 components separated by dashes");
    
    NSCharacterSet *uuidCharacters = [NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefABCDEF-"];
    XCTAssertEqual([uuid rangeOfCharacterFromSet:[uuidCharacters invertedSet]].location, NSNotFound);
}


- (void)testValidEmails
{
    NSArray *addresses = @[@"test@example.com",
                           @"test.test@mail.example.co.uk",
                           @"test.test@example.com",
                           @"a.nonymous@example.com",
                           @"name+tag@example.com",
                           @"a.name+tag@example.com",
                           @"Capital@lowercase.com",
                           @"lowercase@Capital.com",
                           @"case@test.Com"];
    
    for (NSString *emailAddress in addresses)
    {
        XCTAssertTrue([emailAddress tc_isValidEmailAddressFormat], @"The following address should succeed: %@", emailAddress);
    }
}


- (void)testInvalidEmails
{
    NSArray *addresses = @[@"me@",
                           @"@example.com",
                           @"me.@example.com",
                           @".me@example.com",
                           @"me@example..com",
                           @"me\\@example.com"];
    
    for (NSString *emailAddress in addresses)
    {
        XCTAssertFalse([emailAddress tc_isValidEmailAddressFormat], @"The following address should fail: %@", emailAddress);
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
}


- (void)testContainsStringFails
{
    NSString *fullString = @"This is a string";
    NSString *subString = @"xyz";
    XCTAssertFalse([fullString tc_containsString:subString], @"Should fail on invalid substring");
    
    fullString = @"This is a string";
    subString = @"";
    XCTAssertFalse([fullString tc_containsString:subString], @"Should not contain an empty string");
    
    fullString = @"";
    subString = @"";
    XCTAssertFalse([fullString tc_containsString:subString], @"An empty string ");
}


- (void)testWordCount
{
    NSString *fullString = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam interdum magna id metus euismod, eu consectetur neque posuere. Etiam quis.";
    XCTAssertEqual([fullString tc_wordCount].intValue, 20, @"String has 20 words, wordCount supplied %d", [fullString tc_wordCount].intValue);
    
    fullString = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam interdum magna id metus euismod, eu consectetur neque posuere. Etiam quis. ";
    XCTAssertEqual([fullString tc_wordCount].intValue, 20, @"TRAILING WHITE SPACE: String has 20 words, wordCount supplied %d", [fullString tc_wordCount].intValue);
    
    fullString = @" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam interdum magna id metus euismod, eu consectetur neque posuere. Etiam quis.";
    XCTAssertEqual([fullString tc_wordCount].intValue, 20, @"LEADING WHITE SPACE: String has 20 words, wordCount supplied %d", [fullString tc_wordCount].intValue);
    
    XCTAssertEqual([@"" tc_wordCount].intValue, 0);
    XCTAssertEqual([@" " tc_wordCount].intValue, 0);
}

/*
    TEST NOTES

    If a string is ended with a new line character, this does not create a new line.  This simply ends the current line.  If there is any data after the newline character, a new line is then created.
 
    Example: "\n" produces 1 new line.
             "\n\n" produces 2 new lines.
             "\n\n a" produces 3 new lines.
 */

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
