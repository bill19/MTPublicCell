//
//  AppDelegate.m
//  MTPublicCell
//
//  Created by HaoSun on 16/10/25.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark --------test method(save LogInfo to File)--------
- (void)redirectNSlogToDocumentFolder
{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"LogInfo.log"];
    NSString *logFilePath = [documentDirectory stringByAppendingPathComponent:fileName];
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+", stderr);
}

void UncaughtExceptionHandler(NSException *exception) {
    NSArray *arr = [exception callStackSymbols];//得到当前调用栈信息
    NSString *reason = [exception reason];//非常重要，就是崩溃的原因
    NSString *name = [exception name];//异常类型
    NSLog(@"********************************** start record crash log **************************************");
    NSLog(@"exception type : %@ \n crash reason : %@ \n call stack info : %@", name, reason, arr);
    NSLog(@"********************************** end record crash log **************************************");
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    //These code will cause that logInfo is saved to File

    UIDevice *device = [UIDevice currentDevice];
    if (![[device model]isEqualToString:@"iPad Simulator"]) {
        NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);//记录异常
        [self redirectNSlogToDocumentFolder];//将NSLog信息重定向到文件
    }
    //后面的代码省略


    // Override point for customization after application launch.
    //控制器1s
    ViewController *vc1 = [[ViewController alloc] init];
    UITabBarController *tabbarVc = [[UITabBarController alloc] init];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"111111" image:[[UIImage imageNamed:@"MyP"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"MyP"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tabbarVc.tabBarItem = item1;
    UINavigationController *oneVC = [[UINavigationController alloc] initWithRootViewController:vc1];

    //控制器2s
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"222222" image:[[UIImage imageNamed:@"MyP"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"MyP"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tabbarVc.tabBarItem = item2;
    UINavigationController *twoVC = [[UINavigationController alloc] initWithRootViewController:vc2];


    //控制器3s
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"333333" image:[[UIImage imageNamed:@"MyP"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"MyP"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tabbarVc.tabBarItem = item3;
    UINavigationController *thirdVC = [[UINavigationController alloc] initWithRootViewController:vc3];


    tabbarVc.viewControllers = @[oneVC,twoVC,thirdVC];

    self.window.rootViewController = tabbarVc;





    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"MTPublicCell"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
