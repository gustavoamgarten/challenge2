//
//  AppDelegate.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 1/28/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AppDelegate.h"

#import "FichaViewController.h"
#import "DataStorage.h"

#import "Pessoa.h"
#import "DadoFisico.h"
#import "Ficha.h"
#import "Exerciciopadrao.h"
#import "Treinos.h"
#import "Exercicio.h"


@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Override point for customization after application launch.
    //UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    //FichaViewController *controller = (FichaViewController *)navigationController.topViewController;
    //FichaViewController *controller = [[FichaViewController alloc] init];
    //controller.managedObjectContext = self.managedObjectContext;
    
    
    //recupera qual o contexto
    NSManagedObjectContext *context = [self managedObjectContext];
    //setar qual o contexto para gerenciar os dados do banco local
    [DataStorage setManagedObjectContext:context];
    //recupera os dados do banco de dados local
    [[DataStorage sharedRepository]reloadData];
    
    
    
    
    
    //recupera os arrays de pessoa e exercicio padrao
//    NSArray* pessoas = [[DataStorage sharedRepository]getPessoas];
//    NSArray* exercicoPadrao =[[DataStorage sharedRepository]getFichasDeExercicioPadrao];
    
    
//    Pessoa* pessoaInfo = pessoas[0];
    //NSLog(@"\r\nPESSOAS CADASTRADAS [%d]: \r\n%@\r\nEND",[pessoas count],pessoas);
    
    //[pessoaInfo removeFichasObject:[pessoaInfo getFichas][([[pessoaInfo getFichas] count]-1)]] ;
    
    //apaga a ultima pessoa
    //[[DataStorage sharedRepository]deletePessoa:pessoas[[pessoas count ]-1]];
    
//    [[DataStorage sharedRepository]addExercicioPadrao:@"Supino" comCategoria:1];
    //[[DataStorage sharedRepository]addExercicioPadrao:@"Rosca" comCategoria:1];
//    exercicoPadrao =[[DataStorage sharedRepository]getFichasDeExercicioPadrao];
    
//    NSDateComponents *componentes = [[NSDateComponents alloc]init];
//    [componentes setYear:1980];
//    [componentes setMonth:8];
//    [componentes setDay:19];
//    
//    [[DataStorage sharedRepository]addHomem:@"Joao Mariano" comDataDeNascimento:[[NSCalendar currentCalendar] dateFromComponents:componentes]];
//    
//    
//    //recupera os arrais de pessoa e exercicio padrao (eles não são atualizados porque o array passado é uma cópia)
//    pessoas = [[DataStorage sharedRepository]getPessoas];
//    Pessoa *pessoaInfo =  (Pessoa*)pessoas[0];
//    DadoFisico *dadoFisico = [[DadoFisico alloc]init];
//    dadoFisico.braco = arc4random()%30;
//    dadoFisico.cintura = arc4random()%30;
//    dadoFisico.coxa = arc4random()%30;
//    dadoFisico.ombro = arc4random()%30;
//    dadoFisico.panturrilha = arc4random()%30;
//    dadoFisico.antebraco = arc4random()%30;
//    dadoFisico.quadris = arc4random()%115;
//    dadoFisico.porcentagemDeGordura = arc4random()%80;
//    dadoFisico.altura = 1.75f;
//    
//    //[pessoaInfo addDadosFisicos:dadoFisico];
//    [pessoaInfo addFichaComObjetivo:1 comFrequencia:3 comPeriodoQuantidade:2 comPeriodoTipo:1 comIntervalo:3];
//    Ficha *fichaPessoa = [pessoaInfo getFichas][0];
//    [fichaPessoa addTreino:@"Treino A"];
//    Treinos *fichaTreinamento = [fichaPessoa getListaTreinos][0];
//    [fichaTreinamento addExercicio:exercicoPadrao[0]  comPeso:10 comRepeticoes:12 comSequencias:3];
//    
//    
//    exercicoPadrao =[[DataStorage sharedRepository]getFichasDeExercicioPadrao];
//    
//
//   NSLog(@"\r\nPESSOAS CADASTRADAS [%d]: \r\n%@\r\nEND",[pessoas count],pessoas);
//    
//   NSLog(@"\r\nEXERCICOS CADASTRADOS [%d]: \r\n%@\r\nEND",[exercicoPadrao count],exercicoPadrao);
//    
//    for (Pessoa* PessoaInfo in pessoas)
//    {
//        for(Ficha* fichaPessoa in PessoaInfo.fichas)
//        {
//            NSLog(@"\r\nFicha de pessoa relacionados: \r\n%@\r\nEND",fichaPessoa);
//            [fichaPessoa editFichaFrequencia:1 editIntervalo:2 editObjetivo:3 editPeriodoQuantidade:4 editPeriodoTipo:5];
//        }
//    }
    
//    for (Exerciciopadrao* exercicioPadraoColetado in exercicoPadrao)
//    {
//        for(Exercicio* ExercRelacionado in exercicioPadraoColetado.exerciciosRelacionados)
//        {
//            NSLog(@"\r\nEXERCICOS Relacionados: \r\n%@\r\nEND",ExercRelacionado);
//            [ExercRelacionado editExercicioPeso:10 editRepeticoes:11 editSequencias:12];
//        }
//    }
//
//
//    [[DataStorage sharedRepository]deleteExercicioPadrao:exercicoPadrao[0]];
//    
//    pessoas = [[DataStorage sharedRepository]getPessoas];
//    exercicoPadrao =[[DataStorage sharedRepository]getFichasDeExercicioPadrao];
//    
//    
//    NSLog(@"\r\nPESSOAS CADASTRADAS [%d]: \r\n%@\r\nEND",[pessoas count],pessoas);
//    
//    NSLog(@"\r\nEXERCICOS CADASTRADOS [%d]: \r\n%@\r\nEND",[exercicoPadrao count],exercicoPadrao);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"fichas" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"fichas.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
