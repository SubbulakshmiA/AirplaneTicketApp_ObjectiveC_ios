//
//  Booking.m
//  AirplaneTicketApp
//
//  Created by user243757 on 10/2/23.
//

#import "Booking.h"
#import "Ticket.h"
#import "PurchasedTickets.h"

@implementation Booking

-(NSMutableArray*)ticketList{
    if(_ticketList == nil){
        _ticketList= [[NSMutableArray alloc]initWithObjects:
                     [[Ticket alloc]initWithItems:@"VIP"  andQnt:0],
                     [[Ticket alloc]initWithItems:@"Business " andQnt:0],
                     [[Ticket alloc]initWithItems:@"Economy Adult " andQnt:0],
                     [[Ticket alloc]initWithItems:@"Economy Kid " andQnt:0],
                     [[Ticket alloc]initWithItems:@"Infant " andQnt:0],nil];
    }
    return _ticketList;
}
-(NSMutableArray*)bookingList{
    if(_bookingList == nil){
        _bookingList = [[NSMutableArray alloc]init];
    }
    return _bookingList;
}


-(NSString *)titleForTheSelectedRow :(int)row {
    Ticket *ticketObj = [self.ticketList objectAtIndex:row];
     return [NSString stringWithFormat:@"%@",ticketObj.ticketType];
}

-(void)addingItemsToBookingList :(int)rowSelected withQuantity:(int)quantity{
    PurchasedTickets *purchasedTicketObj = [self.ticketList objectAtIndex:rowSelected];
    purchasedTicketObj.qnt = quantity;
    [self.bookingList addObject:purchasedTicketObj];
}
-(NSString*)itemsInBookingList :(int)row{
    Ticket *ticketObj = [self.ticketList objectAtIndex:row];
     return [NSString stringWithFormat:@"%@ quantity is %d",ticketObj.ticketType ,ticketObj.qnt];
}
-(NSString *)accessBookedTicketType :(int)rowSelected{    
    PurchasedTickets *purchasedTicketObj = [self.bookingList objectAtIndex:rowSelected];
    return purchasedTicketObj.ticketType;
    
}
-(int)accessBookedTicketQnt :(int)rowSelected{
    PurchasedTickets *purchasedTicketObj = [self.bookingList objectAtIndex:rowSelected];
 //   NSLog(@"qnt %d",ticketObj.qnt);
    return purchasedTicketObj.qnt;
}
-(void)removingItemsFromBookingList :(int)rowSelected {
    PurchasedTickets *purchasedTicketObj = [self.ticketList objectAtIndex:rowSelected];
 //   ticketObj.qnt = quantity;
    [self.bookingList removeObject:purchasedTicketObj];
}

@end
