//
//  ChannelListView.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit

class ChannelListView: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var presenter: ChannelListPresenterProtocol?
    var channels: [ChannelModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        initCell()
    }

    func initCell() {
        let nib = UINib(nibName: "ChannelListCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ChannelListCell")
    }
}

extension ChannelListView: ChannelListViewProtocol {
    func showChannels(with channels: [ChannelModel]) {
        self.channels = channels
        tableView.reloadData()
    }
    
    func showError() {
        print("Internet not connect!")
    }
    
    func showLoading() {
        print("ChannelListView show loading!")
    }
    
    func hideLoading() {
        print("ChannelListView hide loading!")
    }
}

extension ChannelListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
}

extension ChannelListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelListCell", for: indexPath) as! ChannelListCell
        cell.set(forChannel: channels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showChannelDetail(forChannel: channels[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148.0
    }
}
