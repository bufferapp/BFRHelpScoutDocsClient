//
//  BFRHelpScoutDocsClient.m
//  Buffer
//
//  Created by Andrew Yates on 08/09/2016.
//
//

#import "BFRHelpScoutDocsClient.h"

@implementation BFRHelpScoutDocsClient

@synthesize accessToken = _accessToken;

+ (BFRHelpScoutDocsClient *)sharedClient {
    static BFRHelpScoutDocsClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[[self class] APIBaseURL]];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
    });
    
    return _sharedClient;
}

+ (NSURL *)APIBaseURL {
    return [NSURL URLWithString:@"https://docsapi.helpscout.net/v1/"];
}

- (void)setAccessToken:(NSString *)accessToken {
    if(accessToken == nil || [accessToken length] == 0) {
        [NSException raise:@"BFRHelpScoutDocsClientInvalidAccessToken" format:@"You have provided an invalid Help Scout access token."];
    }
    
    // Logs and updates the access token.
    NSLog(@"[BFRHelpScoutDocsClient] Access token set: %@", _accessToken = accessToken);
    
    [[BFRHelpScoutDocsClient sharedClient].requestSerializer setAuthorizationHeaderFieldWithUsername:accessToken password:@"x"];
}

#pragma mark - Collections

- (void)getCollectionsWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = @"collections";
    
    [self GET:path parameters:@{@"visibility":@"public"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getCollectionWithID:(NSString *)collectionID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"collections/%@", collectionID];
    
    [self GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

#pragma mark - Categories

- (void)getCategoriesWithCollectionID:(NSString *)collectionID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"collections/%@/categories", collectionID];
    
    [self GET:path parameters:@{@"visibility":@"public"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getCategoryWithID:(NSString *)categoryID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"categories/%@", categoryID];
    
    [self GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

#pragma mark - Articles

- (void)getArticlesWithinCollection:(NSString *)collectionID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"collections/%@/articles", collectionID];
    
    [self GET:path parameters:@{@"visibility":@"public"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getArticlesWithinCategory:(NSString *)categoryID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"categories/%@/articles", categoryID];
    
    [self GET:path parameters:@{@"visibility":@"public"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getSearchResultsWithQuery:(NSString *)query collectionID:(NSString *)collectionID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"search/articles"];
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    if(collectionID){
        [params addEntriesFromDictionary:@{@"collectionId":collectionID}];
    }
    
    [params addEntriesFromDictionary:@{@"visibility":@"public"}];
    
    [params addEntriesFromDictionary:@{@"query":query}];
    
    [self GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


- (void)getArticleWithID:(NSString *)articleID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"articles/%@", articleID];
    
    [self GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)increaseViewCountForArticleWithID:(NSString *)articleID success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"articles/%@/views", articleID];
    
    [self GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
