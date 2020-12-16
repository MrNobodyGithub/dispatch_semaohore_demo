//
//  NSDate+Z.m
//  sunFlower
//
//  Created by jason on 2017/6/30.
//  Copyright © 2017年 haier. All rights reserved.
//

#import "NSDate+Z.h"

@implementation NSDate (Z)
+ (NSString *)dateGetStrWithTimestamp:(NSNumber*)timeStamp{
    NSString * str = [NSString stringWithFormat:@"%@",timeStamp];
    str = [str substringToIndex:10];
    NSString * newStr = [NSDate dateGetStrWithNSTimeInterval:[str doubleValue]];
    return newStr;
}
+ (NSString *)dateGetStrWithNSTimeInterval:(NSTimeInterval)timeInterval{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString * str = [NSDate dateGetNSStringWithNSDate:date];
    return str;
    
}
//NSDATE <-->NSTimeInterval
+(NSTimeInterval)dateGetNSTimeIntervalWithDate:(NSDate*)date{
    return [date timeIntervalSince1970];
}
+(NSDate *)dateGetDataWithNSTimeInterval:(NSTimeInterval)timeInterval{
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}
//NSDATE --> NSString
+ (NSString *)dateGetNSStringWithNSDate:(NSDate *)date{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZ"];
//    NSDate * date = [dateFormatter dateFromString:<#(nonnull NSString *)#>]
    NSString * str = [dateFormatter stringFromDate:date];
    return str;
}

+ (NSDate *)dateGetDataWithString:(NSString *)str{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZ"];
     return  [dateFormatter dateFromString:str];
}
@end
