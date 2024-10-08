//
//  Untitled.swift
//  CoreDataBootcamp
//
//  Created by Fabio Cristiano Lopes on 30/09/24.
//

import CoreData

class CoreDataStack {

  static let shared = CoreDataStack()

  private init() {}

  // O persistentContainer é o coração do Core Data. Ele cuida de carregar os dados e gerenciar o armazenamento através do file "CoreDataBootcamp.xcdatamodeld"
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "CoreDataBootcamp")
    container.loadPersistentStores(completionHandler: { _, error in
      if let error {
        fatalError("Failed to load persistent stores: \(error)")
      }
    })
    return container
  }()

  // O context é a area de trabalho onde realizamos as alterações nos dados (criar, editar, deletar).
  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }

  // Este método salva as alterações feitas no context e manda as mudanças para o banco de dados
  func saveContext() {
    // Primeiro, ele verifica se há alguma alteração pendente, se tiver ele TENTA salvar
    if context.hasChanges {
      do {
        // Salva as mudança
        try context.save()
      } catch {
        // Se der algum erro ao salvar, ele printa a mensagem de error
        let nserror = error as NSError
        print("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}
