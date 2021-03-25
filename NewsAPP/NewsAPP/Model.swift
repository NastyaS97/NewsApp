//
//  Model.swift
//  NewsAPP
//
//  Created by Настя Сойко on 25.03.21.
//

import Foundation

//"source": {
//"id": null,
//"name": "Lifehacker.com"
//},
//"author": "Aisha Jordan",
//"title": "13 Sports Films You'll Love Even If You Don't Like Sports",
//"description": "Healthy competition builds character, and we encounter it all the time—or manufacture it where it needn’t exist. Whether we are choosing our favorite kind of pizza or voting for a political candidate we believe in, picking a side is something we do all the ti…",
//"url": "https://lifehacker.com/13-sports-films-youll-love-even-if-you-dont-like-sports-1846541567",
//"urlToImage": "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/quidnybabhgi3c4eftwf.png",
//"publishedAt": "2021-03-24T20:00:00Z",
//"content": "Building upon the classicRocky saga, Creed follows Adonis Creed Johnson (Michael B. Jordan), the son of Rocky Balboas rival-turned -ally Apollo Creed. When Adonis decides to make a name for himself i… [+425 chars]"


struct News {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    var sourceName: String
    init(dictionary: Dictionary<String, Any>) {
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
