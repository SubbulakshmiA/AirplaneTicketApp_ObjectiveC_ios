//
//  ViewController.m
//  AirplaneTicketApp
//
//  Created by user243757 on 10/2/23.
//

#import "ViewController.h"
#import "Booking.h"
#import "ShowTicketsTableViewViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *qntDisplay;
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property (weak, nonatomic) IBOutlet UITextView *addedToTicketList;
@property (nonatomic) Booking *bookingObj;
@property (nonatomic) int rowSelected;
@property(nonatomic)bool isNewEntry ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myPickerView.delegate = self;
    self.myPickerView.dataSource = self;
    // Do any additional setup after loading the view.
}
-(Booking*)bookingObj{
    if(_bookingObj == nil){
        _bookingObj = [[Booking alloc]init];
    }
    return _bookingObj;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.qntDisplay.text = @"";
    self.addedToTicketList.text = @"";
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.bookingObj.ticketList.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.bookingObj titleForTheSelectedRow:(int)row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.rowSelected = (int)row;
  
}

- (IBAction)addTicketBtn:(id)sender {
    
    [self.bookingObj addingItemsToBookingList:(self.rowSelected) withQuantity:([self.qntDisplay.text intValue])];
    NSString *textViewText = [[self.bookingObj itemsInBookingList:(self.rowSelected)] mutableCopy];
       self.addedToTicketList.text = [self.addedToTicketList.text stringByAppendingFormat:@"%@\n",textViewText];
   }
- (IBAction)checkoutBtn:(id)sender {
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    ManagerPanelViewController *mpVc = (ManagerPanelViewController*) segue.destinationViewController;
//    mpVc.managerStoreObj = self.storeObj;
    ShowTicketsTableViewViewController *stvc = (ShowTicketsTableViewViewController*)segue.destinationViewController;
    stvc.showTicketBookingObj = self.bookingObj;
    
    
}


@end
