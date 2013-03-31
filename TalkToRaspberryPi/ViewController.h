//
//  ViewController.h
//  TalkToRaspberryPi
//
//  Created by Alex on 3/30/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

    IBOutlet UISlider *ledSlider;
}
-(IBAction)changeFrequnce:(id)sender ;
@end
