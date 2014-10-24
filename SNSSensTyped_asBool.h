//
//  SNSSensTyped_asBool.h
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSens.h"

@protocol _SNSSensTyped_asBool

@property (nonatomic, readonly) BOOL required;
@property (nonatomic, readonly) BOOL(^withDefault)(BOOL defaultValue);

@end

@interface _SNSSensTypeSelector (_asBool)

@property (nonatomic, readonly) _SNSRoot<_SNSSensTyped_asBool>* asBool;

@end
