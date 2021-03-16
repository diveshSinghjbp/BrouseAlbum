
//
//  AlbumDataModel.swift
//  AlbumsList
//
//  Created by OPT/LPTP/335 on 14/03/21.
//

import Foundation


struct AlbumInfo: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
}

struct AlbumDetailInfo: Codable {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}

class AlbumDataModel {
    
    var albums : [AlbumInfo]? = nil
    init(albumInfo : [AlbumInfo]) {
        albums = albumInfo
//        for item in albumInfo {
//            self.userId = Int(item.userId ?? 0)
//            self.id = Int(item.id ?? 0)
//            self.title = String(item.title ?? "")
//        }
//
        
    }
}



class AlbumDetailsDataModel {
    
    //Declare your model variables here
    let albumId: Int? = 0
    let id: Int? = 0
    let title: String? = "0"
    let url: String? = ""
    let thumbnailUrl:  String? = ""
    var albumsDetailsInfo : [AlbumDetailInfo]? = nil

//    init(albumId: Int,
//         id: Int,
//         title: String,url: String,thumbnailUrl: String) {
//        self.albumId                = albumId
//        self.id                    = id
//        self.title                 = title
//        self.url                   = url
//        self.thumbnailUrl          = thumbnailUrl
//    }
    init(albumDetails : [AlbumDetailInfo]) {
        
        self.albumsDetailsInfo = albumDetails
//        self.albumId = Int(albumDetails.albumId)
//        self.id = Int(albumDetails.id)
//        self.title = String(albumDetails.title)
//        self.url = String(albumDetails.url)
//        self.thumbnailUrl = String(albumDetails.thumbnailUrl)
        
    }
}
