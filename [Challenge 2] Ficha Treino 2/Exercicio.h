//
//  Exercicio.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exerciciopadrao, Treinos;

@interface Exercicio : NSManagedObject

@property (nonatomic, retain) NSNumber * peso;
@property (nonatomic, retain) NSNumber * repeticoes;
@property (nonatomic, retain) NSNumber * sequencias;
@property (nonatomic, retain) Exerciciopadrao *detalhesDoExercicio;
@property (nonatomic, retain) Treinos *treinoRelacionado;

@end
