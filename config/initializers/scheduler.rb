# Setup Twitter Client
client = Twitter::REST::Client.new do |config|
	config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

# Setup Bitly
Bitly.use_api_version_3
Bitly.configure do |config|
  config.api_version = 3
  config.access_token = ENV["BITLY_ACCESS_TOKEN"]
end

# Setup Giphy
Giphy::Configuration.configure do |config|
  #config.version = THE_API_VERSION
  config.api_key = ENV["GIPHY_API_KEY_PUBLIC"]
end

# Setup Scheduler
scheduler = Rufus::Scheduler.new

# Setup Giants hashtags
giants_hashtags = [" #EvenYear", " #BeatTheCubs", " #SFGiants", " #GoGiants", " #BeatTheCubs", " #GiantsNLDS"]
# Setup Giants twitter accounts
giants_players = ["bbelt9","gregorblanco7","busterposey","bcraw35","sergioromo54","hunterpence","thisisdspan","joepanik","ehire21","1trevorbrown","JohnnyCueto","G_Kontos"]
giants_commentariat = ["flemmingdave","AlexPavlovic","extrabaggs","mccoveychron","hankschulman","sfg_stats","@Finnertys","@AmyGGiants","CSNGiants","baseballmarty","RayWoodson680","sportslarryknbr","KRON4GRadnich"]
giants_other = ["ChatSFGiants","giant_potential","carmenkiew","LOLKNBR","CandlestickWill","ATTSeagull","KarlTheFog","SFGiants","SFGiantsFans","BASportsGuy","GiantsUmp"]
giants_tweeps = giants_players + giants_commentariat + giants_other
ns_tweeps = []
# Setup Giants Quotes
giants_quotes = [
	"That's right, Lon, I didn't even have breakfast this morning.",
	"It's hard to win when you can't keep the ball in the ballpark.",
	"To become successful, one must put themselves in the paths of giants.",
	"Hum Baby",
	"It Is OUTA Here!",
	"Just another laugher",
	"Grab some pine, Meat",
	"Tell it Goodbye",
	"Your San Francisco Giants",
	"It's Giants Baseball",
	"I got a fever, and the only Prescription is #EvenYear",
	"For five years in the minor leagues, I wore the same underwear and still hit .250, so no, I don't believe in that stuff.",
	"Bye Bye Baby",
	"Baseball is disguised combat. For all its gentility, its almost leisurely pace, baseball is violence under wraps.",
	"3 things in life I really love: God, family & baseball. But once baseball season starts I change the order around a bit.",
	"Marichal: Only me. I teach myself",
	"If I have seen further than others, it is by standing upon the shoulders of giants.",
	"We're giants, and we're unaware of things that are too small for us to see.",
	"...sublime and touching, childlike and of the race of giants.",
	"Pray look better, Sir... those things yonder are no Cubs, but Giants."]

giants_media = [
	"http://gph.is/2d4Jo80?tc=1",
	"https://s-media-cache-ak0.pinimg.com/474x/95/db/b3/95dbb38d56e09435fd634f045e48e0b7.jpg",
	"http://gph.is/2ci8j5f?tc=1",
	"https://s-media-cache-ak0.pinimg.com/474x/cc/c0/be/ccc0be161c72a32785809251bb2e055d.jpg",
	"http://gph.is/1sETEbS?tc=1",
	"http://gph.is/2cnwGyq?tc=1",
	"https://s-media-cache-ak0.pinimg.com/474x/65/22/ef/6522effa0c776aebfaf377b4f1ff1121.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/2d/da/af/2ddaaf49853dd4aa7dce1eccb1eb98b3.jpg",
	"http://gph.is/2cwvI7B?tc=1",
	"https://s-media-cache-ak0.pinimg.com/474x/5a/a8/b8/5aa8b8de302d38b8dc6cbb389dccd865.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/91/6b/02/916b0274aa34620ef3699915e504f89a.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/97/9e/94/979e9478a7490fcc72506c29f08acbc4.jpg",
	"https://youtu.be/6TZuPVhSl_Y",
	"https://s-media-cache-ak0.pinimg.com/474x/8b/d3/d8/8bd3d87f3dfb3ba21cf839d124194d30.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/a5/56/c9/a556c9afaf7d542f0218beab6d5e468b.jpg",
	"https://www.youtube.com/watch?v=YJmwofDYOeo",
	"https://s-media-cache-ak0.pinimg.com/474x/58/62/98/586298021115f448a22fe7ae547c23d3.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/3f/7b/68/3f7b6825cbf4fdb36c201cfbf6769c29.jpg",
	"http://gph.is/2cnwTSr?tc=1",
	"https://s-media-cache-ak0.pinimg.com/474x/40/91/d8/4091d8b0c54b38a369460aaf38451ef3.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/f7/d7/18/f7d718a555990555ad13274f1a31f3c8.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/33/74/1c/33741c4ee15c7f4bf42940cbd6fd9416.jpg",
	"http://gph.is/2chs39i?tc=1",
	"https://s-media-cache-ak0.pinimg.com/474x/e3/c9/31/e3c93122fe36536390d5e2d32ea398c6.jpg",
	"https://www.youtube.com/watch?v=EiyC-MaQ18A",
	"https://s-media-cache-ak0.pinimg.com/474x/95/72/2e/95722e7496a4820616674f0b961ba321.jpg",
	"",
	"https://s-media-cache-ak0.pinimg.com/474x/26/85/15/268515714fe53aa3c8939274f8c4937f.jpg",
	"http://i.imgur.com/c8cXLZ0.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/ce/2f/1a/ce2f1a664083d4939df9cf6d769f5e6e.jpg",
	"http://gph.is/2dUZ50i?tc=1",
	"https://s-media-cache-ak0.pinimg.com/474x/8c/a8/51/8ca851042f2198f35d7a31a69c0a9027.jpg",
	"https://www.youtube.com/watch?v=r_XWwx9Z-iE",
	"https://s-media-cache-ak0.pinimg.com/474x/73/38/49/73384945a8563a9e8b24f45fc9f85c2f.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/45/71/0c/45710c7095725ffa9b81e182c201f0c6.jpg",
	"https://youtu.be/6TZuPVhSl_Y",
	"https://s-media-cache-ak0.pinimg.com/474x/d9/57/ce/d957cecc810f5fe7d620284d3f50e8f9.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/b9/74/43/b97443ce6733e8b30f208c11b7f963fa.jpg",
	"https://www.youtube.com/watch?v=uogT8X26-ko",
	"https://s-media-cache-ak0.pinimg.com/474x/c1/01/6a/c1016ada17a1e41b99e731f9eb8edc19.jpg",
	"https://youtu.be/6TZuPVhSl_Y",
	"https://s-media-cache-ak0.pinimg.com/474x/4f/f0/5b/4ff05b2ad0ccd4dcd6fb34bdae751848.jpg",
	"https://www.youtube.com/watch?v=qUlFRD_yRP8",
	"https://s-media-cache-ak0.pinimg.com/474x/c7/7a/b4/c77ab455a70afb34101437311a7e6ea1.jpg",
	"http://i.imgur.com/c8cXLZ0.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/4f/83/fe/4f83fe61bf4db73c2f6eb23c11050156.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/bf/25/6a/bf256a065808eaebfbfbf3cea7b926b5.jpg",
	"https://s-media-cache-ak0.pinimg.com/474x/b9/9f/91/b99f91cebf8561e8bf90d3921b0662f4.jpg",
	"https://youtu.be/BdiIDidLDec",
	" http://gph.is/1qpSlpO?tc=1",
	"https://youtu.be/6TZuPVhSl_Y",
	" http://gph.is/1XYwv1R?tc=1",
	"https://media2.giphy.com/media/zUhLC0QmnzAwo/200.gif",
	"https://media3.giphy.com/media/BofwSng1XpQJ2/200.gif",
	"https://www.youtube.com/watch?v=CPNgeGLX8DY",
	"https://media1.giphy.com/media/3gTQQ2teHpsWs/200w.gif",
	"https://youtu.be/6TZuPVhSl_Y",
	"https://media0.giphy.com/media/WjSJvbbxbz6da/200w.gif",
	"http://66.media.tumblr.com/ad7a67443677bb046466f081c7fe1c86/tumblr_mtz1grNfk81r0qezqo1_500.gif",
	"http://66.media.tumblr.com/ec16766bf31736ea9169aab1cd39f64d/tumblr_mtz2azQj0q1r0qezqo1_500.gif",
	"http://66.media.tumblr.com/c1557f7c25d7eca717677b189f79c058/tumblr_mtz5vuHEtu1r0qezqo1_500.gif"
]

scheduler.in '5s' do
	text = "Bots are Back! #{giants_hashtags[rand(0..giants_hashtags.length)]}"
	media = File.new(open(Giphy.random("attack-of-the-bots").image_url))
	if media.size.to_f / 2**20 > 2.4
		client.update(text)
	else
		client.update(text,media)
	end
end



##
### Tweet giants shit every 2 minutes
##
scheduler.every '5m' do
	do_or_not = rand(1..4)

	# RT Tweets from Giants, Giants commentators and others 
	# if the tweet has > 5 RTs and was sent less than 5 minutes ago
	giants_tweeps.each{|tweep|
		client.user_timeline(tweep, options = {:count => 5}).each{|tw|
			next if (Time.now - tw.created_at)/60 > 2
			client.retweet!(tw) if tw.retweet_count > 2
		}
	}

	# randomly

	if do_or_not == 1
		which_quote = rand(giants_quotes.length)
		which_hashtag = rand(giants_hashtags.length)
		# Tweet a Giants quote
		if giants_quotes[which_quote].length < (140-giants_hashtags[which_hashtag].length)
			tw = giants_quotes[which_quote] + giants_hashtags[which_hashtag]
		else
			tw = giants_quotes[which_quote][0..(140-giants_hashtags[which_hashtag].length)] + giants_hashtags[which_hashtag]
		end
		client.update(tw)
	#randomly	
	elsif do_or_not == 2
		# Tweet some Giants media
		#tw = Bitly.client.shorten().short_url + 
		text = giants_hashtags[rand(giants_hashtags.length)]
		media = giants_media[rand(giants_media.length)]
		client.update(text,File.new(open(media)))
	elsif do_or_not == 3
		giphy_searches = ["san-francisco-giants","sf-giants","bochy","madison-bumgarner","buster-posey","angel-pagan","hunter-pence"]
		# Tweet a random SF Giants gif from Giphy
		text = giants_hashtags[rand(giants_hashtags.length)]
		media = Giphy.random(giphy_searches[rand(giphy_searches.length+1)]).image_url
		client.update_with_media(text,File.new(open(media))) 
	else 
		# Do Nothing
	end

end #scheduler