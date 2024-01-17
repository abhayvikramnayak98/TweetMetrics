-- Opening the database.
USE twitterdb;

-- 1. Retrieve the total number of tweets in the dataset.
SELECT count(*) AS total_tweets FROM tweets;

-- 2. Find the number of distinct users (UserID) in the dataset.
SELECT count(DISTINCT UserID) AS total_distinct_users FROM tweets;

-- 3. Calculate the average number of likes per tweet.
SELECT ROUND(AVG(Likes), 3) as average_likes FROM tweets;

-- 4. Identify tweets where the sentiment is 'Positive.' Display the TweetID and sentiment.
SELECT TweetID, Sentiment FROM tweets WHERE Sentiment > 0 ORDER BY Sentiment LIMIT 20;

-- 5. Count the number of tweets where IsReshare is true (1).
SELECT count(*) AS total_reshared_tweets FROM tweets where IsReshare = 1;

-- 6. List the top 5 users with the highest Reach. Display their UserID and Reach.
SELECT UserID, Reach FROM tweets ORDER BY Reach DESC LIMIT 5;

-- 7. Find the most common language (Lang) used in tweets.
SELECT Lang as CommonLanguage FROM tweets GROUP BY Lang ORDER BY COUNT(*) DESC LIMIT 1;

-- 8. Determine the average Klout score for male (Gender = 'Male') users.
SELECT ROUND(AVG(Klout), 3) AS MaleKloutScore FROM tweets WHERE Gender = 'Male';

-- 9. Retrieve tweets posted on weekdays (Monday to Friday).
SELECT * FROM tweets WHERE Weekday IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') LIMIT 10;

-- 10. Identify tweets with a Klout score greater than 50. Display the TweetID and Klout.
SELECT TweetID, Klout FROM tweets WHERE Klout > 50 ORDER BY Klout ASC LIMIT 10;

-- 11. Count the number of tweets posted from the United States (Country = 'United States').
SELECT COUNT(*) as tweetsFromUS FROM tweets WHERE Country = 'United States';

-- 12. List tweets with the highest number of retweets. Display the TweetID and RetweetCount.
SELECT TweetID, RetweetCount FROM tweets WHERE RetweetCount = (SELECT MAX(RetweetCount) FROM tweets);

-- 13. Find tweets with sentiment 'Negative' and Klout score less than 40.
SELECT * FROM tweets WHERE sentiment < 0 AND Klout < 40 ORDER BY Sentiment, Klout DESC LIMIT 10;

-- 14. Calculate the average Likes for tweets posted on weekends (Saturday and Sunday).
SELECT ROUND(AVG(Likes), 3) AS WeekendTweetAvg FROM tweets WHERE Weekday IN ('Saturday','Sunday');

-- 15. Retrieve tweets posted in the city of 'New York.'
SELECT * FROM tweets WHERE City LIKE '%New York%' LIMIT 10;

-- 16. Identify tweets where Reach is greater than 1000. Display the TweetID and Reach.
SELECT TweetID, Reach FROM tweets WHERE Reach > 1000 ORDER BY TweetID, Reach ASC LIMIT 10;

-- 17. Find the user (UserID) with the highest total engagement (sum of RetweetCount and Likes).
SELECT UserID, (RetweetCount + Likes) as TotalEngagement FROM tweets WHERE (RetweetCount + Likes) = (SELECT MAX(RetweetCount + Likes) FROM tweets);

-- 18. List tweets with sentiment 'Neutral' and Lang as 'English.'
SELECT * FROM tweets WHERE Sentiment = 0 AND Lang = 'en' LIMIT 10;

-- 19. Calculate the total engagement (sum of RetweetCount and Likes) for each tweet.
SELECT UserID, (RetweetCount + Likes) as TotalEngagement FROM tweets GROUP BY UserID ORDER BY TotalEngagement DESC LIMIT 10;

-- 20. Retrieve tweets with sentiment 'Positive' or 'Neutral' and Lang as 'English' or 'Spanish.'
SELECT * FROM tweets WHERE Sentiment >= 0 AND Lang IN ('en', 'es') LIMIT 10;