import UIKit
import Kingfisher

class AlbumImageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, AlbumUIProtocol {
    func updateUIOnSuccess() {
        
        myCollectionView?.reloadData()
    }
    
    func fetchError() {
        //
    }
    
    
    var images = [AnyObject]()
    var albumID : Int? = 1
    
    var myCollectionView: UICollectionView?
    var albumListViewModel : AlbumListViewModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 140, height: 140)
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView!.dataSource = self
        myCollectionView!.delegate = self
        myCollectionView!.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView!.backgroundColor = UIColor.white
        self.view.addSubview(myCollectionView!)
        albumListViewModel = AlbumListViewModel()

        albumListViewModel?.fetchImageFromAlbum(delegate: self)

       // loadListOfImages()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albumListViewModel?.albumsDetailsInfo?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell : ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! ImageCollectionViewCell
        myCell.backgroundColor = UIColor.black
        
        if let urlString = self.albumListViewModel?.albumsDetailsInfo?[indexPath.row].thumbnailUrl {
            if let url = URL.init(string: urlString) {

                myCell.thumbImageView.kf.setImage(with: url)
            }
        }
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("User tapped on item \(indexPath.row)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        if let urlString = self.albumListViewModel?.albumsDetailsInfo?[indexPath.row].url {
            if let url = URL.init(string: urlString) {
                destination.imageUrlString =   url
            }
        navigationController?.pushViewController(destination, animated: true)
    }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
