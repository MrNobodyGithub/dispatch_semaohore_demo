//
//  NSDate+Z.h
//  sunFlower
//
//  Created by jason on 2017/6/30.
//  Copyright © 2017年 haier. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSDate (Z)
+ (NSString *)dateGetStrWithTimestamp:(NSNumber*)timeStamp;
+ (NSString *)dateGetStrWithNSTimeInterval:(NSTimeInterval)timeInterval;
+ (NSTimeInterval)dateGetNSTimeIntervalWithDate:(NSDate*)date;
+ (NSDate *)dateGetDataWithNSTimeInterval:(NSTimeInterval)timeInterval;
//NSDATE --> NSString
+ (NSString *)dateGetNSStringWithNSDate:(NSDate *)date;
+ (NSDate *)dateGetDataWithString:(NSString *)str;
@end
