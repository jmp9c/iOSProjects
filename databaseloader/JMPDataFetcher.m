//
//  JMPDataFetcher.m
//  databaseloader
//
//  Created by John Peden on 8/26/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

#import "JMPDataFetcher.h"




@implementation JMPDataFetcher

-(NSMutableArray *)fetchJSON:(NSString *)url {
  NSError *error;
  NSString *url_string = [NSString stringWithFormat: @"%@", url];
  NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
  NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
  
  return json;
}



@end
