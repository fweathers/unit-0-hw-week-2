//
//  main.m
//  Person
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person: NSObject

- (BOOL)checkSameCity: (Person *) person;
- (Person *)registerChild;

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setCity:(NSString *)city;
- (NSString *)city;

- (void)setPhoneNumber:(NSString *)phoneNumber;
- (NSString *)phoneNumber;

@end

@implementation Person {
    NSString *_name;
    NSString *_phoneNumber;
    NSString *_city;
}

- (BOOL)checkSameCity: (Person *) person {
    if ([[person city]isEqualToString:[self city]]) {
        return YES;
    } else {
        return NO;
    }
}

- (Person *)registerChild {
    Person *Abc = [[Person alloc] init];
    [Abc setPhoneNumber:[self phoneNumber]];
    [Abc setCity: [self city]];
    
    return Abc;
}


- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

- (void)setCity:(NSString *)city {
    _city = city;
}

- (NSString *)city {
    return _city;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}

- (NSString *)phoneNumber {
    return _phoneNumber;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *Parent = [[Person alloc] init];
        [Parent setCity: @"Long Island City"];
        [Parent setPhoneNumber: @"1234"];
        
        Person *B = [[Person alloc] init];
        [B setCity: @"Long Island City"];
        
        NSLog(@"%d ",[B checkSameCity: Parent]);
    
        
        Person *Abc = [Parent registerChild];
        NSLog(@"Parent lives in %@ and child lives in %@ \n", [Parent city], [Abc city]);
        NSLog(@"Parent phone number ends with %@ and child phone number ends with %@", [Parent phoneNumber], [Abc phoneNumber]);
        
    }
    return 0;
}
