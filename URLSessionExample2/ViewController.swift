//
//  ViewController.swift
//  URLSessionExample2
//
//  Created by Ruslan on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getPosts { posts in
            print(posts.count)
        }
        
        NetworkManager.shared.getAlbums { albums in
            print(albums.count)
        }
        
        NetworkManager.shared.getUsers { users in
            print(users.count)
        }
    }
}

