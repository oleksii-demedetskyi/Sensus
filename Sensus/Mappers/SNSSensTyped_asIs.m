//
//  SNSSensTyped_asIs.m
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSensTyped_asIs.h"
#import "SNSSensImpl.h"

@interface SNSSensTyped_asIs_Impl : SNSSensTypedImpl<_SNSSensTyped_asIs>
@end

@implementation SNSSensTyped_asIs_Impl

- (id)required {
    NSAssert(self.value != nil, @"Required asssertion broken.");
    return self.value;
}

- (id)optional {
    return self.value;
}

- (id (^)(id))withDefault
{
    return ^(id defaultValue) {
        return self.value ?: defaultValue;
    };
}

@end

@implementation SNSSensTypeSelectorImpl (_asIs)

- (_SNSRoot<_SNSSensTyped_asIs> *)asIs {
    return (_SNSRoot<_SNSSensTyped_asIs> *)[SNSSensTyped_asIs_Impl sensTypedWithValue:self.value];
}

@end