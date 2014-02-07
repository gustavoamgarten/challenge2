//
//  EditarExercicioViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/7/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "EditarExercicioViewController.h"
#import "KeyboardAnimation.h"

@interface EditarExercicioViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nomeExercicioLabel;
@property (weak, nonatomic) IBOutlet UITextField *pesoTextField;
@property (weak, nonatomic) IBOutlet UITextField *repeticoesTextField;
@property (weak, nonatomic) IBOutlet UITextField *sequenciasTextField;

@property (weak, nonatomic) IBOutlet UIButton *btnSalvar;

@property (nonatomic) NSInteger peso;
@property (nonatomic) NSInteger repeticoes;
@property (nonatomic) NSInteger sequencias;

@end

@implementation EditarExercicioViewController

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
    
    self.pesoTextField.text = [NSString stringWithFormat:@"%@", self.exercicio.peso];
    self.repeticoesTextField.text = [NSString stringWithFormat:@"%@", self.exercicio.repeticoes];
    self.sequenciasTextField.text = [NSString stringWithFormat:@"%@", self.exercicio.sequencias];
    self.nomeExercicioLabel.text = self.exercicio.detalhesDoExercicio.nome;
    
    self.peso = [self.exercicio.peso integerValue];
    self.repeticoes = [self.exercicio.repeticoes integerValue];
    self.sequencias = [self.exercicio.sequencias integerValue];
    
    self.pesoTextField.delegate =self;
    self.repeticoesTextField.delegate = self;
    self.sequenciasTextField.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.pesoTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editPeso:(UITextField *)sender {
    self.peso = [sender.text integerValue];
}

- (IBAction)editRepeticoes:(UITextField *)sender {
    self.repeticoes = [sender.text integerValue];
}

- (IBAction)editSequencias:(UITextField *)sender {
    self.sequencias = [sender.text integerValue];
}

- (IBAction)salvaExercicio:(UIButton *)sender {
    [self.exercicio editExercicioPeso:self.peso editRepeticoes:self.repeticoes editSequencias:self.sequencias];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
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
    if(textField == self.pesoTextField)
    {
        [self.repeticoesTextField becomeFirstResponder];
    }
    else if(textField == self.repeticoesTextField)
    {
        [self.sequenciasTextField becomeFirstResponder];
    }
    else if(textField == self.sequenciasTextField)
    {
        [self.btnSalvar sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //ativar evento ao pressionar return/done
    [textField resignFirstResponder];
    return YES;
}
@end
