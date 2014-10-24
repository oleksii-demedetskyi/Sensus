//
//  SNSSensTyped_asDictionary.h
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSens.h"

@protocol _SNSSensTyped_asDictionary

@property (nonatomic, readonly) NSDictionary* required;
@property (nonatomic, readonly) NSDictionary* optional;
@property (nonatomic, readonly) NSDictionary*(^withDefault)(NSDictionary* defaultValue);

@end
@interface _SNSSensTypeSelector (_asDictionary)

@property (nonatomic, readonly) _SNSRoot<_SNSSensTyped_asDictionary>* asDictionary;

@end
