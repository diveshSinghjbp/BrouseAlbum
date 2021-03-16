//
//  AlbumListViewModel.swift
//  AlbumsList
//
//  Created by OPT/LPTP/335 on 14/03/21.
//

import UIKit


protocol FetchService {
    func fetchAlbumList(delegate : AlbumUIProtocol)
}

class AlbumListViewModel: FetchService {
    
    weak var albumUIDelegate : AlbumUIProtocol? = nil
    var albums = [AlbumInfo]()
    var albumsDetailsInfo : [AlbumDetailInfo]? = nil

    func fetchAlbumList(delegate: AlbumUIProtocol) {
        
        AlbumService(networkSession: URLSession.shared).getAlbumData(urlStr: ALBUM_URL) {[weak self] (result) in
            switch result {
            case .failure(let error) :
                print(error.localizedDescription)
            case .success(let model) :
                if let albumobj = model.albums {
                    self!.albums = albumobj
                    delegate.updateUIOnSuccess()
                }
            }
        }
    }
    
    func fetchImageFromAlbum(delegate: AlbumUIProtocol) {
        
        AlbumService(networkSession: URLSession.shared).getAlbumDetailData(urlStr: scriptUrl, albumId: "1") {[weak self] (result) in
            switch result {
            case .failure(let error) :
                print(error.localizedDescription)
            case .success(let model) :
                
                self!.albumsDetailsInfo = model.albumsDetailsInfo
                delegate.updateUIOnSuccess()
            }
        }
    }
    
    init() {
       // self.albumUIDelegate = delegate
        // add init for ClosureHTTPManager here, to allow it to be teestable in the future
    }

    func numberItemsToDisplay() -> Int {
        return albums.count
    }
//    
//    func configure (_ view: BreachView, number index: Int) {
//        // set the name and data in the view
//        view.nameLabel.text = breaches[index].name
//    }
//    
}


