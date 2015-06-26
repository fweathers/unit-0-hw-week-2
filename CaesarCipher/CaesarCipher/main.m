//
//  main.m
//  CaesarCipher
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaesarCipher : NSObject

- (NSString *)encode:(NSString *)string offset:(int)offset;
- (NSString *)decode:(NSString *)string offset:(int)offset;
- (BOOL)codeBreaker:(NSString *)cipherOne
          compareTo:(NSString *)cipherTwo;
@end


@implementation CaesarCipher

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    NSString *str = [string lowercaseString];
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [str getCharacters:buffer range:NSMakeRange(0, count)];
    
    char allchars[] = "abcdefghijklmnopqrstuvwxyz";
    
    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        char *e = strchr(allchars, buffer[i]);
        int idx= (int)(e - allchars);
        int new_idx = (idx + offset) % strlen(allchars);
        
        result[i] = allchars[new_idx];
    }
    
    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}


- (BOOL)codeBreaker:(NSString *)stringOne
          compareTo:(NSString *)stringTwo {
    for (int i = 0; i < 26; i++) {
        if([stringOne isEqualTo:[self encode:stringTwo offset:i]]) { //Are the two strings the same input message
            return YES;
        }
    }
    return NO;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        CaesarCipher *cipherOne=[[CaesarCipher alloc] init];
        
        NSString *message= @"Please Work";
        NSString *stringTwo = [cipherOne encode:message offset:2];
        NSString *cipherOutput = [cipherOne decode:stringTwo offset:2];
        
        NSLog(@"%@", message);
        NSLog(@"%@", stringTwo);
        NSLog(@"%@", cipherOutput);
        
        if ([cipherOne isEqualTo:stringTwo stringOne:[cipherOne encode:@"Please Work" offset:3]]) {
            NSLog(@"Yes the two inputs match");
        }
        else {
            NSLog(@"Not the same inputs");
        }
    }
}