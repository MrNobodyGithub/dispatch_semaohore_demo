//
//  AppDelegate.m
//  dispatch_semaphore_demo
//
//  Created by JHKtest on 2020/12/16.
//

#import "AppDelegate.h"
#import "CatchCrash.h"


@interface AppDelegate ()

@property (nonatomic,strong) NSTimer * timer;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

//    &uncaughtExceptionHandler(<#NSException * _Nonnull exception#>)
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    return YES;
}
-(void)applicationWillTerminate:(UIApplication *)application{


    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    static int i = 0;

    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:true block:^(NSTimer * _Nonnull timer) {
        i++;
        NSLog(@"---%ld---",(long)i);
        if (i>30) {
            dispatch_semaphore_signal(semaphore);
        }
    }];

    self.timer = timer;
    [timer fire];

    NSLog(@"---tttttttttttzzzzzzzz_1 %@---",@"1");
    dispatch_semaphore_wait(semaphore, 4);
    NSLog(@"---%@---",@"sleep start");
    sleep(4);
    NSLog(@"---%@---",@"sleep end");


}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
