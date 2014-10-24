//
//  SNSSensTyped_asDate.m
//  Sensus
//
//  Created by Алексей Демедецкий on 25.10.14.
//  Copyright (c) 2014 DAloG. All rights reserved.
//

#import "SNSSensTyped_asDate.h"
#import "SNSSensImpl.h"


@interface SNSSensTyped_asDate_Impl : SNSSensTypedImpl<_SNSSensTyped_asDate>
@end

@implementation SNSSensTyped_asDate_Impl

- (NSDate *)dateFromISOString:(NSString*)string
{
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    });
    return [formatter dateFromString:string];
}

- (NSDate *)dateFromDotNetJSONString:(NSString *)string
{
    static NSRegularExpression *dateRegEx = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString* pattern = @"^\\/date\\((-?\\d++)(?:([+-])(\\d{2})(\\d{2}))?\\)\\/$";
        dateRegEx = [[NSRegularExpression alloc] initWithPattern:pattern
                                                         options:NSRegularExpressionCaseInsensitive
                                                           error:nil];
    });
    NSTextCheckingResult *regexResult = [dateRegEx firstMatchInString:string
                                                              options:0
                                                                range:NSMakeRange(0, [string length])];
    
    if (regexResult)
    {
        // milliseconds
        NSTimeInterval seconds = [[string substringWithRange:[regexResult rangeAtIndex:1]] doubleValue] / 1000.0;
        // timezone offset
        if ([regexResult rangeAtIndex:2].location != NSNotFound) {
            NSString *sign = [string substringWithRange:[regexResult rangeAtIndex:2]];
            // hours
            seconds += [[NSString stringWithFormat:@"%@%@", sign,
                         [string substringWithRange:[regexResult rangeAtIndex:3]]] doubleValue] * 60.0 * 60.0;
            // minutes
            seconds += [[NSString stringWithFormat:@"%@%@", sign,
                         [string substringWithRange:[regexResult rangeAtIndex:4]]] doubleValue] * 60.0;
        }
        
        return [NSDate dateWithTimeIntervalSince1970:seconds];
    }
    return nil;
}

- (NSDate *)required
{
    NSAssert(self.value != nil, @"Required asssertion broken.");
    
    NSDate* date = [self optional];
    if (date != nil) return date;
    
    [NSException raise:@"Wrong type exception"
                format:@"Unable to parser date value from %@",self.value];
    return nil;
}

- (NSDate *)optional
{
    if ([self.value isKindOfClass:[NSDate class]]) return self.value;
    
    if ([self.value isKindOfClass:[NSString class]]) {
        {
            NSDate* date = [self dateFromDotNetJSONString:self.value];
            if (date != nil) return date;
        }{
            NSDate* date = [self dateFromISOString:self.value];
            if (date != nil) return date;
        }
    }
    
    return nil;
}

- (NSDate *(^)(NSDate *))withDefault
{
    return ^(NSDate* defaultDate) {
        return [self optional] ?: defaultDate;
    };
}

@end

@implementation SNSSensTypeSelectorImpl (_asDate)

- (_SNSRoot<_SNSSensTyped_asDate> *)asDate {
    return (_SNSRoot<_SNSSensTyped_asDate> *)[SNSSensTyped_asDate_Impl sensTypedWithValue:self.value];
}

@end