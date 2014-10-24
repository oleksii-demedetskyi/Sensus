//
//  SNSSensTyped_asInteger.m
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSensTyped_asInteger.h"
#import "SNSSensImpl.h"

@interface SNSSensTyped_asInteger_Impl : SNSSensTypedImpl<_SNSSensTyped_asInteger>
@end

@implementation SNSSensTyped_asInteger_Impl

- (NSInteger)required
{
    NSAssert(self.value != nil, @"Required asssertion broken.");
    
    if ([self.value isKindOfClass:[NSNumber class]]) {
        return [self.value integerValue];
    }
    if ([self.value isKindOfClass:[NSString class]]) {
        return [self.value integerValue];
    }
    
    [NSException raise:@"Wrong type exception"
                format:@"Value: %@ cannot be casted to Integer", self.value];
    return 0;
}

- (NSInteger (^)(NSInteger))withDefault
{
    return ^(NSInteger defaultValue) {
        if ([self.value isKindOfClass:[NSNumber class]]) {
            return [self.value integerValue];
        }
        if ([self.value isKindOfClass:[NSString class]]) {
            return [self.value integerValue];
        }
        
        return defaultValue;
    };
}

@end

@implementation SNSSensTypeSelectorImpl (_asInteger)

- (_SNSRoot<_SNSSensTyped_asInteger> *)asInteger {
    return (_SNSRoot<_SNSSensTyped_asInteger> *)[SNSSensTyped_asInteger_Impl sensTypedWithValue:self.value];
}

@end