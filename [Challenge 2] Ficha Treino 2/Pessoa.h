//
//  Pessoa.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DadosFisicos, Ficha, DadoFisico;

@interface Pessoa : NSManagedObject

@property (nonatomic, retain) NSDate * dataDeNascimento;
@property (nonatomic, retain) NSNumber * fichaAtiva;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * sexoMasculino;
@property (nonatomic, retain) DadosFisicos *dadosFisicos;
@property (nonatomic, retain) NSSet *fichas;

//método para adicionar nova ficha de treino da pessoa
-(BOOL) addFichaComObjetivo:(int)objetivo comFrequencia:(int)frequencia comPeriodoQuantidade:(int)periodoQuantidade
                     comPeriodoTipo:(int)periodoTipo comIntervalo:(int)intervalo;

//método para inserir medidas da pessoa
-(BOOL)addDadosFisicos:(DadoFisico*)dados;

//método para pegar o array de fichas de treino da pessoa
-(NSArray*)getFichas;

//método para recuperar dados fisicos
- (DadosFisicos *)getDadosFisicos;
@end

@interface Pessoa (CoreDataGeneratedAccessors)

- (void)addFichasObject:(Ficha *)value;
- (void)removeFichasObject:(Ficha *)value;
- (void)addFichas:(NSSet *)values;
- (void)removeFichas:(NSSet *)values;

@end
