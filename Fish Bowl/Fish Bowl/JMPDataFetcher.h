//
//  JMPDataFetcher.h
//  databaseloader
//
//  Created by John Peden on 8/26/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMPDataFetcher : NSObject
- (NSMutableArray *)fetchJSON:(NSString *)url;
- (void)updateDatabaseWithPhrase:(NSString*)phrase withUser:(NSString*)user withPassword: (NSString *)pw withAction:(NSString*)action;

@end
