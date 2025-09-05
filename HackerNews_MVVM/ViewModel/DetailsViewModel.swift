//
//  DetailsViewModel.swift
//  HackerNews_MVVM
//
//  Created by Koushik Reddy Kambham on 9/4/25.
//

import Foundation

class DetailsViewModel {
    
    private var news: News?
    
    func configure(with news: News) {
        self.news = news
    }
    
    func getTitle() -> String {
        return news?.title ?? "No Title"
    }
    
    func getAuthor() -> String {
        return news?.author ?? "Unknown Author"
    }
    
    func getCreatedAt() -> String {
        return news?.created_at ?? "Unknown Date"
    }
    
    func getPoints() -> Int {
        return news?.points ?? 0
    }
    
    func getComments() -> Int {
        return news?.num_comments ?? 0
    }
    
    func getURL() -> String? {
        return news?.url
    }
    
    func getFormattedSubtitle() -> String {
        let author = getAuthor()
        let createdAt = getCreatedAt()
        return "\(author) • \(createdAt)"
    }
}