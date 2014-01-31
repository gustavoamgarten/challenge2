//
//  FichaDeTreino.h
//  CDtesteDBA
//
//  Created by Victor Watanabe on 29/01/14.
//  Copyright (c) 2014 KNA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DetalhesDoExercicio, Treinamentos;

@interface FichaDeTreino : NSManagedObject

@property (nonatomic, retain) NSDate * dataDaCriacao;
@property (nonatomic, retain) NSNumber * frequenciaSemanal;
@property (nonatomic, retain) NSNumber * intervaloEntreSequencias;
@property (nonatomic, retain) NSNumber * periodoDeUtilizacaoDaFicha;
@property (nonatomic, retain) NSNumber * periodoEmSemanas;
@property (nonatomic, retain) NSNumber * objetivoDoTreino;
@property (nonatomic, retain) NSString * nomeDoTreinamento;
@property (nonatomic, retain) NSSet *treinamentos;
@property (nonatomic, retain) NSSet *newRelationship;
@end

@interface FichaDeTreino (CoreDataGeneratedAccessors)

- (void)addTreinamentosObject:(Treinamentos *)value;
- (void)removeTreinamentosObject:(Treinamentos *)value;
- (void)addTreinamentos:(NSSet *)values;
- (void)removeTreinamentos:(NSSet *)values;

- (void)addNewRelationshipObject:(DetalhesDoExercicio *)value;
- (void)removeNewRelationshipObject:(DetalhesDoExercicio *)value;
- (void)addNewRelationship:(NSSet *)values;
- (void)removeNewRelationship:(NSSet *)values;

@end
