//
//  ViewController.m
//  TalkToRaspberryPi
//
//  Created by Alex on 3/30/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#define IPADDRESS @"http://192.168.1.117:8000"

@interface ViewController (){

    ASIFormDataRequest *requestToRap;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}



- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSString *responseString = [request responseString];
    NSLog(@"Json数据返回%@",responseString);
    // Use when fetching binary data
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    //NSError *error = [request error];
}





- (void)jsonRequestFininshed:(ASIFormDataRequest *)theRequest
{
    NSLog(@"Json数据返回%@",[theRequest responseString]);
    
}

- (void)jsonRequestFailed:(ASIFormDataRequest *)theRequest
{
    // Obviously you should handle the error properly...
    NSLog(@"%@",[theRequest error]);
}


-(void)sendRequestToRaspberry:(NSString*)toRaspBerryString{

    requestToRap = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:toRaspBerryString]];
    [requestToRap setRequestMethod:@"POST"];
    [requestToRap startAsynchronous];
    [requestToRap setDelegate:self];
    [requestToRap setDidFailSelector:@selector(jsonRequestFailed:)];
    [requestToRap setDidFinishSelector:@selector(jsonRequestFininshed:)];

    
}


-(IBAction)openLED:(id)sender{
    
    NSString *url = [NSString stringWithFormat:@"%@/GPIO/23/value/0",IPADDRESS];
    [self sendRequestToRaspberry:url];


}

-(IBAction)closeLED:(id)sender{
    
    NSString *url = [NSString stringWithFormat:@"%@/GPIO/23/value/1",IPADDRESS];
    [self sendRequestToRaspberry:url];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(IBAction)changeFrequnce:(id)sender{

    NSLog(@"Value...%f",ledSlider.value);
    
    NSString *url = [NSString stringWithFormat:@"%@/GPIO/21/pulseRatio/%f",IPADDRESS,ledSlider.value];
    [self sendRequestToRaspberry:url];

    
    
}



-(IBAction)init23Pin:(id)sender{

    
    NSString *url = [NSString stringWithFormat:@"%@/GPIO/23/function/out",IPADDRESS];
    [self sendRequestToRaspberry:url];
    

}

-(IBAction)init21Pin:(id)sender{
    
    
    
    NSString *url = [NSString stringWithFormat:@"%@/GPIO/21/function/pwm",IPADDRESS];
    [self sendRequestToRaspberry:url];

}



@end