//
//  ViewController.m
//  dispatch_semaphore_demo
//
//  Created by JHKtest on 2020/12/16.
//

#import "ViewController.h"

#import "NSDate+Z.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self kaddTapGes:self.view sel:@selector(tapActioSelf)];
}

- (void)kaddTapGes:(UIView *)view sel:(SEL)sel {
    view.userInteractionEnabled = true;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel];
    [view addGestureRecognizer:tap];
}
- (void)tapActioSelf{
    NSLog(@"--- self ---");


    //常见异常1---不存在方法引用

 //    [self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];

     //常见异常2---键值对引用nil

 //    [[NSMutableDictionary dictionary] setObject:nil forKey:@"nil"];

     //常见异常3---数组越界

     [[NSArray array] objectAtIndex:1];

     //常见异常4---memory warning 级别3以上

 //    [self performSelector:@selector(killMemory) withObject:nil];

     //其他大家去想吧

}






@end
