//
//  AddMedidasViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 07/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AddMedidasViewController.h"
#import "KeyboardAnimation.h"
#import "DadoFisico.h"
#import "Pessoa.h"

#import "DataStorage.h"

@interface AddMedidasViewController ()<UITextFieldDelegate>

//Text Fields BEGIN
@property (weak, nonatomic) IBOutlet UITextField *pesoTextField;                //1

@property (weak, nonatomic) IBOutlet UITextField *bracoTextField;               //2
@property (weak, nonatomic) IBOutlet UITextField *cinturaTextField;             //3
@property (weak, nonatomic) IBOutlet UITextField *coxaTextField;                //4
@property (weak, nonatomic) IBOutlet UITextField *ombroTextField;               //5
@property (weak, nonatomic) IBOutlet UITextField *panturrilhaTextField;         //6
@property (weak, nonatomic) IBOutlet UITextField *antebracoTextField;           //7
@property (weak, nonatomic) IBOutlet UITextField *quadrisTextField;             //8
@property (weak, nonatomic) IBOutlet UITextField *porcentagemDeGorduraTextField;//9
@property (weak, nonatomic) IBOutlet UITextField *alturaTextField;              //10
//Text Fields END

//botões
@property (weak, nonatomic) IBOutlet UIButton *btnSalvarMedidas;

//Variáveis internas
@property (strong,nonatomic) DadoFisico *dadoFisico;
@property (strong,nonatomic) NSArray *textFields;
@end

@implementation AddMedidasViewController

#pragma mark - Métodos de inicialização
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self iniciarArrayTextFields];
    [self regularDelegatesTextField];
    [self inicializarDadoFisico];
    
    
    
    //necessário para o dismissKeyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    //adicionar o reconhecimento de gesture no view
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - métodos auxiliares

-(void)regularDelegatesTextField
{
    self.pesoTextField.delegate = self;
    
    self.bracoTextField.delegate = self;
    self.cinturaTextField.delegate = self;
    self.coxaTextField.delegate = self;
    self.ombroTextField.delegate = self;
    self.panturrilhaTextField.delegate = self;
    self.antebracoTextField.delegate = self;
    self.quadrisTextField.delegate = self;
    self.porcentagemDeGorduraTextField.delegate = self;
    self.alturaTextField.delegate = self;
}

-(void)inicializarDadoFisico
{
    self.dadoFisico = [[DadoFisico alloc]init];
    
    //Ajustar Valores se necessário
    self.dadoFisico.altura = 0;
    
    self.dadoFisico.braco = 0;
    self.dadoFisico.cintura = 0;
    self.dadoFisico.coxa = 0;
    self.dadoFisico.ombro = 0;
    self.dadoFisico.panturrilha = 0;
    self.dadoFisico.antebraco = 0;
    self.dadoFisico.quadris = 0;
    self.dadoFisico.porcentagemDeGordura = 0;
    self.dadoFisico.peso = 0;
}

-(void)iniciarArrayTextFields
{
    self.textFields = [[NSArray alloc]initWithObjects:  self.pesoTextField,                 //01 index 00
                                                        self.bracoTextField,                //02 index 01
                                                        self.cinturaTextField,              //03 index 02
                                                        self.coxaTextField,                 //04 index 03
                                                        self.ombroTextField,                //05 index 04
                                                        self.panturrilhaTextField,          //06 index 05
                                                        self.antebracoTextField,            //07 index 06
                                                        self.quadrisTextField,              //08 index 07
                                                        self.porcentagemDeGorduraTextField, //09 index 08
                                                        self.alturaTextField,               //10 index 09
                                                        nil];
}

-(void)mudarParaCampoSeguinte:(UITextField *)textFieldAtual
{
    if (textFieldAtual == self.textFields[self.textFields.count -1])
    {
        //se for o último text field pressiona o botao salvar
        [self.btnSalvarMedidas sendActionsForControlEvents:UIControlEventTouchUpInside];
        return;
    }
    else
    {
        //senão muda para o seguinte
        int indexProximo = [self.textFields indexOfObject:textFieldAtual] + 1;
        [(UITextField*)self.textFields[indexProximo] becomeFirstResponder];
    }
}


-(void)repassarEdicoesDoTextFieldParaVariaveis:(UITextField *)textFieldAtual
{
    switch ([self.textFields indexOfObject:textFieldAtual])
    {
        case 0:
            self.dadoFisico.peso = [textFieldAtual.text floatValue];
            break;
            
            
        case 1:
            self.dadoFisico.braco = [textFieldAtual.text floatValue];
            break;
            
        case 2:
            self.dadoFisico.cintura = [textFieldAtual.text floatValue];
            break;
            
        case 3:
            self.dadoFisico.coxa = [textFieldAtual.text floatValue];
            break;
            
        case 4:
            self.dadoFisico.ombro = [textFieldAtual.text floatValue];
            break;
            
        case 5:
            self.dadoFisico.panturrilha = [textFieldAtual.text floatValue];
            break;
            
        case 6:
            self.dadoFisico.antebraco = [textFieldAtual.text floatValue];
            break;
            
        case 7:
            self.dadoFisico.quadris = [textFieldAtual.text floatValue];
            break;
            
        case 8:
            self.dadoFisico.porcentagemDeGordura = [textFieldAtual.text floatValue];
            break;
            
        case 9:
            self.dadoFisico.altura = [textFieldAtual.text floatValue];
            break;
            
        default:
            break;
    }
    
    NSLog(@"\r\nPeso: %f",self.dadoFisico.peso);
    NSLog(@"\r\nBraço: %f",self.dadoFisico.braco);
    NSLog(@"\r\nCintura: %f",self.dadoFisico.cintura);
    NSLog(@"\r\nCoxa: %f",self.dadoFisico.coxa);
    NSLog(@"\r\nOmbro: %f",self.dadoFisico.ombro);
    NSLog(@"\r\npanturrilha: %f",self.dadoFisico.panturrilha);
    NSLog(@"\r\nAntebraço: %f",self.dadoFisico.antebraco);
    NSLog(@"\r\nQuadris: %f",self.dadoFisico.quadris);
    NSLog(@"\r\nPorcentagem de gordura: %f",self.dadoFisico.porcentagemDeGordura);
    NSLog(@"\r\nAltura: %f",self.dadoFisico.altura);
    
}

#pragma mark - eventos de botões e text Field

- (IBAction)salvaExercicio:(UIButton *)sender
{
    [self.pessoaInfo addDadosFisicos:self.dadoFisico];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)campoEditado:(UITextField *)sender
{
    [self repassarEdicoesDoTextFieldParaVariaveis:sender];
}

#pragma mark - métodos do text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [KeyboardAnimation textFieldDidBeginEditing:textField from:self];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [KeyboardAnimation textFieldDidEndedEditing:textField from:self];
    
    //Verifica qual o text field atual e muda para o seguinte
    //[self mudarParaCampoSeguinte:textField];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //ativar evento ao pressionar return/done
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - retirar teclado
-(void)dismissKeyboard
{
    [self dismissAllTextFields];
}

-(void)dismissAllTextFields
{
    for (int i=0; i< self.textFields.count; i++)
    {
        [self.textFields[i] resignFirstResponder];
    }
}
@end
