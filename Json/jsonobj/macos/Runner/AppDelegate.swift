import Cocoa
import FlutterMacOS
import flutter_local_notifications

@main
class AppDelegate: FlutterAppDelegate {
  
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    // Properly registering the plugin
    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
      GeneratedPluginRegistrant.register(with: registry)
    }
    GeneratedPluginRegistrant.register(with: self) // Register plugins
    
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    // Check for macOS app with notification support (this would be used for iOS)
    if #available(iOS 10.0, *) {
      // Set up delegate for notifications (for iOS, not macOS)
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    return true
  }
}
