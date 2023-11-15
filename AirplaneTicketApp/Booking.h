//
//  Booking.h
//  AirplaneTicketApp
//
//  Created by user243757 on 10/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Booking : NSObject
@property (nonatomic) NSMutableArray *ticketList;
@property(nonatomic)NSMutableArray *bookingList;

-(NSString *)titleForTheSelectedRow :(int)row ;
-(void)addingItemsToBookingList :(int)rowSelected withQuantity:(int)quantity;
-(void)removingItemsFromBookingList :(int)rowSelected;
-(NSString*)itemsInBookingList :(int)row;
-(NSString *)accessBookedTicketType :(int)rowSelected;
-(int)accessBookedTicketQnt :(int)rowSelected;

@end

NS_ASSUME_NONNULL_END
