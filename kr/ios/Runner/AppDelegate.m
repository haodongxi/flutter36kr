#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    // 获取电池电量
    FlutterViewController *controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel *batteryLevelChannel = [FlutterMethodChannel methodChannelWithName:@"com.bankcomm.muip" binaryMessenger:controller];
    [batteryLevelChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"test" isEqualToString:call.method]) {
            [[[UIAlertView alloc]initWithTitle:call.arguments[@"appId"] message:@"2" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil]show];
            return;
        }
        result(FlutterMethodNotImplemented);
    }];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
