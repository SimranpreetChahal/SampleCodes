//: Playground - noun: a place where people can play

import UIKit

import Alamofire
import SwiftyJSON


func apiServiceCall(force:Bool?) {
    let url = NSURL(string:"http:yourendPoint")!
    let urlRequest = NSMutableURLRequest(URL: url)
    urlRequest.timeoutInterval = 120
    urlRequest.HTTPMethod = "GET"
    urlRequest.cachePolicy = NSURLRequestCachePolicy.ReturnCacheDataElseLoad
    Alamofire.request(urlRequest)
        .validate(statusCode: 200..<300)
        .responseJSON { response in // 1
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) { //Save into the coredata context using background queue
                switch(response.result) {
                case .Success(let data):
                    let json = JSON(data)
                    print(json)
                    
                    //Call to coreDataModel class to insert your json data into entities.
                    
                case .Failure(let error) :
                    print("Request failed with error: \(error)")
                    dispatch_async(dispatch_get_main_queue()) {
                        UIAlertView(title: "Error", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "Ok").show()
                    }
                    //log error on Google analytics
                }
            }
    }
}