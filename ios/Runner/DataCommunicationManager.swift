//
//  DataCommunicationManager.swift
//  Runner
//
//  Created by Hadi Mahmoudi on 3/24/25.
//



import Foundation

/// A singleton manager that simulates receiving data periodically.
class DataCommunicationManager{

    static let shared = DataCommunicationManager()

    private var timer:Timer?
    private var isReceiving = false
    private init () {}

    /// Starts receiving simulated data every 2 seconds.
    /// - Parameter callback: Closure returning either simulated data or an error.
    func startReceivingData(callback : @escaping (Result<String,Error>) -> Void){
        guard !isReceiving else {return}

        isReceiving = true
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true){ _ in
            let success = Bool.random();
            if success {
                let randomData = "Simulated data : \(Int.random(in: 1000...9999))"
                callback(.success(randomData))
            }else {
                callback(.failure(NSError(domain: "DataError", code: 1)))
            }

        }
    }
    /// Stops the data stream.
    func stopReceivingData(){
        timer?.invalidate()
        timer = nil
        isReceiving = false
    }
}