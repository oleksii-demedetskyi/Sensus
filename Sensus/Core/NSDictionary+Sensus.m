//
//  NSDictionary+Sesnus.m
//  Sensus
//
//  Created by Алексей Демедецкий on 24.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "NSDictionary+Sensus.h"
#import "SNSSens.h"
#import <objc/runtime.h>

@implementation NSDictionary (Sensus)

- (_SNSRoot<_SNSSens> *)sens
{
    id sens = objc_getAssociatedObject(self, @"com.sens");
    if (sens != nil) {
        NSAssert([sens conformsToProtocol:@protocol(_SNSSens)], @"Incorrect sens class in dict association: %@", sens);
        
        return sens;
    }
    
    sens = SNSSensOf(self);
    objc_setAssociatedObject(self, @"com.sens", sens, OBJC_ASSOCIATION_RETAIN);
    
    return sens;
}

@end
