//
//  LoadUserViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/3/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "LoadUserViewController.h"
#import "DataStorage.h"

@interface LoadUserViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation LoadUserViewController

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
    
    DataStorage *repository = [DataStorage sharedRepository];
    [repository reloadData];
    
    NSArray *pessoas = [repository getPessoas];
    
//    NSLog(@"pessoas: %d", [pessoas count]);
    
    if ([pessoas count] > 0) {
        [self performSegueWithIdentifier:@"comFicha" sender:self];
    }
    
    NSDate *currentDate = [NSDate date];
    [self.datePicker setMaximumDate:currentDate];
    CGAffineTransform s0 = CGAffineTransformMakeScale(0.5, 0.5);
    self.datePicker.transform = s0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
