//
//  Exercicio.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "DataStorage.h"

#import "Exercicio.h"
#import "Exerciciopadrao.h"
#import "Treinos.h"


@implementation Exercicio

@dynamic peso;
@dynamic repeticoes;
@dynamic sequencias;
@dynamic detalhesDoExercicio;
@dynamic treinoRelacionado;

#pragma mark - Métodos de edição de dados do Exercício
#pragma mark - Métodos de edição individual de cada um dos dados
-(BOOL)editPeso:(int)peso
{
    Exercicio *fichaDeExercicio = self;
    
    fichaDeExercicio.peso = [NSNumber numberWithInt:peso];
    
    NSError *error = nil;
    if (![fichaDeExercicio.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

-(BOOL)editRepeticoes:(int)repeticoes
{
    Exercicio *fichaDeExercicio = self;
    
    fichaDeExercicio.repeticoes = [NSNumber numberWithInt:repeticoes];
    
    NSError *error = nil;
    if (![fichaDeExercicio.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

-(BOOL)editSequencias:(int)sequencias
{
    Exercicio *fichaDeExercicio = self;
    
    fichaDeExercicio.sequencias = [NSNumber numberWithInt:sequencias];
    
    NSError *error = nil;
    if (![fichaDeExercicio.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

#pragma mark - Métodos de edição de dados de todos os valores do Exercício
-(BOOL)editExercicioPeso:(int)peso editRepeticoes:(int)repeticoes editSequencias:(int)sequencias
{
    Exercicio *fichaDeExercicio = self;
    
    fichaDeExercicio.peso = [NSNumber numberWithInt:peso];
    fichaDeExercicio.repeticoes = [NSNumber numberWithInt:repeticoes];
    fichaDeExercicio.sequencias = [NSNumber numberWithInt:sequencias];
    
    NSError *error = nil;
    if (![fichaDeExercicio.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}
@end
