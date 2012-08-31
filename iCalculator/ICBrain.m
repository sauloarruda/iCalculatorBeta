//
//  ICBrain.m
//  iCalculator
//
//  Created by Saulo Arruda on 8/30/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "ICBrain.h"

@interface ICBrain () {
    NSMutableArray* _stack;
}

@property (nonatomic, strong, readonly) NSMutableArray* stack;

@end

@implementation ICBrain

- (NSMutableArray*)stack
{
    if (!_stack) _stack = [[NSMutableArray alloc] init];
    return _stack;
}

- (void)pushOperand:(double)operand
{
    [self.stack addObject:[NSNumber numberWithDouble:operand]];
    NSLog(@"stack=%@", self.stack);
}

- (NSNumber*)popOperand
{
    NSNumber* operand = [self.stack lastObject];
    [self.stack removeLastObject];
    return operand;
}

- (NSNumber*)executeOperation:(NSString *)operation
{
    NSNumber* operand = [self popOperand];
    double result = [operand doubleValue] + [[self popOperand] doubleValue];
    [self pushOperand:result];
    return [NSNumber numberWithDouble:result];
}

@end
