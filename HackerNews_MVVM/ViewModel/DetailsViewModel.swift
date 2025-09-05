//
//  DetailsViewModel.swift
//  HackerNews_MVVM
//
//  Created by Koushik Reddy Kambham on 9/5/25.
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
}
