//
//  GuideView.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit
import G3GridView

extension UIColor {
    fileprivate convenience init(hex: Int, alpha: CGFloat = 1) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0x00FF00) >> 8 ) / 255
        let blue = CGFloat((hex & 0x0000FF) >> 0 ) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

class GuideView: UIViewController {

    @IBOutlet weak var eventGridView: GridView!
    @IBOutlet weak var timeGridView: GridView!
    @IBOutlet weak var channelGridView: GridView!
    
    private let channels: [String] = ["News", "Anime", "Drama", "MTV", "Music", "Pets", "Documentary", "Soccer", "Cooking", "Gourmet", "Extreme", "Esports"]
    
    fileprivate lazy var slotList: [[Slot]] = {
        let detailText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        let minutesOfDay = 24 * 60
        let frames = [15, 15, 20, 20, 30, 30, 40, 40, 50, 50, 60, 60, 75, 75, 90, 90]
        return self.channels.enumerated().map { index, channel in
            var slots: [Slot] = []
            var totalMinutes = 0
            while totalMinutes < minutesOfDay {
                var minutes = frames[Int(arc4random_uniform(UInt32(frames.count)))]
                let startAt = totalMinutes + minutes
                minutes -= max(startAt - minutesOfDay, 0)
                let slot = Slot(minutes: minutes, startAt: totalMinutes, title: "\(channel)'s slot", detail: detailText)
                totalMinutes = startAt
                slots.append(slot)
            }
            return slots
        }
    }()
    
    private lazy var channelListDataSource: ChannelListDataSource = .init(channels: self.channels)
    private let dateTimeDataSource = DateTimeGridViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.layoutIfNeeded()
        
        eventGridView.register(GuideEventGridCell.nib, forCellWithReuseIdentifier: "GuideEventGridCell")
        channelGridView.register(GuideChannelGridCell.nib, forCellWithReuseIdentifier: "GuideChannelGridCell")
        timeGridView.register(GuideTimeGridCell.nib, forCellWithReuseIdentifier: "GuideTimeGridCell")
        
        eventGridView.superview?.clipsToBounds = true
        eventGridView.contentInset.top = channelGridView.bounds.height
        eventGridView.minimumScale = Scale(x: 0.5, y: 0.5)
        eventGridView.maximumScale = Scale(x: 1.5, y: 1.5)
        eventGridView.scrollIndicatorInsets.top = eventGridView.contentInset.top
        eventGridView.scrollIndicatorInsets.left = timeGridView.bounds.width
        eventGridView.dataSource = self
        eventGridView.delegate = self
        eventGridView.reloadData()
        
        channelGridView.superview?.backgroundColor = .black
        channelGridView.superview?.isUserInteractionEnabled = false
        channelGridView.minimumScale.x = eventGridView.minimumScale.x
        channelGridView.maximumScale.x = eventGridView.maximumScale.x
        channelGridView.dataSource = channelListDataSource
        channelGridView.delegate = channelListDataSource
        channelGridView.reloadData()
        
        timeGridView.superview?.clipsToBounds = true
        timeGridView.superview?.backgroundColor = UIColor(hex: 0x6FB900)
        timeGridView.superview?.isUserInteractionEnabled = false
        timeGridView.contentInset.top = channelGridView.bounds.height
        timeGridView.minimumScale.y = eventGridView.minimumScale.y
        timeGridView.maximumScale.y = eventGridView.maximumScale.y
        timeGridView.isInfinitable = false
        timeGridView.dataSource = dateTimeDataSource
        timeGridView.delegate = dateTimeDataSource
        timeGridView.reloadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            self.timeGridView.invalidateContentSize()
            self.channelGridView.invalidateContentSize()
            self.view.layoutIfNeeded()
        })
    }
}

extension GuideView: GridViewDataSource, GridViewDelegate {
    func numberOfColumns(in gridView: GridView) -> Int {
        return slotList.count
    }
    
    func gridView(_ gridView: GridView, numberOfRowsInColumn column: Int) -> Int {
        return slotList[column].count
    }
    
    func gridView(_ gridView: GridView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(slotList[indexPath.column][indexPath.row].minutes * 2)
    }
    
    func gridView(_ gridView: GridView, cellForRowAt indexPath: IndexPath) -> GridViewCell {
        let cell = gridView.dequeueReusableCell(withReuseIdentifier: "GuideEventGridCell", for: indexPath)
        if let cell = cell as? GuideEventGridCell {
            cell.configure(slotList[indexPath.column][indexPath.row])
        }
        
        return cell
    }
    
    func gridView(_ gridView: GridView, didScaleAt scale: CGFloat) {
        channelGridView.contentScale(scale)
        timeGridView.contentScale(scale)
    }
    
    func gridView(_ gridView: GridView, didSelectRowAt indexPath: IndexPath) {
        gridView.deselectRow(at: indexPath)
        gridView.scrollToRow(at: indexPath, at: [.topFit, .centeredHorizontally], animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        channelGridView.contentOffset.x = scrollView.contentOffset.x
        timeGridView.contentOffset.y = scrollView.contentOffset.y
    }
}

final class DateTimeGridViewDataSource: NSObject, GridViewDataSource, GridViewDelegate {
    func gridView(_ gridView: GridView, numberOfRowsInColumn column: Int) -> Int {
        return 24
    }
    
    func gridView(_ gridView: GridView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 * 2
    }
    
    func gridView(_ gridView: GridView, cellForRowAt indexPath: IndexPath) -> GridViewCell {
        let cell = gridView.dequeueReusableCell(withReuseIdentifier: "GuideTimeGridCell", for: indexPath)
        if let cell = cell as? GuideTimeGridCell {
            cell.configure(indexPath.row)
        }
        
        return cell
    }
}

final class ChannelListDataSource: NSObject, GridViewDataSource, GridViewDelegate {
    let channels: [String]
    
    init(channels: [String]) {
        self.channels = channels
    }
    
    func numberOfColumns(in gridView: GridView) -> Int {
        return channels.count
    }
    
    func gridView(_ gridView: GridView, numberOfRowsInColumn column: Int) -> Int {
        return 1
    }
    
    func gridView(_ gridView: GridView, cellForRowAt indexPath: IndexPath) -> GridViewCell {
        let cell = gridView.dequeueReusableCell(withReuseIdentifier: "GuideChannelGridCell", for: indexPath)
        if let cell = cell as? GuideChannelGridCell {
            cell.configure(channels[indexPath.column])
        }
        
        return cell
    }
}
