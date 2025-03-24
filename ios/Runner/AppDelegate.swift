import Flutter
import UIKit

/// Main AppDelegate class for handling Flutter-to-native communication.
@main
@objc class AppDelegate: FlutterAppDelegate {

  var communicationManager = DataCommunicationManager.shared
  var dataCallback: FlutterResult?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
   ) -> Bool {
   /// Set up method channel to receive start/stop commands from Flutter.
       let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
       let dataChannel = FlutterMethodChannel(name : "com.zanis.dataChannel" , binaryMessenger : controller.binaryMessenger)
       
       dataChannel.setMethodCallHandler{[weak self] (call , result) in
           if call.method == "startDataStream"{
               self?.startStreaming(result)
           }else if call.method == "stopDataStream" {
               result("Data Stream Stopped")
           }else {
               result(FlutterMethodNotImplemented)
           }
       }
       
       
       
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    /// Starts streaming simulated data and sends results back to Flutter.
    private func startStreaming(_ FlutterResult: @escaping FlutterResult){
        communicationManager.startReceivingData { result in
            switch result {
            case .success(let data):
                FlutterResult(data)
            case .failure(let error):
                FlutterResult(FlutterError(code : "DATA_ERROR", message: "Failed to receive data", details: error.localizedDescription))
            
            }
        }
    }
}
