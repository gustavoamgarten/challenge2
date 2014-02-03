//
//  Exerciciopadrao.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exercicio;

@interface Exerciciopadrao : NSManagedObject

@property (nonatomic, retain) NSNumber * categoria;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSSet *exerciciosRelacionados;

//método para pegar o array de exercicios ao qual este exercicio padrao está relacionado
-(NSArray*)getListaExerciciosRelacionados;
@end

@interface Exerciciopadrao (CoreDataGeneratedAccessors)

- (void)addExerciciosRelacionadosObject:(Exercicio *)value;
- (void)removeExerciciosRelacionadosObject:(Exercicio *)value;
- (void)addExerciciosRelacionados:(NSSet *)values;
- (void)removeExerciciosRelacionados:(NSSet *)values;

@end
