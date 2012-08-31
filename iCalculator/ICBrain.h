//
//  ICBrain.h
//  iCalculator
//
//  Created by Saulo Arruda on 8/30/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICBrain : NSObject

// Put operand on operand stack
- (void)pushOperand:(double)operand;

// Execute the operation with last 2 operands and returns the result
- (NSNumber*)executeOperation:(NSString*)operation;

@end
