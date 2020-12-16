//
//  CatchCrash.m
//  dispatch_semaphore_demo
//
//  Created by JHKtest on 2020/12/16.
//

#import "CatchCrash.h"
#import "NSDate+Z.h"

@implementation CatchCrash


void uncaughtExceptionHandler(NSException * exception)
{
    NSArray * arrStack = [exception callStackSymbols];//异常堆栈信息
    NSString * strReason = [exception reason];        //出现异常的原因
    NSString * strName = [exception name];            //异常名称
    NSString * strExceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",strName, strReason, arrStack];
 

    NSMutableArray * mutArr = [NSMutableArray arrayWithArray:arrStack];
    [mutArr insertObject:strReason atIndex:0];

    NSString * path = [NSHomeDirectory() stringByAppendingString:@"/Documents/"];

    NSString * strDate = [NSDate dateGetNSStringWithNSDate:[NSDate date]];
    NSString * fileName = [strDate stringByAppendingString:@"_error.log"];
    NSString * filePath = [path stringByAppendingString:fileName];
    [strExceptionInfo writeToFile:filePath atomically:true encoding:NSUTF8StringEncoding error:nil];


//    [self sendCrashLog:exception.description];

    sendCrashLog(exception.description);
}



// 通过post 或者 get 方式来将异常信息发送到服务器

void sendCrashLog(NSString * crashLog) {

    dispatch_semaphore_t semophore = dispatch_semaphore_create(0); // 创建信号量
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"your url"]];
    [request setHTTPMethod:@"POST"];
    request.HTTPBody = [[NSString stringWithFormat:@"crash=%@",crashLog]dataUsingEncoding:NSUTF8StringEncoding];
    [[session dataTaskWithRequest:request
    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"response%@",response);
        dispatch_semaphore_signal(semophore); // 发送信号
    }] resume];

    dispatch_semaphore_wait(semophore, DISPATCH_TIME_FOREVER); // 等待
}

@end
