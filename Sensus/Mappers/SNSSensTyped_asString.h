//
//  SNSSensTyped_asString.h
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSens.h"

@protocol _SNSSensTyped_asString

@property (nonatomic, readonly) NSString* required;
@property (nonatomic, readonly) NSString* optional;
@property (nonatomic, readonly) NSString*(^withDefault)(NSString* defaultValue);

@end

@interface _SNSSensTypeSelector (_asString)

@property (nonatomic, readonly) _SNSRoot<_SNSSensTyped_asString>* asString;

@end