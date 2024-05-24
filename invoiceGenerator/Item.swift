//
//  Item.swift
//  invoiceGenerator
//
//  Created by Luis Martinez on 5/24/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    @Attribute var id = UUID()
    @Attribute var timestamp: Date
    @Attribute var seller: String
    @Attribute var buyer: String
    @Attribute var item: String
    @Attribute var price: Float
    
    init(timestamp: Date, seller: String, buyer: String, item: String, price: Float) {
        self.id = UUID()
        self.timestamp = timestamp
        self.seller = seller
        self.buyer = buyer
        self.item = item
        self.price = price
    }
}
