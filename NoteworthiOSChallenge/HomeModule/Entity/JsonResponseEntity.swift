//
//  JsonResponseEntity.swift
//  NoteworthiOSChallenge
//
//  Created by David Duarte on 19/03/2021.
//

import Foundation

struct JsonResponseEntity: Codable {
    let data: JsonResponseData
}

struct JsonResponseData: Codable {
    let children: [JsonPostData]
}

struct JsonPostData: Codable {
    let data: PostEntity
}
