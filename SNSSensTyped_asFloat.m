//
//  SNSSensTyped_asFloat.m
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSensTyped_asFloat.h"
#import "SNSSensImpl.h"

@interface SNSSensTyped_asFloat_Impl :SNSSensTypedImpl<_SNSSensTyped_asFloat>
@end

@implementation SNSSensTyped_asFloat_Impl

- (float)required
{
    NSAssert(self.value != nil, @"Required violation broken!");
    
    if ([self.value isKindOfClass:[NSNumber class]]) return [self.value floatValue];
    if ([self.value isKindOfClass:[NSString class]]) return [self.value floatValue];
    
    [NSException raise:@"Wrong type exception"
                format:@"Value: %@ cannot be casted to Integer", self.value];
    return 0;
}

- (float (^)(float))withDefault
{
    return ^(float defaultValue) {
        if ([self.value isKindOfClass:[NSNumber class]]) return [self.value floatValue];
        if ([self.value isKindOfClass:[NSString class]]) return [self.value floatValue];
        
        return defaultValue;
    };
}

@end

@implementation SNSSensTypeSelectorImpl (_asFloat)

- (_SNSRoot<_SNSSensTyped_asFloat> *)asFloat {
    return (_SNSRoot<_SNSSensTyped_asFloat>*)[SNSSensTyped_asFloat_Impl sensTypedWithValue:self.value];
}

@end
