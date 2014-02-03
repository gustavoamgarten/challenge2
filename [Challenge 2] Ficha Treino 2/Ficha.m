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

@end
