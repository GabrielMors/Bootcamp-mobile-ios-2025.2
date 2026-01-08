//
//  HomeViewModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 11/12/25.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    
    let items: Array<ProfileModel> = ProfileModel.items
    
    @Published var bannerIndex: [CGFloat] = []
    @Published var profileIndex: [Int?] = []
    @Published var isFavoriteArray: [Bool] = []
    
    @Published private(set) var showStory = false
    
    @Published private(set) var currentStorieModel: StoryModel?
    
    @Published var timelineWidth: CGFloat = .zero
    @Published var timelineCurrentIndex: Int = 0
    @Published var totalSeconds: Int = 3
    
    @Published var hideHistoryWorkItem: DispatchWorkItem?
    @Published var timelineCurrentIndexWorkItem: [DispatchWorkItem?] = []
    
    let limit: CGFloat = -100
    let innerPadding: CGFloat = 4
    
    init() {
        for i in 0..<items.count {
            bannerIndex.append(0)
            profileIndex.append(i)
            isFavoriteArray.append(false)
        }
    }
    
    func showStory(withModel model: StoryModel) {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.95)) {
            showStory = true
            currentStorieModel = model
        }
    }
    
    func hideStory() {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.95)) {
            showStory = false
            currentStorieModel = nil
        }
    }
    
    func showStoryDisappear() {
        timelineWidth = .zero
        timelineCurrentIndex = 0
        totalSeconds = 3
        hideHistoryWorkItem?.cancel()
        hideHistoryWorkItem = nil
        
        for i in 0..<timelineCurrentIndexWorkItem.count {
            timelineCurrentIndexWorkItem[i]?.cancel()
            timelineCurrentIndexWorkItem[i] = nil
        }
        
        timelineCurrentIndexWorkItem = []
    }
    
    func showStoryAppear(model: StoryModel) {
        let delay = 3
        
        for i in 1..<model.storyDetails.count {
            
            totalSeconds += delay
            
            timelineCurrentIndexWorkItem.append(DispatchWorkItem(block: {
                self.timelineCurrentIndex = i
            }))
            
            guard let item = timelineCurrentIndexWorkItem[i - 1] else {
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay * i), execute: item)
        }
        
        hideHistoryWorkItem = DispatchWorkItem {
            self.hideStory()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(totalSeconds), execute: hideHistoryWorkItem!)
    }
    
}

