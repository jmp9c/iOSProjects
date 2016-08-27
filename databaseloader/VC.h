//
//  VC.h
//  databaseloader
//
//  Created by John Peden on 8/26/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *kisses;
@property (strong, nonatomic) IBOutlet UILabel *hugs;
@property (strong, nonatomic) IBOutlet UILabel *listens;
@property (strong, nonatomic) IBOutlet UILabel *dinners;

- (IBAction)update:(id)sender;

@end
