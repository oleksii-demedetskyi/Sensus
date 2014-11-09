//
//  SNSSensTyped_asDate.h
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import <Sensus/Core/SNSSens.h>

@protocol _SNSSensTyped_asDate

@property (nonatomic, readonly) NSDate* required;
@property (nonatomic, readonly) NSDate* optional;
@property (nonatomic, readonly) NSDate*(^withDefault)(NSDate* defaultValue);

@end

@interface _SNSSensTypeSelector (_asDate)

@property (nonatomic, readonly) _SNSRoot<_SNSSensTyped_asDate>* asDate;

@end