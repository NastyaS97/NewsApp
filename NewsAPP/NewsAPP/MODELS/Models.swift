//
//  Models.swift
//  NewsAPP
//
//  Created by Настя Сойко on 25.03.21.
//

import Foundation

var articles: [News] {
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return []
    }

    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return []
    }

    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return []
    }

    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray: [News] = []

        for dict in array {
            let newArticles = News(dictionary: dict)
            returnArray.append(newArticles)
        }

        return returnArray
    }
    return []
}

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)

    return urlPath
}

func loadNews(completionHangler: (()-> Void)?) {
    let url = URL(string:"https://newsapi.org/v2/everything?q=apple&from=2021-03-24&to=2021-03-24&sortBy=popularity&apiKey=fee4606665f2479188420a49a3fe23ff")
    let session = URLSession(configuration: .default)

    let downloadTask = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            parseNews()
            completionHangler?()
        }
    }

    downloadTask.resume()
}
