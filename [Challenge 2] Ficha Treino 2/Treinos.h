//
//  Treinos.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exercicio, Ficha, Exerciciopadrao;

@interface Treinos : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) Ficha *fichaRelacionada;
@property (nonatomic, retain) NSSet *listaDeExercicios;

//adicionar novo exercício na ficha de treino
-(BOOL)addExercicio:(Exerciciopadrao*)exercicioPadrao comPeso:(int)peso comRepeticoes:(int)repeticoes comSequencias:(int)sequencias;


//método para pegar o array de fichas de exercícios contidos no treino
-(NSArray*)getListaExercicios;
@end

@interface Treinos (CoreDataGeneratedAccessors)

- (void)addListaDeExerciciosObject:(Exercicio *)value;
- (void)removeListaDeExerciciosObject:(Exercicio *)value;
- (void)addListaDeExercicios:(NSSet *)values;
- (void)removeListaDeExercicios:(NSSet *)values;

@end
