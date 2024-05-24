//
//  ContentView.swift
//  invoiceGenerator
//
//  Created by Luis Martinez on 5/24/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State private var isShowingAddItemSheet = false
    @State private var newSeller = ""
    @State private var newBuyer = ""
    @State private var newItem = ""
    @State private var newPrice: Float = 0.0

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink(destination: InvoiceDetailView(item: item)) {
                        VStack(alignment: .leading) {
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric))
                            Text("Buyer: \(item.buyer)")
                            Text("Item: \(item.item)")
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Invoices")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        isShowingAddItemSheet = true
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingAddItemSheet) {
            VStack {
                TextField("Seller", text: $newSeller)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Buyer", text: $newBuyer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Item", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Price", value: $newPrice, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Spacer()

                Button(action: saveNewItem) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .padding()
        }
    }

    private func saveNewItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), seller: newSeller, buyer: newBuyer, item: newItem, price: newPrice)
            modelContext.insert(newItem)
            newSeller = ""
            newBuyer = ""
            self.newItem = ""
            newPrice = 0.0
            isShowingAddItemSheet = false
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
