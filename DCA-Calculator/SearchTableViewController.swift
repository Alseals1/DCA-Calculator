//
//  ViewController.swift
//  DCA-Calculator
//
//  Created by Alandis Seals on 3/10/22.
//

import UIKit
import Combine

class SearchTableViewController: UITableViewController {
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Enter a company name of symbol"
        sc.searchBar.autocapitalizationType = .allCharacters
        return sc
    }()
    
    private let apiService = ApiService()
    private var subscriber = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        performSearch()
    }
    private func performSearch() {
        
        apiService.fetchSymbolPublisher(keyword: "S&P500").sink { (completion) in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:  break
            }
        
        } receiveValue: { (searchResults) in
            print(searchResults)
        }.store(in: &subscriber)

        
        
        
        
    }
    private func setupNavigationBar() {
        navigationItem.searchController = searchController
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
    
        return cell
    }


}

extension SearchTableViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}


