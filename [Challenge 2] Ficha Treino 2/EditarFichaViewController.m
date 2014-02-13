//
//  EditarFichaViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/7/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "EditarFichaViewController.h"
#import "KeyboardAnimation.h"

@interface EditarFichaViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *frequenciaTextField;
@property (weak, nonatomic) IBOutlet UITextField *intervaloTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *objetivoSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *periodoTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *periodoSegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *btnEditar;

@property (nonatomic) NSInteger frequencia;
@property (nonatomic) NSInteger intervalo;
@property (nonatomic) NSInteger objetivo;
@property (nonatomic) NSInteger periodoQuantidade;
@property (nonatomic) NSInteger periodoTipo;


@end

@implementation EditarFichaViewController

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
    
    self.frequenciaTextField.text = [NSString stringWithFormat:@"%@", self.ficha.frequencia];
    self.intervaloTextField.text = [NSString stringWithFormat:@"%@", self.ficha.intervalo];
    self.objetivoSegmentedControl.selectedSegmentIndex = [self.ficha.objetivo integerValue];
    self.periodoTextField.text = [NSString stringWithFormat:@"%@", self.ficha.periodoQuantidade];
    self.periodoSegmentedControl.selectedSegmentIndex = [self.ficha.periodoTipo integerValue];
    
    self.frequencia = [self.ficha.frequencia integerValue];
    self.intervalo = [self.ficha.intervalo integerValue];
    self.objetivo = [self.ficha.objetivo integerValue];
    self.periodoQuantidade = [self.ficha.periodoQuantidade integerValue];
    self.periodoTipo = [self.ficha.periodoTipo integerValue];
    
    self.frequenciaTextField.delegate = self;
    self.intervaloTextField.delegate = self;
    self.periodoTextField.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
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

- (IBAction)editFrequencia:(UITextField *)sender {
    self.frequencia = [sender.text integerValue];
}

- (IBAction)editIntervalo:(UITextField *)sender {
    self.intervalo = [sender.text integerValue];
}

- (IBAction)editObjetivo:(UISegmentedControl *)sender {
    self.objetivo = sender.selectedSegmentIndex;
}

- (IBAction)editPeriodoQuantidade:(UITextField *)sender {
    self.periodoQuantidade = [sender.text integerValue];
}

- (IBAction)editPeriodoTipo:(UISegmentedControl *)sender {
    self.periodoTipo = sender.selectedSegmentIndex;
}

- (IBAction)editFicha:(UIButton *)sender {
    [self.ficha editFichaFrequencia:self.frequencia editIntervalo:self.intervalo editObjetivo:self.objetivo editPeriodoQuantidade:self.periodoQuantidade editPeriodoTipo:self.periodoTipo];
    
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
        //[self.frequenciaTextField becomeFirstResponder];
        [self.btnEditar sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //ativar evento ao pressionar return/done
    [textField resignFirstResponder];
    return YES;
}
@end
