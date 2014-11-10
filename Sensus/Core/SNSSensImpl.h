//
//  SNSSensImpl.h
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Sensus/Core/SNSSens.h>



@interface SNSSensImpl : NSObject<_SNSSens>

/// Link to dictionary is holded by ditionary
@property (nonatomic, weak) NSDictionary* sensData;

+ (instancetype)sensOfData:(NSDictionary* )data;

@end




@interface SNSSensTypeSelectorImpl : NSObject

@property (nonatomic, strong) id value;

+ (instancetype)selectorForValue:(id)value;

@end



@interface SNSSensTypedImpl: NSObject

@property (nonatomic, strong) id value;

+ (instancetype)sensTypedWithValue:(id)value;

@end
