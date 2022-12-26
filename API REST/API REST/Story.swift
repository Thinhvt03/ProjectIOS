//
//  Story.swift
//  API REST
//
//  Created by Hoàng Loan on 26/12/2022.
//

import Foundation

private let apiKey = "53eb9541b4374660d6f3c0001d6249ca:19:70900879"
private let resourceUrl = URL(string: "http://api.nytimes.com/svc/topstories/v1/home.json?api-key=\(apiKey)")!

class Story {
    var headline: String?
    var thumbnailUrl: String?

    init(jsonResult: NSDictionary) {
        if let title = jsonResult["title"] as? String {
            headline = title
        }

        if let multimedia = jsonResult["multimedia"] as? NSArray {
            // 4th element is will contain the image of the right size
            if multimedia.count >= 4 {
                if let mediaItem = multimedia[3] as? NSDictionary {
                    if let type = mediaItem["type"] as? String {
                        if type == "image" {
                            if let url = mediaItem["url"] as? String{
                                thumbnailUrl = url
                            }
                        }
                    }
                }
            }
        }
    }

    class func fetchStories(successCallback: ([Story]) -> Void, error: ((NSError?) -> Void)?) {
        NSURLSession.sharedSession.dataTaskWithURL(resourceUrl, completionHandler: {(data, response, requestError) -> Void in
            if let requestError = requestError? {
                error?(requestError as NSError)
            } else {
                if let data = data? {
                let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
                    if let results = json["results"] as? NSArray {
                        var stories: [Story] = []
                        for result in results as [NSDictionary] {
                            stories.append(Story(jsonResult: result))
                        }
                        successCallback(stories)
                    }
                } else {
                    // unexepected error happened
                    error?(nil)
                }
            }
        }).resume()
    }
}
