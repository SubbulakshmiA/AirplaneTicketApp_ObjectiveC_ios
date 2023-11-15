//
//  ShowTicketsTableViewViewController.m
//  AirplaneTicketApp
//
//  Created by user243757 on 10/2/23.
//

#import "ShowTicketsTableViewViewController.h"

@interface ShowTicketsTableViewViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;


@end

@implementation ShowTicketsTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;

//    self.myTableView.allowsEditing = YES;
    
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"count %lu",self.showTicketBookingObj.bookingList.count);
    
    return self.showTicketBookingObj.bookingList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    myCell.textLabel.text = [self.showTicketBookingObj accessBookedTicketType:(int)indexPath.row];
    myCell.detailTextLabel.text = [NSString stringWithFormat:@"%d",[self.showTicketBookingObj accessBookedTicketQnt:(int)indexPath.row]];
    
    return myCell;
}
- (IBAction)doneBtn:(id)sender {
    //    UIAlertController *alert = [[UIAlertController alloc] initWithTitle:@"Wait" message:@"Are you sure you want to delete this.  This action cannot be undone" delegate:self cancelButtonTitle:@"Delete" otherButtonTitles:@"Cancel", nil];
    //    [alert show];
//
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Thank You"
//                                   message:@"TEnjoy Your Trip."
//                                   preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//       handler:^(UIAlertAction * action) {}];
//
//    [alert addAction:defaultAction];
//    [self presentViewController:alert animated:YES completion:nil];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Thank You"
                                                                                message:@"Enjoy Your Trip"
                                                                         preferredStyle:UIAlertControllerStyleAlert];
       
//       UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
//
       UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler://nil
                                      
                                      ^(UIAlertAction *action) {
                      [self dismissViewControllerAnimated:YES completion:nil];
           // Perform the navigation to the previous scene here
           [self.myTableView reloadInputViews];

           //           [self.navigationController popViewControllerAnimated:YES];
       }];
    
       
//       [alertController addAction:cancelAction];
       [alertController addAction:okAction];
       
       [self presentViewController:alertController animated:YES completion:nil];
   
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self.showTicketBookingObj removingItemsFromBookingList:(int) indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
