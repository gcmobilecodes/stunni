//
//  ProviderDealsViewController.swift
//  Stunii
//
//  Created by inderjeet on 05/09/19.
//  Copyright © 2019 Gorilla App Development. All rights reserved.
//

import Foundation
import Foundation
class  NSObject {
    var providers: [Provider] = [] {
        didSet {
            delegate?.reloadData()
        }
    }
    var delegate: DealProfileViewModelDelegate?
    init(delegate: DealProfileViewModelDelegate?) {
        super.init()
        self.delegate = delegate
        getData()
    }
    var providersCount: Int {
        return providers.count
    }
    func getProviderName(at index: Int) -> String {
        return providers[index].name ?? ""
    }
    
    func getProviderImageUrl(at index: Int) -> String {
        return providers[index].photoURL ?? ""
    }
    private func getData() {
        APIHelper.getAllProviders{ [weak self] (data, error) in
            if let err = error {
                self?.delegate?.didReceive(error: err)
            }
            else if let providers = data {
                self?.providers = providers
            }
        }
    }
}

protocol DealProfileViewModelDelegate:ReloadDataAndErrorHandler { }