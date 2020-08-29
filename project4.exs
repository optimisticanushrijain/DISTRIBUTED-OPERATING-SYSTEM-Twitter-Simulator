defmodule Project4 do 

    [n,num_tweets]  = System.argv()
    
    num_tweets = elem(Integer.parse(num_tweets),0)
    n         = elem(Integer.parse(n),0)

    Test.test(n,num_tweets)
end