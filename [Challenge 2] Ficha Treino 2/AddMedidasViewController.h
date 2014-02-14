//
//  AddMedidasViewController.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 07/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Pessoa,AcompanhamentoFisicoViewController;

@interface AddMedidasViewController : UIViewController

@property (nonatomic, strong) AcompanhamentoFisicoViewController *rootController;
@property(strong,nonatomic) Pessoa* pessoaInfo;

-(void)inicializarDadoFisico;
-(void)regularDelegatesTextField;
-(void)iniciarArrayTextFields;
-(void)mudarParaCampoSeguinte:(UITextField *)textFieldAtual;
-(void)repassarEdicoesDoTextFieldParaVariaveis:(UITextField *)textFieldAtual;
@end
