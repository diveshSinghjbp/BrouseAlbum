//
//  ViewController.swift
//  AlbumsList
//
//  Created by OPT/LPTP/335 on 14/03/21.
//

import UIKit


protocol FetchAlbumDelegate {
    func fetchAlbumData()
}

class AlbumsViewController: UIViewController, AlbumUIProtocol, UISearchResultsUpdating, UISearchControllerDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var albumListTableView: UITableView!
    var albumListViewModel : AlbumListViewModel? = nil
    weak var delegate : AlbumUIProtocol? = nil
    var filteredTableData = [AlbumInfo]()

    var isFiltering: Bool {
      return  !isSearchBarEmpty
    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    func updateUIOnSuccess() {
        
        albumListTableView.reloadData()
        
    }
    
    func fetchError() {
        //
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        albumListViewModel = AlbumListViewModel()
        albumListViewModel?.fetchAlbumList(delegate: self)
       // let search = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = searchController
        searchController.delegate = self
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
        
        filteredTableData.removeAll(keepingCapacity: false)
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
//        let array = (albumListViewModel!.albums as NSArray).filtered{ $0.t < 5 }
//
        
        let list1 = (albumListViewModel!.albums as NSArray).filter { (name) -> Bool in
          let info =  name as? AlbumInfo
            

            let result = info?.title?.lowercased().contains(text.lowercased())
            return result ?? false
        
            
        }
        filteredTableData = (list1 as? [AlbumInfo])!
        self.albumListTableView.reloadData()

    }
}


extension AlbumsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if isFiltering {
                  return self.filteredTableData.count
               }else{
                   return self.albumListViewModel?.albums.count ?? 0
              }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableviewCell = tableView.dequeueReusableCell(withIdentifier: albumsCellIdentifier, for: indexPath) as! AlbumTableViewCell
        
        if isFiltering {
            tableviewCell.tilte.text = filteredTableData[indexPath.row].title
               } else {
                tableviewCell.tilte.text = albumListViewModel?.albums[indexPath.row].title
               }
        
        //tableviewCell.tilte.text = albumListViewModel?.albums[indexPath.row].title
        return tableviewCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "AlbumImageViewController") as! AlbumImageViewController
         destination.albumID =   albumListViewModel?.albums[indexPath.row].id
        navigationController?.pushViewController(destination, animated: true)
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {

        }
}
