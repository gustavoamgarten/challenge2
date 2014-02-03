//
//  DataStorage.h
//  CDtesteDBA
//
//  Created by Victor Watanabe on 29/01/14.
//  Copyright (c) 2014 KNA. All rights reserved.
//

#import <Foundation/Foundation.h>

#define tabelaPessoas @"Pessoa"
#define tabelaDadosFisicos @"DadosFisicos"
#define tabelaFichasPessoa @"Ficha"
#define tabelaFichasTreinos @"Treinos"
#define tabelaFichasExercicios @"Exercicio"
#define tabelaExerciciosPadrao @"ExercicioPadrao"

@class FichaDeTreino;
@class DetalhesDoExercicio;


@interface DataStorage : NSObject

+(DataStorage *)sharedRepository;

+(void)setManagedObjectContext:(NSManagedObjectContext *) managedObject;
+(NSManagedObjectContext*)getManagedObjectContext;



-(void)reloadData;

-(NSArray *)getPessoas;
-(NSArray *)getFichasDeExercicioPadrao;

//
//-(BOOL)addFichaDeTreino:(NSString*)nome
//            comObjetivo:(int) codigoDoObjetivo
//        comSemanasDeUso:(int)semanas
//comIntervaloEntreSequencias:(int) intervalo
//comFrequenciaDeTreinosSemanais:(int) frequencia;
//
//-(BOOL)addFichaDeTreino:(NSString*)nome comObjetivo:(int) codigoDoObjetivo
//          comMesesDeUso:(int)meses comIntervaloEntreSequencias:(int) intervalo
//comFrequenciaDeTreinosSemanais:(int) frequencia;
//
//-(BOOL)addFichaDeExercicio:(NSString*) nome comPesoUtilizado:(float) peso
//     comNumeroDeRepeticoes:(int) repeticoes comNumeroDeSeries:(int) series;
//

-(BOOL)addExercicioPadrao:(NSString*)nome comCategoria:(int)categoria;

-(BOOL)addHomem:(NSString*) nome comDataDeNascimento:(NSDate*) dataDeNascimento;
-(BOOL)addMulher:(NSString*) nome comDataDeNascimento:(NSDate*) dataDeNascimento;
@end
