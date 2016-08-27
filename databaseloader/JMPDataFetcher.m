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

- (void)updateDatabaseWithKisses:(int)k withHugs: (int)h withListens: (int)l withDinners: (int)d {
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.johnmahlonpeden.com/update.php"]];
  request.HTTPMethod = @"POST";
  NSString *postString = [NSString stringWithFormat:@"kisses=%d&hugs=%d&listens=%d&dinners=%d",   k, h, l, d];
  request.HTTPBody = [postString dataUsingEncoding:NSUTF8StringEncoding];
  
  NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request];
  [task resume];

}



//@IBAction func buttonPress(sender: AnyObject) {
//  
//  let request = NSMutableURLRequest(URL: NSURL(string: "http://www.kandidlabs.com/YouTube/SwiftToMySQL/insert.php")!)
//  request.HTTPMethod = "POST"
//  let postString = "a=\(usernametext.text!)&b=\(password.text!)&c=\(info.text!)&d=\(number.text!)"
//  request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
//  
//  let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//    data, response, error in
//    
//    if error != nil {
//      print("error=\(error)")
//      return
//    }
//    
//    print("response = \(response)")
//    
//    let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//    print("responseString = \(responseString)")
//  }
//  task.resume()
//}



@end
