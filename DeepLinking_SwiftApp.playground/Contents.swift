//: Playground - noun: a place where people can play

/* You need to specify URL Types in info of your target:
 Identifier: "app identifier" ex: com.companyname.productName
 URLSchemes: "unique string name"
*/

import UIKit

func application(application: UIApplication,openURL url: NSURL,sourceApplication: String?,annotation: AnyObject) -> Bool {
    if url.host != "your host string" {
        return false
    }
    if let parameters = url.queryItems {
        let userInfo = ["customKey" : parameters]
        self.applicationHandleRemoteNotification(application, didReceiveRemoteNotification: userInfo)
        return true
    }
    return false
    
}
func applicationHandleRemoteNotification(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
    if application.applicationState == UIApplicationState.Background || application.applicationState == UIApplicationState.Inactive {
        let query = userInfo["customKey"]!
        if let objectId = query["object_id"] as? NSString {
            //TODO: fetch that object from core data context
            if object != nil{   //object exist in coredata context
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: Constants.Notifications.HandleDeepLinking, object: "objectId"))
            }
            else { //if object does not exist
                // TODO:  alamofire API call to load new object, completionClosure: { (responseObject) in
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: Constants.Notifications.HandleDeepLinking, object: "objectId"))
            })
        }
    }
}
}

extension NSURL {
    var queryItems: [String: String]? {
        var params = [String: String]()
        return NSURLComponents(URL: self, resolvingAgainstBaseURL: false)?
            .queryItems?
            .reduce([:], combine: { (_, item) -> [String: String] in
                params[item.name] = item.value
                return params
            })
    }
}