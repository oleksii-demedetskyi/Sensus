//
//  SNSSensTyped_asBool.m
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSensTyped_asBool.h"
#import "SNSSensImpl.h"

@interface SNSSensTyped_asBool_Impl : SNSSensTypedImpl<_SNSSensTyped_asBool>
@end

@implementation SNSSensTyped_asBool_Impl

- (BOOL)required
{
    NSAssert(self.value != nil, @"Required asssertion broken.");
    
    if ([self.value isKindOfClass:[NSNumber class]]) {
        return [self.value boolValue];
    }
    if ([self.value isKindOfClass:[NSString class]]) {
        return [self.value boolValue];
    }
    
    [NSException raise:@"Wrong type exception"
                format:@"Value: %@ cannot be casted to BOOL", self.value];
    return 0;
}

- (BOOL (^)(BOOL))withDefault
{
    return ^(BOOL defaultValue) {
        if ([self.value isKindOfClass:[NSNumber class]]) {
            return [self.value boolValue];
        }
        if ([self.value isKindOfClass:[NSString class]]) {
            return [self.value boolValue];
        }
        
        return defaultValue;
    };
}

@end

@implementation SNSSensTypeSelectorImpl (_asBool)

- (_SNSRoot<_SNSSensTyped_asBool> *)asBool
{
    return (_SNSRoot<_SNSSensTyped_asBool> *)[SNSSensTyped_asBool_Impl sensTypedWithValue:self.value];
}

@end
