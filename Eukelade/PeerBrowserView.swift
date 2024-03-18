//
//  PeerBrowser.swift
//  Eukelade
//
//  Created by Samuel Martineau on 2024-03-19.
//

import SwiftUI

struct PeerBrowserView: View {
    @Environment(PeerManager.self) var peerManager
    
    var body: some View {
        List([peerManager.peerId] + peerManager.connectedPeers) { peer in
            VStack(alignment: .leading) {
                Text(peer.displayName)
                Text("Rôle")
                    .font(.caption)
            }
                .badge (
                    peer == peerManager.peerId ? Text("\(Image(systemName: "star.fill"))")
                        .foregroundColor(.orange) : nil
                )
                .swipeActions {
                    Button("Modifier le rôle") {
                        print("Awesome!")
                    }
                    .tint(.indigo)
                }
        }
        .navigationTitle("Réglages des pairs")
    }
}
