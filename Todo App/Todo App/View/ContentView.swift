//
//  ContentView.swift
//  Todo App
//
//  Created by William Lopez on 2/12/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var showingAddTodoView: Bool = false
    @State private var animatingButton: Bool = false
    @State private var showingSettingsView: Bool = false
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    
    @EnvironmentObject var iconSettings: IconNames
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)],
        animation: .default)
    private var todos: FetchedResults<Todo>
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todos, id: \.self) { todo in
                        HStack {
                            Circle()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundColor(colorize(priority: todo.priority ?? "Normal"))
                            Text(todo.name ?? "Unknown")
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Unknown")
                                .font(.footnote)
                                .foregroundColor(Color(UIColor.systemGray2))
                                .padding(3)
                                .frame(minWidth: 62)
                                .overlay(
                                    Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                                )
                        }
                        .padding(.vertical, 10)
                    }
                    .onDelete(perform: deleteTodo)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingSettingsView.toggle()
                        }) {
                            Image(systemName: "paintbrush")
                        }
                        .tint(themes[theme.themeSettings].themeColor)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                            .tint(themes[theme.themeSettings].themeColor)
                    }
                }
                .sheet(isPresented: $showingSettingsView) {
                    SettingsView().environmentObject(iconSettings)
                }
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                
                if todos.count == 0 {
                    EmptyListView()
                }
            }
            .sheet(isPresented: $showingAddTodoView) {
                AddTodoView().environment(\.managedObjectContext, viewContext)
            }
            .overlay(
                ZStack {
                    Group {
                        Circle()
                            .fill(themes[theme.themeSettings].themeColor)
                            .opacity(animatingButton ? 0.2 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        Circle()
                            .fill(themes[theme.themeSettings].themeColor)
                            .opacity(animatingButton ? 0.15 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    .animation(.linear(duration: 2).repeatForever(autoreverses: true), value: animatingButton)
                    Button(action: {
                        showingAddTodoView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    }
                    .tint(themes[theme.themeSettings].themeColor)
                    .onAppear {
                        withAnimation {
                            animatingButton.toggle()
                        }
                    }
                }
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                , alignment: .bottomTrailing
                )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    private func deleteTodo(offsets: IndexSet) {
        withAnimation {
            offsets.map { todos[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func colorize(priority: String) -> Color {
        switch priority {
        case "High":
            return .pink
        case "Normal":
            return .green
        case "Low":
            return .blue
        default:
            return .gray
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
