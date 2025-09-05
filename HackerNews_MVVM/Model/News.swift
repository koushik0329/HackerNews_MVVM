//
//  News.swift
//  HackerNews_MVVM
//
//  Created by Koushik Reddy Kambham on 9/4/25.
//

struct NewsList: Codable {
    var hits: [News]?
}

struct News: Codable {
    let id: String?
    let title: String?
    let num_comments: Int?
    let points: Int?
    let url: String?
    let author: String?
    let created_at: String?
    
}
