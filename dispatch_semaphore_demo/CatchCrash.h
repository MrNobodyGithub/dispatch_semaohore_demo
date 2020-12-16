//
//  CatchCrash.h
//  dispatch_semaphore_demo
//
//  Created by JHKtest on 2020/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatchCrash : NSObject


void uncaughtExceptionHandler(NSException * exception);

@end

NS_ASSUME_NONNULL_END
