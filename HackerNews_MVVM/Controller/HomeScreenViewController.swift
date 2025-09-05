//
//  HomeScreenViewController.swift
//  HackerNews_MVVM
//
//  Created by Koushik Reddy Kambham on 9/4/25.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    //MARK: Properties
    private let viewModel = HomeScreenViewModel()
    
    var newsLabel: UILabel!
    var newsTable: UITableView!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTable()
        
        viewModel.getDataFromServer { [weak self] in
                DispatchQueue.main.async {
                    self?.newsTable.reloadData()
                }
            }
    }
}

// MARK: - TableView DataSource & Delegate

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNewsListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        if let news = viewModel.getNews(at: indexPath.row) {
            cell.configure(with: news)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.getNewsHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let selectedNews = viewModel.getNews(at: indexPath.row) else { return }
        let detailsVC = DetailsViewController()
        detailsVC.configure(with: selectedNews)
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

// MARK: - UI Setup

extension HomeScreenViewController {
    
    func setupUI() {
        view.backgroundColor = .black
        
        newsLabel = UILabel()
        newsLabel.text = "News"
        newsLabel.textColor = .white
        newsLabel.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        newsLabel.textAlignment = .left
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newsLabel)
        
        NSLayoutConstraint.activate([
            newsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42),
            newsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    func setupTable() {
        newsTable = UITableView()
        newsTable.translatesAutoresizingMaskIntoConstraints = false
        newsTable.backgroundColor = .clear
        newsTable.separatorColor = .darkGray
        newsTable.delegate = self
        newsTable.dataSource = self
        newsTable.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsCell")
        newsTable.isUserInteractionEnabled = true
        newsTable.allowsSelection = true
        
        view.addSubview(newsTable)
        
        NSLayoutConstraint.activate([
            newsTable.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: 20),
            newsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
