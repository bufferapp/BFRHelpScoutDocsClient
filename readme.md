# BFRHelpScoutDocsClient

### Summary
BFRHelpScoutDocsClient is a basic wrapper around the HelpScout Docs API. It requires AFNetworking as a dependency. 

Use it to pull a list of articles from HelpScout Docs, before showing the selected article to a user.

We'll be putting together a demo project to help you hook up to your HelpScout Docs shortly.

We use it in [Buffer for iOS](https://itunes.apple.com/us/app/buffer-for-twitter-pinterest/id490474324?mt=8) :-).

### Installation
Cocoapod Coming Soon.


### Quickstart
To get up and running quickly with BFRHelpScoutDocsClient, configure it using your access token!
```objc
[[BFRHelpScoutDocsClient sharedClient] setAccessToken:@"YOURKEYHERE"];
```

### Fetch Categories
```objc
[[BFRHelpScoutDocsClient sharedClient] getCategoriesWithCollectionID:@"COLLECTIONID" success:^(id responseObject) {
    // Handle Response
} failure:^(NSError *error) {
    // Handle Error
}];
```

### Fetch Articles
```objc
[[BFRHelpScoutDocsClient sharedClient] getArticlesWithinCategory:@"CATEGORYID" success:^(id responseObject) {
    // Handle Response
} failure:^(NSError *error) {
    // Handle Error
}];
```

### Fetch Article ID
```objc
[[BFRHelpScoutDocsClient sharedClient] getArticleWithID:@"ARTICLEID" success:^(id responseObject) {
    // Handle Response
} failure:^(NSError *error) {
    // Handle Error
}];
```

### Increase View Count
```objc
[[BFRHelpScoutDocsClient sharedClient] increaseViewCountForArticleWithID:@"ARTICLEID" success:^(id responseObject) {
    // Handle Response
} failure:^(NSError *error) {
    // Handle Error
}];
```

### Going Forward
We regularly maintain this code, and you can also rest assured that it's been battle tested against thousands of users in production 👍. That said, we get things wrong from time to time - so feel free to open an issue for anything you spot!

We are always happy to talk shop, so feel free to give us a shout on Twitter:

+ Andy - [@ay8s](http://www.twitter.com/ay8s)
+ Jordan - [@jordanmorgan10](http://www.twitter.com/jordanmorgan10)

Or, hey - why not work on the BFRHelpScoutDocsClient and get paid for it!? [We're hiring](http://www.buffer.com/journey)!

- - -
#### Licence
_This project uses MIT License._
