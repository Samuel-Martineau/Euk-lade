//
//  ContentView.swift
//  Eukelade
//
//  Created by Samuel Martineau on 2024-03-18.
//

import SwiftUI
import MultipeerConnectivity

struct ContentView: View {
    @State var mcManager = PeerManager()
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("Informations")) {
                        Text("Appareil")
                            .badge(
                                Text(mcManager.peerId.displayName)
                                    .foregroundColor(Color.accentColor)
                            )
                            
                        Text("Rôle")
                            .badge(
                                Text("N / A")
                                    .foregroundColor(Color.accentColor)
                            )
                    }
                    
                    Section(header: Text("Mesures")) {
                        Text("A")
                            .badge(
                                Text("13 cm")
                                    .foregroundStyle(Color.accentColor)
                            )
                        Text("B")
                            .badge(
                                Text("25 cm")
                                    .foregroundStyle(Color.accentColor)
                            )
                        Text("C")
                            .badge(
                                Text("43 cm")
                                    .foregroundStyle(Color.accentColor)
                            )
                    }
                }
            }
            .navigationTitle("Eukélade")
            .toolbar {
                NavigationLink {
                    PeerBrowserView()
                } label: {
                    Image(systemName: "network")
                }
            }
        }
        .environment(mcManager)
    }
}

#Preview {
    ContentView()
}
