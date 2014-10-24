//
//  SNSSensTyped_asDictionary.m
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSensTyped_asDictionary.h"
#import "SNSSensImpl.h"

@interface SNSSensTyped_asDictionary_Impl : SNSSensTypedImpl<_SNSSensTyped_asDictionary>
@end

@implementation SNSSensTyped_asDictionary_Impl

- (NSDictionary *)optional
{
    if ([self.value isKindOfClass:[NSDictionary class]]) return self.value;
    
    return nil;
}

- (NSDictionary *)required
{
    NSAssert(self.value != nil, @"Required asssertion broken.");
    
    NSDictionary* dict = [self optional];
    if (dict != nil) return dict;
    
    [NSException raise:@"Wrong type exception"
                format:@"Value: %@ cannot be casted to Dictionary", self.value];
    return nil;
}

- (NSDictionary *(^)(NSDictionary *))withDefault
{
    return ^(NSDictionary* defaultValue) {
        return [self optional] ?: defaultValue;
    };
}

@end

@implementation SNSSensTypeSelectorImpl (_asDictionary)

- (_SNSRoot<_SNSSensTyped_asDictionary> *)asDictionary
{
    return (_SNSRoot<_SNSSensTyped_asDictionary> *)[SNSSensTyped_asDictionary_Impl sensTypedWithValue:self.value];
}

@end
