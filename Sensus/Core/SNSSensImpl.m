//
//  SNSSensImpl.m
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSensImpl.h"


_SNSRoot<_SNSSens>* SNSSensOf(NSDictionary* data) {
    return (_SNSRoot<_SNSSens>*)[SNSSensImpl sensOfData:data];
}


@implementation SNSSensImpl

- (instancetype)initWithSensData:(NSDictionary*)data {
    self = [super init];
    if (self == nil) return nil;
    
    NSAssert(data != nil, @"Sens of emptyness is madness. nil has no sens");
    NSAssert(data.allKeys.count > 0, @"Empty box has no sens. %@ is empty", data);
    
    self.sensData = data;
    
    return self;
}

+ (instancetype)sensOfData:(NSDictionary *)data
{
    return [[self alloc] initWithSensData:data];
}

- (_SNSSensTypeSelector* (^)(NSString* key))of
{
    return ^(NSString* key) {
        id value = self.sensData[key];
        
        if (value == nil) {
            value = [self.sensData valueForKey:key];
        }
        
        if (value == nil) {
            value = [self.sensData valueForKeyPath:key];
        }
        
        return (_SNSSensTypeSelector*)[SNSSensTypeSelectorImpl selectorForValue:value];
    };
}

@end

@implementation SNSSensTypeSelectorImpl

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if (self == nil) return nil;
    
    _value = value;
    
    return self;
}

+ (instancetype)selectorForValue:(id)value
{
    return [[self alloc] initWithValue:value];
}

@end


@implementation SNSSensTypedImpl

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if (self == nil) return nil;
    
    _value = value;
    
    return self;
}

+ (instancetype)sensTypedWithValue:(id)value
{
    return [[self alloc] initWithValue:value];
}

@end
