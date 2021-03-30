//
//  Model.swift
//  NewsAPP
//
//  Created by Настя Сойко on 25.03.21.
//

import Foundation

//source": {
//"id": "the-wall-street-journal",
//"name": "The Wall Street Journal"
//},
//"author": "Telis Demos",
//"title": "All Work and No Play Could Make Wall Street Less Profitable...",
//"description": "All Work and No Play Could Make Wall Street Less Profitable...\r\n\n \n \n \n (Second column, 5th story, link)\r\n\n \r\n\n \r\n\n \n Related stories:Global banks warn of possible hedge fund defaults...\r\nSecretive Derivatives at Center of Blowup...\r\nReal Estate Investors Gro…",
//"url": "https://www.wsj.com/articles/all-work-and-no-play-could-make-wall-street-less-profitable-11617037002",
//"urlToImage": "https://images.wsj.net/im-317682/social",
//"publishedAt": "2021-03-29T17:16:39Z",
//"content": "It may only be tiny violins that most people would play for overworked junior investment bankers on Wall Street. But their concerns do raise some interesting questions for investors about the profit … [+2264 chars]"


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
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        content = dictionary["content"] as? String ?? ""
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["": ""])["name"] as? String ?? ""
    }
}
