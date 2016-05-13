class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :user_albums, only: [:spins, :last_spun]
  # has_many :albums
end



# ualbs=["{\"user\":{\"id\":1,\"name\":\"coderbeard\",\"user_albums\":[{\"spins\":17,\"last_spun\":\"2016-05-12T15:24:38.702Z\"},{\"spins\":4,\"last_spun\":\"2016-05-07T00:56:54.416Z\"},{\"spins\":4,\"last_spun\":\"2016-05-12T18:28:45.628Z\"},{\"spins\":1,\"last_spun\":\"2016-05-12T18:29:25.838Z\"},{\"spins\":4,\"last_spun\":\"2016-05-12T14:22:16.094Z\"},{\"spins\":7,\"last_spun\":\"2016-05-12T20:12:48.006Z\"},{\"spins\":3,\"last_spun\":\"2016-05-12T20:13:09.867Z\"},{\"spins\":5,\"last_spun\":\"2016-05-12T15:35:57.056Z\"},{\"spins\":5,\"last_spun\":\"2016-05-12T20:27:34.113Z\"},{\"spins\":4,\"last_spun\":\"2016-05-12T15:14:40.491Z\"},{\"spins\":1,\"last_spun\":\"2016-05-07T00:55:58.905Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":7,\"last_spun\":\"2016-05-12T16:13:01.398Z\"},{\"spins\":2,\"last_spun\":\"2016-05-12T16:13:12.613Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":1,\"last_spun\":\"2016-05-12T16:25:33.583Z\"},{\"spins\":2,\"last_spun\":\"2016-05-12T16:26:00.688Z\"},{\"spins\":1,\"last_spun\":\"2016-05-12T16:26:07.185Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":1,\"last_spun\":\"2016-05-12T14:40:46.062Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":2,\"last_spun\":\"2016-05-12T20:32:55.886Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":2,\"last_spun\":\"2016-05-07T01:21:59.056Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":5,\"last_spun\":\"2016-05-12T14:47:05.331Z\"},{\"spins\":1,\"last_spun\":\"2016-05-12T14:56:54.326Z\"},{\"spins\":3,\"last_spun\":\"2016-05-07T01:03:16.217Z\"},{\"spins\":1,\"last_spun\":\"2016-05-07T01:03:45.692Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":5,\"last_spun\":\"2016-05-07T01:41:45.401Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":1,\"last_spun\":\"2016-05-07T01:13:29.864Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null},{\"spins\":1,\"last_spun\":\"2016-05-09T23:03:38.449Z\"},{\"spins\":0,\"last_spun\":null},{\"spins\":0,\"last_spun\":null}]}}"]