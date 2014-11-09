//
//  SNSSensTyped_asArray.h
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import <Sensus/Core/SNSSens.h>

@protocol _SNSSensTyped_asArray

@property (nonatomic, readonly) NSArray* required;
@property (nonatomic, readonly) NSArray* optional;
@property (nonatomic, readonly) NSArray*(^withDefault)(NSArray* defaultValue);

@end

@interface _SNSSensTypeSelector (_asArray)

@property (nonatomic, readonly) _SNSRoot<_SNSSensTyped_asArray>* asArray;

@end