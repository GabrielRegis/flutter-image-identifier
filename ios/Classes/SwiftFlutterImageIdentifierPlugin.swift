import Flutter
import UIKit

public class SwiftFlutterImageIdentifierPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_image_identifier", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterImageIdentifierPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch(call.method){
      case "captureCNHInformationsFromImage":
          let base64 = call.arguments as? String
          
          if #available(iOS 16.0, *) {
              let cnh = SwiftCNHDetector().detectCNHFromBase64String(imageBase64: base64 ?? "")
              let encoder = JSONEncoder()
              
              do{
                  let data = try encoder.encode(cnh)
                  let stringData = String(data: data, encoding: .utf8)
                  result(stringData)
              }catch{
                  
              }
              
              
          } else {
              // Fallback on earlier versions
          }
          break
      default:
          return;
      }
      

      
      
      
      
//      let data = try encoder.encode(request)

//      result(data)
      
      
    
    result("iOS hey s" + UIDevice.current.systemVersion)
  }
}
