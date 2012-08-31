//
//  ICViewController.m
//  iCalculator
//
//  Created by Saulo Arruda on 8/30/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "ICViewController.h"
#import "ICBrain.h"

@interface ICViewController () {
    BOOL _isTyping;
}

@property (strong, nonatomic) ICBrain* brain;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)numberButtonTapped:(UIButton *)sender;
- (IBAction)operationButtonTapped:(UIButton *)sender;
- (IBAction)enterButtonTapped;
@end

@implementation ICViewController
@synthesize displayLabel;
@synthesize brain = _brain;

- (ICBrain*)brain
{
    if (_brain == nil) _brain = [[ICBrain alloc] init];
    return _brain;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDisplayLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)numberButtonTapped:(UIButton *)button {
    if (_isTyping) {
        if ([self.displayLabel.text length] > 12) return;
        NSNumber* number = [NSNumber numberWithDouble:[[self.displayLabel.text stringByAppendingString:button.currentTitle] doubleValue]];
        self.displayLabel.text = [number stringValue];
    } else {
        [self.displayLabel setHighlighted:NO];
        self.displayLabel.text = button.currentTitle;
        _isTyping = YES;
    }
}
- (IBAction)operationButtonTapped:(UIButton *)button {
    [self enterButtonTapped];
    NSNumber* result = [self.brain executeOperation:button.currentTitle];
    self.displayLabel.text = [result stringValue];
}

- (IBAction)enterButtonTapped {
    [self.displayLabel setHighlighted:YES];
    _isTyping = NO;
    [self.brain pushOperand:[self.displayLabel.text doubleValue]];
}
@end
