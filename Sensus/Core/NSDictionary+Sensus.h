//
//  NSDictionary+Sesnus.h
//  Sensus
//
//  Created by Алексей Демедецкий on 24.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class _SNSRoot;
@protocol _SNSSens;
@interface NSDictionary (Sensus)

- (_SNSRoot<_SNSSens> *) sens;

@end
