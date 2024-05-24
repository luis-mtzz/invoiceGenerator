//
//  InvoiceDetailView.swift
//  invoiceGenerator
//
//  Created by Luis Martinez on 5/24/24.
//

import SwiftUI

struct InvoiceDetailView: View {
    let item: Item

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Invoice")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Date: \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Seller")
                        .font(.headline)
                    Text(item.seller)
                        .font(.subheadline)
                }
            }

            Divider()

            HStack {
                VStack(alignment: .leading) {
                    Text("Bill To:")
                        .font(.headline)
                    Text(item.buyer)
                        .font(.subheadline)
                }
                Spacer()
            }

            Divider()

            VStack(alignment: .leading) {
                Text("Item Description")
                    .font(.headline)
                HStack {
                    Text(item.item)
                        .font(.subheadline)
                    Spacer()
                    Text("Price: \(item.price, specifier: "%.2f")")
                        .font(.subheadline)
                }
            }

            Spacer()

            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Total")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("\(item.price, specifier: "%.2f")")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        .navigationBarTitle("Invoice Details", displayMode: .inline)
    }
}
