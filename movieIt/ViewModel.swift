//
//  ViewModel.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/30/25.
//

import Foundation
 //observable allows viewmodel to automatically modify UI of any data changes. Cannot use struct with observable
@Observable
class ViewModel{
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    private(set) var homeStatus: FetchStatus = .notStarted
}
