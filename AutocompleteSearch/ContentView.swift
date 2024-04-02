//
//  ContentView.swift
//  AutocompleteSearch
//
//  Created by Eric on 02/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager.shared
    @StateObject private var vm = SearchResultsViewModel()
    @State private var search: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(vm.places) { place in
                    Text(place.name)
                }
            }
            .searchable(text: $search)
            .onChange(of: search) { searchText in
                if !searchText.isEmpty {
                    vm.search(text: searchText, region: locationManager.region)
                } else {
                    vm.places = []
                }
            }
            .navigationTitle("Places")
        }
    }
}

#Preview {
    ContentView()
}
