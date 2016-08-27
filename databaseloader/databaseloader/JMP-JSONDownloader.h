//
//  JMP-JSONDownloader.h
//  databaseloader
//
//  Created by John Peden on 8/26/16.
//  Copyright © 2016 jmp9c. All rights reserved.
//

#ifndef JMP_JSONDownloader_h
#define JMP_JSONDownloader_h

@interface JSONDownloader : NSObject
- (NSData)getJSONData(NSString *)url;
@end


#endif /* JMP_JSONDownloader_h */
