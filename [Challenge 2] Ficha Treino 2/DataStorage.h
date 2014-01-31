//
//  DataStorage.h
//  CDtesteDBA
//
//  Created by Victor Watanabe on 29/01/14.
//  Copyright (c) 2014 KNA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FichaDeTreino;
@class DetalhesDoExercicio;

@interface DataStorage : NSObject

+(DataStorage *)sharedRepository;

+(void)setManagedObjectContext:(NSManagedObjectContext *) managedObject;
+(NSManagedObjectContext*)getManagedObjectContext;



-(void)reloadData;

-(NSArray *)getPessoas;
-(NSArray *)getFichasDeTreino;
-(NSArray *)getFichasDeExercicio;


-(BOOL)addFichaDeTreino:(NSString*)nome
                comObjetivo:(int) codigoDoObjetivo
            comSemanasDeUso:(int)semanas
comIntervaloEntreSequencias:(int) intervalo
comFrequenciaDeTreinosSemanais:(int) frequencia;
-(BOOL)addFichaDeTreino:(NSString*)nome comObjetivo:(int) codigoDoObjetivo
              comMesesDeUso:(int)meses comIntervaloEntreSequencias:(int) intervalo
comFrequenciaDeTreinosSemanais:(int) frequencia;
-(BOOL)addFichaDeExercicio:(NSString*) nome comPesoUtilizado:(float) peso
         comNumeroDeRepeticoes:(int) repeticoes comNumeroDeSeries:(int) series;


-(BOOL)addHomem:(NSString*) nomeCompleto
          comAltura:(float) altura
comDataDeNascimento:(NSDate*) dataDeNascimento;
-(BOOL)addMulher:(NSString*) nomeCompleto
           comAltura:(float) altura
 comDataDeNascimento:(NSDate*) dataDeNascimento;
@end
