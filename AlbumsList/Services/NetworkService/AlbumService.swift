//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Divesh Singh on 3/6/21.
//

import Foundation

protocol AlbumServiceProtocol {
    func getAlbumData(urlStr: String, then completionHandler : @escaping (Result<AlbumDataModel, Error>)->Void)
    
    func getAlbumDetailData(urlStr: String,
                        albumId : String,
                        then completionHandler : @escaping (Result<AlbumDetailsDataModel, Error>)->Void)

}

class AlbumService : AlbumServiceProtocol {
    let networkManager : NetworkManager!
    init(networkSession : NetworkSession) {
        networkManager = NetworkManager(session: networkSession)
    }
    func getAlbumData(urlStr: String, then completionHandler : @escaping (Result<AlbumDataModel, Error>)->Void){
                
        
        let urlComps = URLComponents(string: urlStr)!
        guard let url = urlComps.url else {
            completionHandler(.failure(APIError.invalidURL))
            return
        }
        networkManager.loadData(from: url) { (data, error) in
            if let _ = error {
                completionHandler(.failure(APIError.invalidData))
                return
            }
            guard let dataObj = data else{
                completionHandler(.failure(APIError.invalidData))
                return
            }
            let str = String(decoding: dataObj, as: UTF8.self)
            print(str)

            dataObj.decode(as: [AlbumInfo].self, handleOn: .main) { (result) in
                switch result {
                case .failure(_) : completionHandler(.failure(APIError.jsonParsingFailure))
                case .success(let albumInfo) : completionHandler(.success(AlbumDataModel(albumInfo: albumInfo)))
                    
                }
            }
        }
                
    }
    func getAlbumDetailData(urlStr: String,
                        albumId : String,
                        then completionHandler : @escaping (Result<AlbumDetailsDataModel, Error>)->Void){
                
        
        let urlComps = URLComponents(string: urlStr)!
        guard let url = urlComps.url else {
            completionHandler(.failure(APIError.invalidURL))
            return
        }
        networkManager.loadData(from: url) { (data, error) in
            if let _ = error {
                completionHandler(.failure(APIError.invalidData))
                return
            }
            guard let dataObj = data else{
                completionHandler(.failure(APIError.invalidData))
                return
            }
            let str = String(decoding: dataObj, as: UTF8.self)
            print(str)

            dataObj.decode(as: [AlbumDetailInfo].self, handleOn: .main) { (result) in
                switch result {
                case .failure(_) : completionHandler(.failure(APIError.jsonParsingFailure))
                case .success(let detailInfo) : completionHandler(.success(AlbumDetailsDataModel(albumDetails: detailInfo)))
                    
                }
            }
        }
                
    }
}
