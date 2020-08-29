DISTRIBUTED-OPERATING-SYSTEM-Twitter-Simulator:
The goal of this project is to implement a Twitter-like engine and a client tester/simulator. The client part (send/receive tweets) and the engine (distribute tweets) were simulated in separate OS processes.

Technologies used: Elixir, Erlang, Atom

Team Members:
(1) Himanshu Gupta (UFID: 6699-9903)
(2) Anushri Jain (UFID: 8764-6425)

I. Functionalities Implemented:
 Log-in/out
 Create/Delete a account
 Tweets/Re-tweets
 Subscribe/Unsubscribe to an account
 Search by hashtags/mention
 Live push to the connected users
 Additionally, we can also export the social graph of whole network to a .txt file which can be visualized via graphviz or social network visualize.

II. System Architecture:
We have the following modules in the system.
 Server: This is the server part of our system. It exposes the methods for writing tweets, registering account, search, login, logout etc. The client only interacts with server.
 Fire Bird: This exposes the logic for pushing the tweets to live users. Fire Bird also update the timeline of the users.
 Snow Bird: This is used for indexing the tweets( by hashtags and mentions). This also helps in searching by hashtags and mentions.
 Hydrator: This takes a tweet ID and outputs the tweet presentable to the client. Basically, it adds the data and meta data to tweet id.
 Timeline Manager: For every user whether they are online or offline, we maintain a timeline, so that when they login after a period of inactivity, we give them the latest version of the timeline. It consists of various functions to maintain the timeline.
 Social Graph: This maintains the list of the user’s followers and the followers whom the user is itself following.
 Accounts: It maintains the details of the account.

When the client writes a tweet or re-tweet, following happens:
 Client calls server with his username and the tweet data.
 The Server will call the Fire Bird module to process the tweet
 Fire Bird Module will perform the following function:
 It will generate a unique id for tweet and save the tweet in ets table.
 Fire Bird will invoke the Snow Bird module which will search the tweet for hashtags and mentions and index them
 Then, Fire Bird will update the timeline of the users which is stored in ets table.
 Then, the tweet will be pushed to the connected(online) users.
III. Unit Test Cases:
We have written 18 test cases in total covering all the functionalities. You can run the test by running the following command:
mix test

IV. Steps for running the project:
Run the following command in sequence:
 mix deps.get
 mix compile
 mix run project4.exs <num_clients> <num_tweets>

V. Bonus Implementation: 
We did following changes for bonus part:
 We disconnected users for a random time for 100 to 200 msec. Note that user is offline for longer time than he is online in our simulation.
 To simulate zipf distribution we increased the number of followers of certain accounts to be higher (according to zipf distribution s = 1, c = 2*n). 
 We also increased number of tweets/retweets for accounts with large number of subscribers.

How to run: 
Run the following commands in Sequence
 mix deps.get
 mix compile
 mix run project4.exs <num_user> <num_tweets>

To see that our social graph follows zipf distribution(on number of subscriber) we have attached visulaization of graph with 100 nodes. We have attached both radial layout and level wise layout. In radial layout, nodes at center have large size and large number of followers. As we move from centre, the number of followers decrease and node size decrease as well [Attached Project 4.1 Bonus Report]
