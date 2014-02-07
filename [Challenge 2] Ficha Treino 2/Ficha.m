//
//  Ficha.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Ficha.h"
#import "Pessoa.h"
#import "Treinos.h"
#import "DataStorage.h"

@implementation Ficha

@dynamic dataDaCriacao;
@dynamic frequencia;
@dynamic intervalo;
@dynamic objetivo;
@dynamic periodoQuantidade;
@dynamic periodoTipo;
@dynamic listaDeTreinos;
@dynamic pessoa;

#pragma mark - retornar objetos relacionados (Treinos)
-(NSArray*)getListaTreinos
{
    return [self.listaDeTreinos allObjects];
}

#pragma mark - Adicionar treino relacionado
-(BOOL)addTreino:(NSString*)nome
{
    
    Treinos *fichaDeTreino = [NSEntityDescription insertNewObjectForEntityForName:tabelaFichasTreinos
                                                                inManagedObjectContext:self.managedObjectContext];
    
    fichaDeTreino.nome = nome;
    fichaDeTreino.fichaRelacionada = self;
    
    NSError *error = nil;
    if (![fichaDeTreino.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

#pragma mark - Métodos para editar valores da ficha
#pragma mark - métodos para editar individualmente os valores

//métodos para editar individualmente os valores da ficha
-(BOOL)editFrequencia:(int)frequencia
{
    Ficha *fichaDePessoa = self;
    
    fichaDePessoa.frequencia = [NSNumber numberWithInt:frequencia];
    
    NSError *error = nil;
    if (![fichaDePessoa.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

-(BOOL)editIntervalo:(int)intervalo
{
    Ficha *fichaDePessoa = self;
    
    fichaDePessoa.intervalo = [NSNumber numberWithInt:intervalo];
    
    NSError *error = nil;
    if (![fichaDePessoa.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

-(BOOL)editObjetivo:(int)objetivo
{
    Ficha *fichaDePessoa = self;
    
    fichaDePessoa.objetivo = [NSNumber numberWithInt:objetivo];
    
    NSError *error = nil;
    if (![fichaDePessoa.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

-(BOOL)editPeriodoQuantidade:(int)periodoQuantidade
{
    Ficha *fichaDePessoa = self;
    
    fichaDePessoa.periodoQuantidade = [NSNumber numberWithInt:periodoQuantidade];
    
    NSError *error = nil;
    if (![fichaDePessoa.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

-(BOOL)editPeriodoTipo:(int)periodoTipo
{
    Ficha *fichaDePessoa = self;
    
    fichaDePessoa.periodoTipo = [NSNumber numberWithInt:periodoTipo];
    
    NSError *error = nil;
    if (![fichaDePessoa.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

#pragma mark - métodos para editar todos os valores
//métodos para editar todos os valores da ficha
-(BOOL)editFichaFrequencia:(int)frequencia editIntervalo:(int)intervalo editObjetivo:(int)objetivo editPeriodoQuantidade:(int)periodoQuantidade editPeriodoTipo:(int)periodoTipo
{
    Ficha *fichaDePessoa = self;
    
    fichaDePessoa.frequencia = [NSNumber numberWithInt:frequencia];
    fichaDePessoa.intervalo = [NSNumber numberWithInt:intervalo];
    fichaDePessoa.objetivo = [NSNumber numberWithInt:objetivo];
    fichaDePessoa.periodoQuantidade = [NSNumber numberWithInt:periodoQuantidade];
    fichaDePessoa.periodoTipo = [NSNumber numberWithInt:periodoTipo];
    
    NSError *error = nil;
    if (![fichaDePessoa.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

@end
