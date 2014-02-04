//
//  AddSexViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/3/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AddSexViewController.h"
#import "AddBirthdayViewController.h"

@interface AddSexViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation AddSexViewController

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
    
    self.sexo = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDataSource

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

#pragma mark - UIPickerViewDelegate
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = [[NSString alloc] init];
    
    if (row == 0) {
        title = [NSString stringWithFormat:@"Masculino"];
    } else if (row == 1) {
        title = [NSString stringWithFormat:@"Feminino"];
    }
    
    return title;
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.sexo = row;
    NSLog(@"Sexo: %d", self.sexo);
}
- (IBAction)goToAddBirthday:(UIButton *)sender {
    [self performSegueWithIdentifier:@"addBirthday" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AddBirthdayViewController *destController = segue.destinationViewController;
    destController.nome = self.nome;
    destController.sexo = self.sexo;
}

@end
