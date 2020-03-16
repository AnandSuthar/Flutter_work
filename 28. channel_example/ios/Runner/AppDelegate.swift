import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var navigationController: UINavigationController?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    navigationController = UINavigationController(rootViewController: controller)
    self.window.rootViewController = navigationController
    
    
    let batteryChannel = FlutterMethodChannel(name: "sample.flutter.dev/battery", binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        
        if call.method == "twoPlusTwo" {
            self.twoPlusTwo(result: result)
        } else if call.method == "getBatteryLevel" {
            self.receiveBatteryLevel(result: result)
        } else if call.method == "pushOneVC" {
            self.pushOneVC(result: result)
        } else {
            result(FlutterMethodNotImplemented)
        }
        
    }
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
    
    }
    
    private func receiveBatteryLevel(result: FlutterResult) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == UIDevice.BatteryState.unknown {
            result(FlutterError(
                code: "UNAVAILABLE", message: "Battery info unavailable", details: nil)
            )
        } else {
            result(Int(device.batteryLevel * 100))
        }
    }
    
    private func twoPlusTwo(result: FlutterResult) {
        result(2)
    }
    
    private func pushOneVC(result: @escaping FlutterResult) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let paymentVC = storyboard.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        
        paymentVC.flutterResult = result

        
        self.navigationController?.pushViewController(paymentVC, animated: true)
        
    }
    
}
