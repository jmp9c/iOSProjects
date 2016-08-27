//
//  VC.m
//  databaseloader
//
//  Created by John Peden on 8/26/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

#import "VC.h"
#import "JMPDataFetcher.h"

@interface VC ()

@end

@implementation VC

- (void)viewDidLoad {
  [super viewDidLoad];
  
  JMPDataFetcher *dataFetcher = [[JMPDataFetcher alloc] init];
  NSMutableArray *json = [[NSMutableArray alloc] init];
  
  [dataFetcher updateDatabaseWithKisses:100 withHugs:100 withListens:100 withDinners:100];
  json = [dataFetcher fetchJSON:@"http://www.johnmahlonpeden.com/service.php"];
  
  

  _kisses.text = [NSString stringWithFormat:@"Kisses: %@", json[0][@"kisses"]];
  _hugs.text = [NSString stringWithFormat:@"Hugs: %@", json[0][@"hugs"]];
  _listens.text = [NSString stringWithFormat:@"Listens: %@", json[0][@"listens"]];
  _dinners.text = [NSString stringWithFormat:@"Dinners: %@", json[0][@"dinners"]];
  
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)update:(id)sender {
  [self viewDidLoad];
}
@end
