//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "UMSocialQQHandler.h"
#import "UMSocial.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    /*
     qq应用：
    APP ID：1104539912
     App Key：eFVgRits2fgf63Jf
     友盟的：
     */
     [UMSocialData setAppKey:@"	5632e68367e58e1d95000c94"];
    [UMSocialQQHandler setQQWithAppId:@"1104539912" appKey:@"eFVgRits2fgf63Jf" url:@"http://www.umeng.com/social"];

    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}
@end
