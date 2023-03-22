import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyAGN6pRpRfs_PWaaqnjSV8o8tTBBEbh4Ec")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}



// ///////////////////////
// #include "AppDelegate.h"
// #include "GeneratedPluginRegistrant.h"
// import "GoogleMaps/GoogleMaps.h";

// @implementation AppDelegate
//
// - (BOOL)application:(UIApplication *)application
//     didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//   [GMSServices provideAPIKey:@"AIzaSyBWEZPyYHlPtOjeLYTVp9cgmExL5_8vNnQ"];
//   [GeneratedPluginRegistrant registerWithRegistry:self];
//   return [super application:application didFinishLaunchingWithOptions:launchOptions];
// }
// @end