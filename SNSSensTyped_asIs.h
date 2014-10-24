//
//  SNSSensTyped_asIs.h
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSens.h"

@protocol _SNSSensTyped_asIs

@property (nonatomic, readonly) id required;
@property (nonatomic, readonly) id optional;
@property (nonatomic, readonly) id(^withDefault)(id defaultValue);

@end

@interface _SNSSensTypeSelector (_asIs)

@property (nonatomic, readonly) _SNSRoot<_SNSSensTyped_asIs>* asIs;

@end

