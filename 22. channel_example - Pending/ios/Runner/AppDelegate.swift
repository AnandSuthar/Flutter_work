import UIKit
import Flutter
import os
import Foundation




@UIApplicationMain

@objc class AppDelegate: FlutterAppDelegate {
    
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/channel", binaryMessenger: controller)
    
    
    controller.setMessageHandlerOnChannel("foo") {
        (message: Data!, reply: FlutterBinaryReply) -> Void in
        let x : Float64 = message.subdata(in: 0..<8)
            .withUnsafeBytes { $0.pointee }
        let n : Int32 = message.subdata(in: 8..<12)
            .withUnsafeBytes { $0.pointee }
        os_log("Received %f and %d", x, n)
        reply(nil)
    }

    
    batteryChannel.setMethodCallHandler({[weak self](call: FlutterMethodCall, result: FlutterResult) -> Void in
        
        if call.method == "getBatteryLevel" {
            self?.receiveBatteryLevel(result: result)
        } else if call.method == "addToNumbers" {
            self?.addToNumbers(result: result)
        } else {
            result(FlutterMethodNotImplemented)
        }
        
    })
    
    os_log("Timer started")
    
    self.perform(#selector(self.timer), with: nil, afterDelay: 10)
    

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
  }
    
    
    @objc private func timer() {
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

//        var message = Data(capacity: 12)
//        var x : Float64 = 3.1415
//        var n : Int32 = 12345678
//        message.append(UnsafeBufferPointer(start: &x, count: 1))
//        message.append(UnsafeBufferPointer(start: &n, count: 1))
        
        let message = "Hello from iOS".data(using: String.Encoding.utf8)
        
        controller.send(onChannel: <#T##String#>, message: <#T##Data?#>)
        controller.send(onChannel: "foo", message: message) {(_) -> Void in
            os_log("Message sent, reply ignored")
        }

        
    }
    
    
    private func receiveBatteryLevel(result: FlutterResult) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == UIDeviceBatteryState.unknown {
            result(FlutterError(code: "UNAVAILABLE", message: "Battery info unavailable", details: nil))
        } else {
            result(Int(device.batteryLevel * 100))
        }
    }
    
    private func addToNumbers(result: FlutterResult) {
        let a = 5
        let b = 6
        result(a+b)
    }
    
    
}
