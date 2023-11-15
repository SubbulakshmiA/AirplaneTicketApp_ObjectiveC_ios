//
//  Ticket.h
//  AirplaneTicketApp
//
//  Created by user243757 on 10/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ticket : NSObject
@property (nonatomic) NSString *ticketType;
@property(nonatomic) int qnt;

- (instancetype)initWithItems:(NSString *)ticketType andQnt:(int)qnt;

@end

NS_ASSUME_NONNULL_END
