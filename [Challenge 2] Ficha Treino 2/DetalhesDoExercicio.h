//
//  DetalhesDoExercicio.h
//  CDtesteDBA
//
//  Created by Victor Watanabe on 29/01/14.
//  Copyright (c) 2014 KNA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FichaDeTreino;

@interface DetalhesDoExercicio : NSManagedObject

@property (nonatomic, retain) NSString * nomeDoExercicio;
@property (nonatomic, retain) NSNumber * pesoUtilizado;
@property (nonatomic, retain) NSNumber * numeroDeRepeticoes;
@property (nonatomic, retain) NSNumber * numeroDeSeries;
@property (nonatomic, retain) NSSet *fichasDeTreino;
@end

@interface DetalhesDoExercicio (CoreDataGeneratedAccessors)

- (void)addFichasDeTreinoObject:(FichaDeTreino *)value;
- (void)removeFichasDeTreinoObject:(FichaDeTreino *)value;
- (void)addFichasDeTreino:(NSSet *)values;
- (void)removeFichasDeTreino:(NSSet *)values;

@end
