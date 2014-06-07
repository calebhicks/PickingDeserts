//
//  PDViewController.m
//  PickingDesserts
//
//  Created by Caleb Hicks on 6/7/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PDViewController.h"

@interface PDViewController ()

@property UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *selectionLabel;

@end

@implementation PDViewController

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

    self.pickerView = [[UIPickerView alloc]initWithFrame:self.view.bounds];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    [self.view addSubview:self.pickerView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.data[component][row];
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [self.data[component]count];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return [[self data]count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    [self updateLabel];
    
}

- (void)updateLabel{
    self.selectionLabel.text = [NSString stringWithFormat:@"%@ %@ %@", [self data][0][[self.pickerView selectedRowInComponent:0]], [self data][1][[self.pickerView selectedRowInComponent:1]], [self data][2][[self.pickerView selectedRowInComponent:2]]];
}

- (NSArray *)data {
    
    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
    
}

- (NSArray *)fruits {
    
    return @[@"banana",
             @"orange",
             @"apple",
             @"strawberry"];
}

- (NSArray *)liquids {
    return @[@"milk",
             @"soda",
             @"coffee"];
}

- (NSArray *)desserts {
    return @[@"shake",
             @"sundae",
             @"cookie"];
}

@end
