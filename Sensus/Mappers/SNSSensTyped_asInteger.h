//
//  SNSSensTyped_asInteger.h
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import <Sensus/Core/SNSSens.h>

@protocol _SNSSensTyped_asInteger

@property (nonatomic, readonly) NSInteger required;
@property (nonatomic, readonly) NSInteger(^withDefault)(NSInteger defaultValue);

@end

@interface _SNSSensTypeSelector (_asInteger)

@property (nonatomic, readonly) _SNSRoot<_SNSSensTyped_asInteger>* asInteger;

@end
