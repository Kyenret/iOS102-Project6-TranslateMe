//
//  Translate.swift
//  TranslateMe
//
//  Created by Kyenret Yakubu Ayuba on 4/5/24.
//

import Foundation

struct ResponseTranslate: Codable {
    struct ResponseData: Codable {
        let translatedText: String
        let match: Int
    }
    let responseData: ResponseData
    let quotaFinished: Bool
    let mtLangSupported: String?
    let responseDetails: String
    let responseStatus: Int
    let responderId: String?
    let exceptionCode: String?
    let matches: [Match]?
    
    enum CodingKeys: String, CodingKey {
           case responseData
           case quotaFinished
           case mtLangSupported
           case responseDetails
           case responseStatus
           case responderId
           case exceptionCode = "exception_code"
           case matches
       }
}

struct Match: Codable {
    let id: String
    let segment: String
    let translation: String
    let source: String
    let target: String
    let quality: Int
    let reference: String?
    let usageCount: Int?
    let subject: String
    let createdBy: String
    let lastUpdatedBy: String
    let createDate: String
    let lastUpdateDate: String
    let match: Int
    
    enum CodingKeys: String, CodingKey {
           case id
           case segment
           case translation
           case source
           case target
           case quality
           case reference
           case usageCount = "usage-count"  // Map JSON key to property name
           case subject
           case createdBy = "created-by"
           case lastUpdatedBy = "last-updated-by"
           case createDate = "create-date"
           case lastUpdateDate = "last-update-date"
           case match
       }
   }
