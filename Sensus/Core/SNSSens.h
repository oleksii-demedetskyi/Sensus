//
//  SNSSens.h
//  Sensus
//
//  Created by Алексей Демедецкий on 24.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Sensus/Core/SNSRoot.h>

#pragma mark Sens creation

@protocol _SNSSens;
_SNSRoot<_SNSSens>* SNSSensOf(NSDictionary* d);


#pragma mark Sens DSL

@class _SNSSensTypeSelector;
@protocol _SNSSens

@property (nonatomic, readonly) _SNSSensTypeSelector* (^of) (NSString* key);

@end


/// Concrete type selectors should be added over additions
@interface _SNSSensTypeSelector : _SNSRoot
@end



























