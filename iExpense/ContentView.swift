//
//  ContentView.swift
//  iExpense
//
//  Created by Matheus Müller on 19/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Personal Costs")) {
                    ForEach(expenses.items.filter { $0.type == "Personal" } ) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: item.currency))
                        }
                        .foregroundColor(item.amount > 100 ? .red : item.amount > 10 ? .yellow : .green)
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section(header: Text("Business Costs")) {
                    ForEach(expenses.items.filter { $0.type == "Business" } ) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: item.currency))
                        }
                        .foregroundColor(item.amount > 100 ? .red : item.amount > 10 ? .yellow : .green)
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
