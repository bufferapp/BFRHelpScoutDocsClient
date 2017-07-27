//
//  BFRHelpScoutDocsClient.h
//  Buffer
//
//  Created by Andrew Yates on 08/09/2016.
//
//

#import <Foundation/Foundation.h>

@interface BFRHelpScoutDocsClient : AFHTTPSessionManager

+ (BFRHelpScoutDocsClient *)sharedClient;

@property (readonly) NSString *accessToken;

// Instance-based access token setter
- (void)setAccessToken:(NSString *)accessToken;



- (void)getCollectionsWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

- (void)getCollectionWithID:(NSString *)collectionID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

- (void)getCategoriesWithCollectionID:(NSString *)collectionID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

- (void)getCategoryWithID:(NSString *)categoryID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

- (void)getArticlesWithinCollection:(NSString *)collectionID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

- (void)getArticlesWithinCategory:(NSString *)categoryID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

- (void)getSearchResultsWithQuery:(NSString *)query collectionID:(NSString *)collectionID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

- (void)getArticleWithID:(NSString *)articleID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

- (void)increaseViewCountForArticleWithID:(NSString *)articleID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
