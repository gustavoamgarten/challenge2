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

//recupera uma entidade com o nome especificado
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
    return [self reloadEntity:tabelaPessoas];
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

//recupera os dados de todas as tabelas e atualiza os arrays com dados de pessoas e exercícios padrão
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
//Retorna uma cópia do array de pessoas
-(NSArray *)getPessoas
{
    return [self.pessoas copy];
}

//Retorna uma cópia do array de exercicios padrão
-(NSArray *)getFichasDeExercicioPadrao
{
    return [self.fichasExercicioPadrao copy];
}

#pragma mark Metodos para adicionar dados

#pragma mark - Métodos para adicionar exercício Padrão
//Adiciona um exercicio padrão
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
//Adiciona uma ficha de Pessoa do sexo masculino
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

//Adiciona uma ficha de Pessoa do sexo feminino
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

#pragma mark - Métodos para apagar dados

#pragma mark - Método para apagar pessoa

-(BOOL)deletePessoa:(Pessoa*)pessoa
{
    [_managedObjectContext deleteObject:pessoa];
    
    NSError *error = nil;
    if (![_managedObjectContext save:&error])
    {
        return NO;
    }
    
    [self reloadData];
    return YES;
}

#pragma mark - Método para apagar exercicio padrão

-(BOOL)deleteExercicioPadrao:(Exerciciopadrao*)exercicioPadrao
{
    [_managedObjectContext deleteObject:exercicioPadrao];
    
    NSError *error = nil;
    if (![_managedObjectContext save:&error])
    {
        return NO;
    }
    
    [self reloadData];
    return YES;
}
@end