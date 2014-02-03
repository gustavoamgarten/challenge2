//
//  Ficha.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Pessoa, Treinos;

@interface Ficha : NSManagedObject

@property (nonatomic, retain) NSDate * dataDaCriacao;
@property (nonatomic, retain) NSNumber * frequencia;
@property (nonatomic, retain) NSNumber * intervalo;
@property (nonatomic, retain) NSNumber * objetivo;
@property (nonatomic, retain) NSNumber * periodoQuantidade;
@property (nonatomic, retain) NSNumber * periodoTipo;
@property (nonatomic, retain) NSSet *listaDeTreinos;
@property (nonatomic, retain) Pessoa *pessoa;


@end

@interface Ficha (CoreDataGeneratedAccessors)

- (void)addListaDeTreinosObject:(Treinos *)value;
- (void)removeListaDeTreinosObject:(Treinos *)value;
- (void)addListaDeTreinos:(NSSet *)values;
- (void)removeListaDeTreinos:(NSSet *)values;

@end
