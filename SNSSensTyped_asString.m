//
//  SNSSensTyped_asString.m
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSensTyped_asString.h"
#import "SNSSensImpl.h"

@interface SNSSensTyped_asString_Impl : SNSSensTypedImpl<_SNSSensTyped_asString>
@end

@implementation SNSSensTyped_asString_Impl

- (NSString *)optional
{
    if ([self.value isKindOfClass:[NSString class]]) return self.value;
    if ([self.value isKindOfClass:[NSNumber class]]) return [(NSNumber*)self.value stringValue];
    
    return nil;
}

- (NSString *)required
{
    NSAssert(self.value != nil, @"Required asssertion broken.");
    
    NSString* string = [self optional];
    if (string != nil) return string;
    
    [NSException raise:@"Wrong type exception"
                format:@"Unable to parser string value from %@",self.value];
    return nil;
    
}

- (NSString *(^)(NSString *))withDefault
{
    return ^(NSString* defaultValue) {
        return [self optional] ?: defaultValue;
    };
}

@end

@implementation SNSSensTypeSelectorImpl (_asString)

- (_SNSRoot<_SNSSensTyped_asString> *)asString {
    return (_SNSRoot<_SNSSensTyped_asString> *)[SNSSensTyped_asString_Impl sensTypedWithValue:self.value];
}

@end
