//
//  Exerciciopadrao.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Exerciciopadrao.h"
#import "Exercicio.h"


@implementation Exerciciopadrao

@dynamic categoria;
@dynamic nome;
@dynamic exerciciosRelacionados;


-(NSArray*)getListaExerciciosRelacionados
{
    return [self.exerciciosRelacionados allObjects];
}
@end
