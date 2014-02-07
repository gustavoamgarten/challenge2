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

//Adicionar nova rotina de treino na ficha de treinamentos
-(BOOL)addTreino:(NSString*)nome;

//método para pegar o array de fichas de treinos contidos na ficha
-(NSArray*)getListaTreinos;

//métodos para editar individualmente os valores da ficha
-(BOOL)editFrequencia:(int)frequencia;
-(BOOL)editIntervalo:(int)intervalo;
-(BOOL)editObjetivo:(int)objetivo;
-(BOOL)editPeriodoQuantidade:(int)periodoQuantidade;
-(BOOL)editPeriodoTipo:(int)periodoTipo;

//métodos para editar todos os valores da ficha
-(BOOL)editFichaFrequencia:(int)frequencia editIntervalo:(int)intervalo editObjetivo:(int)objetivo editPeriodoQuantidade:(int)periodoQuantidade editPeriodoTipo:(int)periodoTipo;
@end

@interface Ficha (CoreDataGeneratedAccessors)

- (void)addListaDeTreinosObject:(Treinos *)value;
- (void)removeListaDeTreinosObject:(Treinos *)value;
- (void)addListaDeTreinos:(NSSet *)values;
- (void)removeListaDeTreinos:(NSSet *)values;

@end
