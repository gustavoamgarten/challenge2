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
@class DetalhesDoExercicio,Exerciciopadrao,Pessoa;


@interface DataStorage : NSObject

+(DataStorage *)sharedRepository;

+(void)setManagedObjectContext:(NSManagedObjectContext *) managedObject;
+(NSManagedObjectContext*)getManagedObjectContext;

//método para recuperar dados do banco local
-(void)reloadData;

//Métodos para pegar dados de tabelas raiz
-(NSArray *)getPessoas;
-(NSArray *)getFichasDeExercicioPadrao;
-(NSArray *)getFichas;

//Métodos para inserir dados em tabelas raiz
-(BOOL)addExercicioPadrao:(NSString*)nome comCategoria:(int)categoria;

-(BOOL)addHomem:(NSString*) nome comDataDeNascimento:(NSDate*) dataDeNascimento;
-(BOOL)addMulher:(NSString*) nome comDataDeNascimento:(NSDate*) dataDeNascimento;

//Métodos para apagar dados de tabelas raiz
-(BOOL)deletePessoa:(Pessoa*)pessoa;
-(BOOL)deleteExercicioPadrao:(Exerciciopadrao*)exercicioPadrao;
@end
