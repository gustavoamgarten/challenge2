//
//  AddNameViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/3/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AddNameViewController.h"

@interface AddNameViewController ()

@end

@implementation AddNameViewController

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
    //[self performSegueWithIdentifier:@"addSex" sender:self];
}
- (IBAction)goToAddSex:(UIButton *)sender {
    [self performSegueWithIdentifier:@"addSex" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
