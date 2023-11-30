//
//  ViewController.h
//  resolutionsetter
//
//  Created by apple on 2022/10/7.
//

#import <UIKit/UIKit.h>

void *_CTServerConnectionCreate(CFAllocatorRef, void *, void *);
int64_t _CTServerConnectionSetCellularUsagePolicy(CFTypeRef *ct, NSString *identifier, NSDictionary *policies);

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *Settings;
@property (weak, nonatomic) IBOutlet UITextField *Bundles;
@property (weak, nonatomic) IBOutlet UIButton *Set;
@property (weak, nonatomic) IBOutlet UILabel *Status;


@end
