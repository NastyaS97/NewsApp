//
//  Model.swift
//  NewsAPP
//
//  Created by Настя Сойко on 25.03.21.
//

import Foundation

//"source": {
//"id": "techcrunch",
//"name": "TechCrunch"
//},
//"author": "Brian Heater",
//"title": "Ballot counting for Amazon's historic union vote starts today",
//"description": "Vote counting begins today in the historic effort to unionize Amazon’s Bessemer, Alabama fulfillment center. The warehouse — which opened exactly a year ago to meet ramping up demand as COVID-19 bore down on the U.S. — has become ground zero for one of the mo…",
//"url": "https://techcrunch.com/2021/03/30/ballot-counting-for-amazons-historic-union-vote-starts-today/",
//"urlToImage": "https://techcrunch.com/wp-content/uploads/2021/03/GettyImages-1231457255.jpeg?w=600",
//"publishedAt": "2021-03-30T17:05:30Z",
//"content": "Vote counting begins today in the historic effort to unionize Amazons Bessemer, Alabama fulfillment center. The warehouse — which opened exactly a year ago to meet ramping up demand as COVID-19 bore … [+5088 chars]"


struct News {
    var name: String
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    var sourceName: String
    init(dictionary: Dictionary<String, Any>) {
        name = dictionary["name"] as? String ?? ""
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? "https://www.kindpng.com/picc/m/182-1827064_breaking-news-banner-png-transparent-background-breaking-news.png"
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        content = dictionary["content"] as? String ?? ""
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["": ""])["name"] as? String ?? ""
    }
}
