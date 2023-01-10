//
//  StoryCardViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by user218997 on 15/12/22.
//

import UIKit

class StoryCardViewModel {
    
    private var listStory: [Stories]

    init(listStory: [Stories]) {
        self.listStory = listStory
    }
    
    public var numberOfItems: Int {
        listStory.count
    }
    
    public func loadCurrentStory(indexPath: IndexPath) -> Stories {
        listStory[indexPath.row]
    }
    
}
