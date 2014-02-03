//
//  DataStorage.m
//  CDtesteDBA
//
//  Created by Victor Watanabe on 29/01/14.
//  Copyright (c) 2014 KNA. All rights reserved.
//

#import "DataStorage.h"

#import "Pessoa.h"
#import "DadoFisico.h"
#import "Ficha.h"
#import "Exerciciopadrao.h"
#import "Treinos.h"
#import "Exercicio.h"

@interface DataStorage()
@property NSMutableArray *pessoas;
@property NSMutableArray *fichasExercicioPadrao;
@end



@implementation DataStorage

//NSString* const tabelaPessoas = @"Pessoa";
//NSString* const tabelaDadosFisicos = @"DadosFisicos";
//NSString* const tabelaFichasPessoa = @"Ficha";
//NSString* const tabelaFichasTreinos = @"Treinos";
//NSString* const tabelaFichasExercicios = @"Exercicio";
//NSString* const tabelaExerciciosPadrao = @"ExercicioPadrao";

static DataStorage *_dataStorageRepository = nil;
static NSManagedObjectContext *_managedObjectContext;

#pragma mark - Initialization Methods

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [DataStorage sharedRepository];
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        [self initArrays];
    }
    
    return self;
}


-(void)initArrays
{
    self.pessoas = [[NSMutableArray alloc] init];
    self.fichasExercicioPadrao = [[NSMutableArray alloc]init];
}

#pragma mark - Singleton methods

+(DataStorage *)sharedRepository
{
    if (!_dataStorageRepository) {
        _dataStorageRepository= [[super allocWithZone:nil] init];
    }
    
    return _dataStorageRepository;
}

#pragma mark - Ajustes Managed Object

+(void)setManagedObjectContext:(NSManagedObjectContext *) managedObject
{
    _managedObjectContext = managedObject;
}

+(NSManagedObjectContext*)getManagedObjectContext
{
    return _managedObjectContext;
}



#pragma mark - Recuperar dados DBA


-(NSArray*)reloadEntity:(NSString*)entityName
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setReturnsObjectsAsFaults:NO];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:_managedObjectContext];
    NSError *error;
    
    
    [fetchRequest setEntity:entity];
     return [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
}


-(NSArray*)reloadPessoa
{
    return [self reloadEntity:tabelaFichasPessoa];
}

-(NSArray*)reloadFichas
{
    return [self reloadEntity:tabelaFichasPessoa];
}

-(NSArray*)reloadDadosFisicos
{
    return [self reloadEntity:tabelaDadosFisicos];
}

-(NSArray*)reloadExercicios
{
    return [self reloadEntity:tabelaFichasExercicios];
}

-(NSArray*)reloadTreinos
{
    return [self reloadEntity:tabelaFichasTreinos];
}

-(NSArray*)reloadExerciciosPadrao
{
    return [self reloadEntity:tabelaExerciciosPadrao];
}

-(void)reloadData
{
    //Alimenta o array com os dados da pessoa;
    NSArray *fetchedObjects = [self reloadPessoa];
    
    if(fetchedObjects != nil)
    {
        self.pessoas = [[NSMutableArray alloc]init];
    }
    
    for (Pessoa *pessoa in fetchedObjects)
    {
        
        [self.pessoas addObject:pessoa];
    }
    
    
    //Alimenta o Array com os exercíios padrao
    fetchedObjects = [self reloadExerciciosPadrao];
    
    if(fetchedObjects != nil)
    {
        self.fichasExercicioPadrao = [[NSMutableArray alloc]init];
    }
    
    for (Exerciciopadrao *exercicio in fetchedObjects)
    {
        [self.fichasExercicioPadrao addObject:exercicio];
    }
    
    //recarrega todas as tabelas restantes
    [self reloadFichas];
    [self reloadDadosFisicos];
    [self reloadTreinos];
    [self reloadExercicios];
}

#pragma mark - Métodos para recuperar dados
-(NSArray *)getPessoas
{
    return [self.pessoas copy];
}

-(NSArray *)getFichasDeExercicioPadrao
{
    return [self.fichasExercicioPadrao copy];
}

#pragma mark - Métodos para adicionar exercício Padrão

-(BOOL)addExercicioPadrao:(NSString*)nome comCategoria:(int)categoria
{
    Exerciciopadrao *exercicoPadrao = [NSEntityDescription insertNewObjectForEntityForName:tabelaExerciciosPadrao
                                                        inManagedObjectContext:_managedObjectContext];
    
    exercicoPadrao.nome = nome;
    exercicoPadrao.categoria = [NSNumber numberWithInt:categoria];
    
    
    NSError *error = nil;
    if (![exercicoPadrao.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [self reloadData];
    return YES;
}

#pragma mark - Métodos para adicionar dados de Pessoas
-(BOOL)addHomem:(NSString*) nome
comDataDeNascimento:(NSDate*) dataDeNascimento
{
    Pessoa *fichaPessoa = [NSEntityDescription insertNewObjectForEntityForName:tabelaPessoas
                                                        inManagedObjectContext:_managedObjectContext];
    
    fichaPessoa.nome = nome;
    fichaPessoa.dataDeNascimento = dataDeNascimento;
    fichaPessoa.sexoMasculino = [NSNumber numberWithBool:YES];
    fichaPessoa.dadosFisicos = [NSEntityDescription insertNewObjectForEntityForName:tabelaDadosFisicos
                                                             inManagedObjectContext:_managedObjectContext];
    
    NSError *error = nil;
    if (![fichaPessoa.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [self reloadData];
    return YES;
}

-(BOOL)addMulher:(NSString*) nome
comDataDeNascimento:(NSDate*) dataDeNascimento
{
    Pessoa *fichaPessoa = [NSEntityDescription insertNewObjectForEntityForName:tabelaPessoas
                                                        inManagedObjectContext:_managedObjectContext];
    
    fichaPessoa.nome = nome;
    fichaPessoa.dataDeNascimento = dataDeNascimento;
    fichaPessoa.sexoMasculino = [NSNumber numberWithBool:NO];
    fichaPessoa.dadosFisicos = [NSEntityDescription insertNewObjectForEntityForName:tabelaDadosFisicos
                                                             inManagedObjectContext:_managedObjectContext];
    
    
    NSError *error = nil;
    if (![fichaPessoa.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [self reloadData];
    return YES;
}

@end