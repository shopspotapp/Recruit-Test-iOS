
/*================================================================*/

@protocol JSONInitializer

- (nullable instancetype)initWithJSON:(nonnull NSDictionary *)JSON;

@end

typedef NS_ENUM(NSUInteger, SocialType)
{
    SocialTypeGitHub,
    SocialTypeStackOverflow,
    SocialTypeBlog,
    SocialTypeLinkedIn
};

@protocol SocialProtocol <JSONInitializer>

@property (assign, nonatomic, readonly) SocialType socialType;
@property (strong, nonatomic, readonly, nonnull) NSURL *profileUrl;
@property (strong, nonatomic, readonly, nonnull) NSString *username;

@end

@interface Repository : NSObject <SocialProtocol>

@property (strong, nonatomic, readonly, nonnull) NSString *name;
@property (strong, nonatomic, readonly, nonnull) NSURL *url;

@end

@interface GitHub : NSObject <SocialProtocol>

@property (strong, nonatomic, readonly, nullable) NSArray<Repository *> *repositories;

@end

@interface StackOverflow : NSObject <SocialProtocol>

@property (assign, nonatomic, readonly) NSInteger reputation;

@end

@interface Address : NSObject <JSONInitializer>

@property (strong, nonatomic, readonly, nonnull) NSString *houseNo;
@property (strong, nonatomic, readonly, nonnull) NSString *district;
@property (strong, nonatomic, readonly, nonnull) NSString *subdistrict;
@property (strong, nonatomic, readonly, nonnull) NSString *city;
@property (strong, nonatomic, readonly, nonnull) NSString *postalCode;
@property (strong, nonatomic, readonly, nonnull) NSString *country;

@end

typedef NS_ENUM(NSUInteger, Gender)
{
    GenderFemale,
    GenderMale
};

@interface Applicant : NSObject <JSONInitializer>

@property (strong, nonatomic, readonly, nonnull) NSString *firstname;
@property (strong, nonatomic, readonly, nonnull) NSString *lastname;
@property (strong, nonatomic, readonly, nonnull) NSString *email;
@property (strong, nonatomic, readonly, nonnull) Address *address;
@property (assign, nonatomic, readonly) Gender gender;
@property (strong, nonatomic, readonly, nullable) NSArray<id<SocialProtocol>> *socials;

@end

/*================================================================*/

NSDictionary *yourAddress = @{ @"houseNo": <#houseNo#>,
                               @"district": <#district#>,
                               @"subdistrict": <#subdistrict#>,
                               @"city": <#city#>,
                               @"postalCode": <#postalCode#>,
                               @"country": <#country#> };
NSArray *yourGitHubRepositories = @[ @{ @"name": <#name#>,
                                        @"url": <#url#> },
                                     @{ @"name": <#name#>,
                                        @"url": <#url#> } ];
NSDictionary *yourGitHubAccount = @{ @"socialType": @"GitHub",
                                     @"profileUrl": <#profileUrl#>,
                                     @"username": <#username#>,
                                     @"repositories": yourGitHubRepositories };
NSDictionary *yourStackOverflowAccount = @{ @"socialType": @"StackOverflow",
                                            @"profileUrl": <#profileUrl#>,
                                            @"username": <#username#>,
                                            @"reputation": <#reputation#> };
NSDictionary *json = @{ @"firstname": <#firstname#>,
                        @"lastname": <#lastname#>,
                        @"email": <#email#>,
                        @"address": yourAddress,
                        @"gender": <#gender#>,
                        @"socials": @[ yourGitHubAccount,
                                       yourStackOverflowAccount] };
Applicant *applicant = [[Applicant alloc] initWithJSON:json];

/*================================================================*/
