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

NSString* const tabelaPessoas = @"Pessoa";
NSString* const tabelaDadosFisicos = @"DadosFisicos";
NSString* const tabelaFichasPessoa = @"Ficha";
NSString* const tabelaFichasTreinos = @"Treinos";
NSString* const tabelaFichasExercicios = @"Exercicio";
NSString* const tabelaExerciciosPadrao = @"ExercicioPadrao";

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

-(void)reloadData
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setReturnsObjectsAsFaults:NO];
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
    
    entity = [NSEntityDescription entityForName:tabelaExerciciosPadrao
                         inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    fetchedObjects = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if(fetchedObjects != nil)
    {
        self.fichasExercicioPadrao = [[NSMutableArray alloc]init];
    }
    
    for (Exerciciopadrao *exercicio in fetchedObjects)
    {
        [self.fichasExercicioPadrao addObject:exercicio];
    }
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


#pragma mark - Métodos para gravar dados

-(BOOL)addFichaDeTreino:(NSString*)nome
            comObjetivo:(int) codigoDoObjetivo
        comSemanasDeUso:(int)semanas
comIntervaloEntreSequencias:(int) intervalo
comFrequenciaDeTreinosSemanais:(int) frequencia
{
    //    FichaDeTreino *fichaDeTreino = [NSEntityDescription insertNewObjectForEntityForName:tabelaFichasTreinos
    //                                                                 inManagedObjectContext:_managedObjectContext];
    //
    //    fichaDeTreino.nomeDoTreinamento = nome;
    //    fichaDeTreino.dataDaCriacao = [NSDate date];
    //    fichaDeTreino.intervaloEntreSequencias = [NSNumber numberWithInt:intervalo];
    //    fichaDeTreino.frequenciaSemanal = [NSNumber numberWithInt:frequencia];
    //    fichaDeTreino.periodoDeUtilizacaoDaFicha = [NSNumber numberWithInt:semanas];
    //    fichaDeTreino.periodoEmSemanas = [NSNumber numberWithBool:YES];
    //    fichaDeTreino.objetivoDoTreino = [NSNumber numberWithInt:codigoDoObjetivo];
    //
    //    NSError *error = nil;
    //    if (![fichaDeTreino.managedObjectContext save:&error])
    //    {
    //        return NO;
    //    }
    //
    //    //[self.fetchedResultsController performFetch:&error];
    //    [self reloadData];
    return YES;
}

-(BOOL)addFichaDeTreino:(NSString*)nome
            comObjetivo:(int) codigoDoObjetivo
          comMesesDeUso:(int)meses
comIntervaloEntreSequencias:(int) intervalo
comFrequenciaDeTreinosSemanais:(int) frequencia
{
    //    FichaDeTreino *fichaDeTreino = [NSEntityDescription insertNewObjectForEntityForName:tabelaFichasTreinos
    //                                                                 inManagedObjectContext:_managedObjectContext];
    //
    //    fichaDeTreino.nomeDoTreinamento = nome;
    //    fichaDeTreino.dataDaCriacao = [NSDate date];
    //    fichaDeTreino.intervaloEntreSequencias = [NSNumber numberWithInt:intervalo];
    //    fichaDeTreino.frequenciaSemanal = [NSNumber numberWithInt:frequencia];
    //    fichaDeTreino.periodoDeUtilizacaoDaFicha = [NSNumber numberWithInt:meses];
    //    fichaDeTreino.periodoEmSemanas = [NSNumber numberWithBool:NO];
    //    fichaDeTreino.objetivoDoTreino = [NSNumber numberWithInt:codigoDoObjetivo];
    //
    //    NSError *error = nil;
    //    if (![fichaDeTreino.managedObjectContext save:&error])
    //    {
    //        return NO;
    //    }
    //
    //    //[self.fetchedResultsController performFetch:&error];
    //    [self reloadData];
    return YES;
}

-(BOOL)addFichaDeExercicio:(NSString*) nome
          comPesoUtilizado:(float) peso
     comNumeroDeRepeticoes:(int) repeticoes
         comNumeroDeSeries:(int) series
{
    //    DetalhesDoExercicio *fichaDeExercicio = [NSEntityDescription insertNewObjectForEntityForName:tabelaFichasExercicios
    //                                                                          inManagedObjectContext:_managedObjectContext];
    //    fichaDeExercicio.nomeDoExercicio = nome;
    //    fichaDeExercicio.pesoUtilizado = [NSNumber numberWithFloat:peso];
    //    fichaDeExercicio.numeroDeRepeticoes = [NSNumber numberWithInt:repeticoes];
    //    fichaDeExercicio.numeroDeSeries = [NSNumber numberWithInt:series];
    //
    //    NSError *error = nil;
    //    if (![fichaDeExercicio.managedObjectContext save:&error])
    //    {
    //        return NO;
    //    }
    //
    //    //[self.fetchedResultsController performFetch:&error];
    //    [self reloadData];
    return YES;
}


-(BOOL)addHomem:(NSString*) nome
      comAltura:(float) altura
comDataDeNascimento:(NSDate*) dataDeNascimento
{
    Pessoa *fichaPessoa = [NSEntityDescription insertNewObjectForEntityForName:tabelaPessoas
                                                        inManagedObjectContext:_managedObjectContext];
    
    fichaPessoa.nome = nome;
    fichaPessoa.dataDeNascimento = dataDeNascimento;
    fichaPessoa.sexoMasculino = [NSNumber numberWithBool:YES];
    fichaPessoa.dadosFisicos = [NSEntityDescription insertNewObjectForEntityForName:tabelaDadosFisicos
                                                             inManagedObjectContext:_managedObjectContext];
    
    //fichaPessoa.historicoTreinamento = [NSEntityDescription insertNewObjectForEntityForName:tabelaHistorico
    //                                                                 inManagedObjectContext:_managedObjectContext];
    
    NSError *error = nil;
    if (![fichaPessoa.managedObjectContext save:&error])
    {
        return YES;
    }
    
    //[self.fetchedResultsController performFetch:&error];
    [self reloadData];
    return YES;
}

-(BOOL)addMulher:(NSString*) nome
       comAltura:(float) altura
comDataDeNascimento:(NSDate*) dataDeNascimento
{
    //    Pessoa *fichaPessoa = [NSEntityDescription insertNewObjectForEntityForName:tabelaPessoas
    //                                                        inManagedObjectContext:_managedObjectContext];
    //
    //    fichaPessoa.altura = [NSNumber numberWithFloat:altura];
    //    fichaPessoa.dataDeNascimento = dataDeNascimento;
    //    fichaPessoa.nomeCompleto = nomeCompleto;
    //    fichaPessoa.sexoMasculino = [NSNumber numberWithBool:NO];
    //    fichaPessoa.treinamentos = [NSEntityDescription insertNewObjectForEntityForName:tabelaTreinamentos
    //                                                             inManagedObjectContext:_managedObjectContext];
    //
    //    fichaPessoa.historicoTreinamento = [NSEntityDescription insertNewObjectForEntityForName:tabelaHistorico
    //                                                                     inManagedObjectContext:_managedObjectContext];
    //
    //    NSError *error = nil;
    //    if (![fichaPessoa.managedObjectContext save:&error])
    //    {
    //        return NO;
    //    }
    //    
    //    //[self.fetchedResultsController performFetch:&error];
    //    [self reloadData];
    return YES;
}

@end