//
//  ContentView.swift
//  Moonlight
//
//  Created by Mayank Jangid on 9/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    @State private var type = true
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack(path: $path){
            ScrollView{
                if type {
                    GridView()
                } else {
                    ListView()
                }
            }
            .navigationDestination(for: Mission.self){ mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .navigationDestination(for: CrewMember.self){ crewMember in
                AstronautView(astronaut: crewMember.astronaut)
            }
            .navigationTitle("Moonshoot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button {
                    type.toggle()
                } label: {
                    Image(systemName: type ? "circle.grid.3x3.circle.fill" : "list.dash")
                }
                .accessibilityElement()
            }
        }
    }
}

#Preview {
    ContentView()
}

//MARK: - GrideView

struct GridView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(missions){ mission in
                NavigationLink (value: mission){
                    VStack{
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .accessibilityElement()
                        VStack{
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.85))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

//MARK: - ListView

struct ListView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        LazyVStack{
            ForEach(missions){ mission in
                NavigationLink(value: mission){
                    HStack{
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .accessibilityElement()
                        VStack{
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.85))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                        .clipShape(.rect(cornerRadius: 10))
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}
