//
//  HNANFCHelper.swift
//  HNACoreNFC
//
//  Created by __无邪_ on 2017/8/14.
//  Copyright © 2017年 __无邪_. All rights reserved.
//

import UIKit
import CoreNFC

class HNANFCHelper: NSObject,NFCNDEFReaderSessionDelegate {
    
    var onNFCResult: ((Bool, String) -> ())?
    func restartSession() -> Void {
        let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session.begin()
    }
    
    
    // MARK: - NFCNDEFReaderSessionDelegate
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        guard let onNFCResult = onNFCResult else {
            return
        }
        onNFCResult(false, error.localizedDescription)
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        guard let onNFCResult = onNFCResult else {
            return
        }
        for msg in messages {
            for record in msg.records {
                if let resultString = String(data: record.payload, encoding: .utf8) {
                    onNFCResult(true, resultString)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
