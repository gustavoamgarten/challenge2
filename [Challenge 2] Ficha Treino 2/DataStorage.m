//
//  DataStorage.m
//  CDtesteDBA
//
//  Created by Victor Watanabe on 29/01/14.
//  Copyright (c) 2014 KNA. All rights reserved.
//

#import "DataStorage.h"
#import "Pessoa.h"
#import "HistoricoTreinamento.h"
#import "Treinamentos.h"
#import "FichaDeTreino.h"
#import "DetalhesDoExercicio.h"

@interface DataStorage()
@property NSMutableArray *pessoas;
@property NSMutableArray *fichasDeTreino;
@property NSMutableArray *fichasDeExercicio;
@end


@implementation DataStorage

NSString* const tabelaPessoas = @"Pessoa";
NSString* const tabelaHistorico = @"HistoricoTreinamento";
NSString* const tabelaTreinamentos = @"Treinamentos";
NSString* const tabelaFichasTreinos = @"FichaDeTreino";
NSString* const tabelaFichasExercicios = @"DetalhesDoExercicio";

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
    self.fichasDeTreino = [[NSMutableArray alloc]init];
    self.fichasDeExercicio = [[NSMutableArray alloc]init];
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

-(void)reloadData
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:tabelaPessoas
                                              inManagedObjectContext:_managedObjectContext];
    NSError *error;
    
    
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if(fetchedObjects != nil)
    {
        self.pessoas = [[NSMutableArray alloc]init];
    }
    
    for (Pessoa *pessoa in fetchedObjects)
    {
        [self.pessoas addObject:pessoa];
    }
    
    
    entity = [NSEntityDescription entityForName:tabelaFichasTreinos
                         inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    fetchedObjects = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if(fetchedObjects != nil)
    {
        self.fichasDeTreino = [[NSMutableArray alloc]init];
    }
    
    for (FichaDeTreino *treino in fetchedObjects)
    {
        [self.fichasDeTreino addObject:treino];
    }
    
    
    entity = [NSEntityDescription entityForName:tabelaFichasExercicios
                         inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    fetchedObjects = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if(fetchedObjects != nil)
    {
        self.fichasDeExercicio = [[NSMutableArray alloc]init];
    }
    
    for (DetalhesDoExercicio *exercicio in fetchedObjects)
    {
        [self.fichasDeExercicio addObject:exercicio];
    }
}

#pragma mark - Métodos para recuperar dados
-(NSArray *)getPessoas
{
    return [self.pessoas copy];
}

-(NSArray *)getFichasDeTreino
{
    return [self.fichasDeTreino copy];
}

-(NSArray *)getFichasDeExercicio
{
    return [self.fichasDeExercicio copy];
}

#pragma mark - Métodos para gravar dados

-(BOOL)addFichaDeTreino:(NSString*)nome
                comObjetivo:(int) codigoDoObjetivo
            comSemanasDeUso:(int)semanas
comIntervaloEntreSequencias:(int) intervalo
comFrequenciaDeTreinosSemanais:(int) frequencia
{
    FichaDeTreino *fichaDeTreino = [NSEntityDescription insertNewObjectForEntityForName:tabelaFichasTreinos
                                                                 inManagedObjectContext:_managedObjectContext];
    
    fichaDeTreino.nomeDoTreinamento = nome;
    fichaDeTreino.dataDaCriacao = [NSDate date];
    fichaDeTreino.intervaloEntreSequencias = [NSNumber numberWithInt:intervalo];
    fichaDeTreino.frequenciaSemanal = [NSNumber numberWithInt:frequencia];
    fichaDeTreino.periodoDeUtilizacaoDaFicha = [NSNumber numberWithInt:semanas];
    fichaDeTreino.periodoEmSemanas = [NSNumber numberWithBool:YES];
    fichaDeTreino.objetivoDoTreino = [NSNumber numberWithInt:codigoDoObjetivo];
    
    NSError *error = nil;
    if (![fichaDeTreino.managedObjectContext save:&error])
    {
        return NO;
    }
    
    //[self.fetchedResultsController performFetch:&error];
    [self reloadData];
    return YES;
}

-(BOOL)addFichaDeTreino:(NSString*)nome
                comObjetivo:(int) codigoDoObjetivo
              comMesesDeUso:(int)meses
comIntervaloEntreSequencias:(int) intervalo
comFrequenciaDeTreinosSemanais:(int) frequencia
{
    FichaDeTreino *fichaDeTreino = [NSEntityDescription insertNewObjectForEntityForName:tabelaFichasTreinos
                                                                 inManagedObjectContext:_managedObjectContext];
    
    fichaDeTreino.nomeDoTreinamento = nome;
    fichaDeTreino.dataDaCriacao = [NSDate date];
    fichaDeTreino.intervaloEntreSequencias = [NSNumber numberWithInt:intervalo];
    fichaDeTreino.frequenciaSemanal = [NSNumber numberWithInt:frequencia];
    fichaDeTreino.periodoDeUtilizacaoDaFicha = [NSNumber numberWithInt:meses];
    fichaDeTreino.periodoEmSemanas = [NSNumber numberWithBool:NO];
    fichaDeTreino.objetivoDoTreino = [NSNumber numberWithInt:codigoDoObjetivo];
    
    NSError *error = nil;
    if (![fichaDeTreino.managedObjectContext save:&error])
    {
        return NO;
    }
    
    //[self.fetchedResultsController performFetch:&error];
    [self reloadData];
    return YES;
}

-(BOOL)addFichaDeExercicio:(NSString*) nome
              comPesoUtilizado:(float) peso
         comNumeroDeRepeticoes:(int) repeticoes
             comNumeroDeSeries:(int) series
{
    DetalhesDoExercicio *fichaDeExercicio = [NSEntityDescription insertNewObjectForEntityForName:tabelaFichasExercicios
                                                                          inManagedObjectContext:_managedObjectContext];
    fichaDeExercicio.nomeDoExercicio = nome;
    fichaDeExercicio.pesoUtilizado = [NSNumber numberWithFloat:peso];
    fichaDeExercicio.numeroDeRepeticoes = [NSNumber numberWithInt:repeticoes];
    fichaDeExercicio.numeroDeSeries = [NSNumber numberWithInt:series];
    
    NSError *error = nil;
    if (![fichaDeExercicio.managedObjectContext save:&error])
    {
        return NO;
    }
    
    //[self.fetchedResultsController performFetch:&error];
    [self reloadData];
    return YES;
}
@end