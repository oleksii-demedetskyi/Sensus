//
//  SNSSensTyped_asArray.m
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSensTyped_asArray.h"
#import "SNSSensImpl.h"

@interface SNSSensTyped_asArray_Impl : SNSSensTypedImpl<_SNSSensTyped_asArray>
@end

@implementation SNSSensTyped_asArray_Impl

- (NSArray *)optional
{
    if ([self.value isKindOfClass:[NSArray class]]) return self.value;
    
    return nil;
}

- (NSArray *)required
{
    NSAssert(self.value != nil, @"Required asssertion broken.");
    
    NSArray* array = [self optional];
    if (array != nil) return array;
    
    [NSException raise:@"Wrong type exception"
                format:@"Value: %@ cannot be casted to array", self.value];
    return nil;
}

- (NSArray *(^)(NSArray *))withDefault
{
    return ^(NSArray* defaultValue) {
        return [self optional] ?: defaultValue;
    };
}

@end

@implementation SNSSensTypeSelectorImpl (_asArray)

- (_SNSRoot<_SNSSensTyped_asArray> *)asArray
{
    return (_SNSRoot<_SNSSensTyped_asArray> *)[SNSSensTyped_asArray_Impl sensTypedWithValue:self.value];
}

@end
