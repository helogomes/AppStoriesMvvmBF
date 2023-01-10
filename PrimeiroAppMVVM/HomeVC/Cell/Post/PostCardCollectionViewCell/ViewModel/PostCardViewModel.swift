//
//  PostCardViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by user218997 on 15/12/22.
//

import UIKit

class PostCardViewModel {

    private var listPosts: [Posts]

    init(listPosts: [Posts]) {
        self.listPosts = listPosts
    }
    
    public var numberOfItems: Int {
        listPosts.count
    }
    
    public func loadCurrentPosts(indexPath: IndexPath) -> Posts {
        listPosts[indexPath.row]
    }
    
}
