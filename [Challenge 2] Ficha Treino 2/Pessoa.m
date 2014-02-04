//
//  Pessoa.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Pessoa.h"
#import "DadosFisicos.h"
#import "Ficha.h"
#import "DataStorage.h"

@implementation Pessoa

@dynamic dataDeNascimento;
@dynamic nome;
@dynamic sexoMasculino;
@dynamic dadosFisicos;
@dynamic fichas;


-(NSArray*)getFichas
{
    return [self.fichas allObjects];
}

#pragma mark - métodos para adição de dados
-(BOOL) addFichaComObjetivo:(int)objetivo comFrequencia:(int)frequencia comPeriodoQuantidade:(int)periodoQuantidade
                     comPeriodoTipo:(int)periodoTipo comIntervalo:(int)intervalo
{
    Ficha *fichaDeTreinos = [NSEntityDescription insertNewObjectForEntityForName:tabelaFichasPessoa
                                                        inManagedObjectContext:self.managedObjectContext];
    
    fichaDeTreinos.dataDaCriacao = [NSDate date];
    fichaDeTreinos.objetivo = [NSNumber numberWithInt:objetivo];
    fichaDeTreinos.frequencia = [NSNumber numberWithInt:frequencia];
    fichaDeTreinos.periodoQuantidade = [NSNumber numberWithInt:periodoQuantidade];
    fichaDeTreinos.periodoTipo = [NSNumber numberWithInt:periodoTipo];
    fichaDeTreinos.intervalo = [NSNumber numberWithInt:intervalo];
    
    [fichaDeTreinos.managedObjectContext save:nil];
    
    fichaDeTreinos.pessoa = self;
    
    NSError *error = nil;
    if (![fichaDeTreinos.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}


-(BOOL)addDadosFisicos:(DadoFisico*)dados
{
    DadosFisicos *dadosFisicos = self.dadosFisicos;
    NSMutableArray *arrayDeDados = [[NSMutableArray alloc]initWithArray:dadosFisicos.dadosFisicos];
    [arrayDeDados addObject:dados];
    
    dadosFisicos.dadosFisicos = arrayDeDados;
    
    NSError *error = nil;
    if (![dadosFisicos.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

@end
