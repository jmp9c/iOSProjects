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
- (void)updateDatabaseWithKisses:(int)k withHugs: (int)h withListens: (int)l withDinners: (int)d;




@end
