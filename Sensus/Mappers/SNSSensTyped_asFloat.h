//
//  SNSSensTyped_asFloat.h
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import <Sensus/Core/SNSSens.h>

@protocol _SNSSensTyped_asFloat

@property (nonatomic, readonly) float required;
@property (nonatomic, readonly) float (^withDefault)(float defaultValue);

@end

@interface _SNSSensTypeSelector (_asFloat)

@property (nonatomic, readonly) _SNSRoot<_SNSSensTyped_asFloat>* asFloat;

@end