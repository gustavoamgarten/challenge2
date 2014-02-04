//
//  AddBirthdayViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/3/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AddBirthdayViewController.h"
#import "DataStorage.h"

@interface AddBirthdayViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation AddBirthdayViewController

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
    
    NSDate *currentDate = [NSDate date];
    [self.datePicker setMaximumDate:currentDate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doCadastro:(UIButton *)sender {
    self.sexo = self.sexo + 1;
    NSLog(@"Nome: %@", self.nome);
    NSLog(@"Sexo: %d", self.sexo);
    
    self.dataDeNascimento = self.datePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSLog(@"Nascimento: %@", [formatter stringFromDate:self.dataDeNascimento]);
    
    if (self.sexo == 1) {
        [[DataStorage sharedRepository] addHomem:self.nome comDataDeNascimento:self.dataDeNascimento];
    } else {
        [[DataStorage sharedRepository] addMulher:self.nome comDataDeNascimento:self.dataDeNascimento];
    }
    
    [self performSegueWithIdentifier:@"criouPessoa" sender:self];
    
}

@end
