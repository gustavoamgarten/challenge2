//
//  CriarFichaViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/5/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "CriarFichaViewController.h"
#import "Pessoa.h"
#import "DataStorage.h"
#import "KeyboardAnimation.h"

@interface CriarFichaViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *frequenciaTextField;
@property (weak, nonatomic) IBOutlet UITextField *intervaloTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *objetivoSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *periodoTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *periodoTipoSegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *btnCriar;

@end

@implementation CriarFichaViewController

#pragma mark - metodos de inicialização
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
    
    self.frequenciaTextField.delegate = self;
    self.intervaloTextField.delegate = self;
    self.periodoTextField.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    //seleciona o primeiro campo para digitação
    [self.frequenciaTextField becomeFirstResponder];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [KeyboardAnimation textFieldViewReset:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - eventos clique botão
- (IBAction)criarFicha:(UIButton *)sender {
    [[DataStorage sharedRepository] reloadData];
    NSArray *pessoas = [[DataStorage sharedRepository] getPessoas];
    Pessoa *usuario = pessoas[0];
    
    [usuario addFichaComObjetivo:self.objetivoSegmentedControl.selectedSegmentIndex comFrequencia:[self.frequenciaTextField.text integerValue] comPeriodoQuantidade:[self.periodoTextField.text integerValue] comPeriodoTipo:self.periodoTipoSegmentedControl.selectedSegmentIndex comIntervalo:[self.intervaloTextField.text integerValue]];
    
    [self performSegueWithIdentifier:@"fichaCriada" sender:self];
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
    if(textField == self.frequenciaTextField)
    {
        [self.intervaloTextField becomeFirstResponder];
    }
    else if(textField == self.intervaloTextField)
    {
        [self.periodoTextField becomeFirstResponder];
    }
    else if(textField == self.periodoTextField)
    {
        [self.frequenciaTextField becomeFirstResponder];
        //[self.btnCriar sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //ativar evento ao pressionar return/done
    [textField resignFirstResponder];
    return YES;
}
@end
