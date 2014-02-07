//
//  AddNameViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/3/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AddNameViewController.h"
#import "AddSexViewController.h"
#import "KeyboardAnimation.h"

@interface AddNameViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnProximo;
@property (weak, nonatomic) IBOutlet UITextField *nomeTextField;

@end

@implementation AddNameViewController

#pragma mark - métodos de inicialização
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
    self.nomeTextField.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.nomeTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)addName:(UITextField *)sender {
    self.nome = sender.text;
    NSLog(@"Nome: %@", self.nome);
}
- (IBAction)goToAddSex:(UIButton *)sender {
    [self performSegueWithIdentifier:@"addSex" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AddSexViewController *destController = segue.destinationViewController;
    
    destController.nome = self.nome;
}

#pragma mark - métodos do text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [KeyboardAnimation textFieldDidBeginEditing:textField from:self];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [KeyboardAnimation textFieldDidEndedEditing:textField from:self];
    
    
    //verifica se é o nome e depois de terminar a alteração pressiona o botão próximo
    if(textField == self.nomeTextField)
    {
        self.nome = self.nomeTextField.text;
        [self.btnProximo sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //ativar evento ao pressionar return/done
    [textField resignFirstResponder];
    return YES;
}

@end
