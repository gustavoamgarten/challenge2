//
//  Treinos.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Treinos.h"
#import "Exercicio.h"
#import "Ficha.h"
#import "DataStorage.h"


@implementation Treinos

@dynamic nome;
@dynamic fichaRelacionada;
@dynamic listaDeExercicios;

-(NSArray *)getListaExercicios
{
    return [self.listaDeExercicios allObjects];
}

-(BOOL)addExercicio:(Exerciciopadrao*)exercicioPadrao comPeso:(int)peso comRepeticoes:(int)repeticoes comSequencias:(int)sequencias;
{
    
    Exercicio *fichaDeExercicio = [NSEntityDescription insertNewObjectForEntityForName:tabelaFichasExercicios
                                                          inManagedObjectContext:self.managedObjectContext];

    fichaDeExercicio.peso = [NSNumber numberWithInt:peso];
    fichaDeExercicio.repeticoes = [NSNumber numberWithInt:repeticoes];
    fichaDeExercicio.sequencias = [NSNumber numberWithInt:sequencias];
    fichaDeExercicio.detalhesDoExercicio = exercicioPadrao;
    fichaDeExercicio.treinoRelacionado = self;
    
    NSError *error = nil;
    if (![fichaDeExercicio.managedObjectContext save:&error])
    {
        return NO;
    }
    
    [[DataStorage sharedRepository]reloadData];
    return YES;
}

@end
