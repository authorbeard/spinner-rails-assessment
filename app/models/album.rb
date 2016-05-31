class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs
  has_many :user_albums
  has_many :fans, through: :user_albums, :source=>:user

  validates_presence_of :title
  has_attached_file :cover, default_url: ':style/default.png'
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  
  accepts_nested_attributes_for :artist, reject_if: :empty?
  accepts_nested_attributes_for :songs, reject_if: :empty?

  def empty?
    attributes["name"].blank? || attributes["songs_ids"].all?{|i| i==""}
  end
  
  def artist_attribues=(attributes)
    self.artist=Artist.find_or_create_by(name: attributes["name"].strip.capitalize)
  end

  def songs_attributes=(attributes)
    if !attributes.empty?
      # self.songs.delete_all
      if attributes["song_ids"]
    byebug
        songs=attributes["song_ids"].delete_if{|i| i==""}
        songs.each{|s| self.songs << Song.find_by(id: s)}
        self.save
      else
    byebug
        attributes["title"].split(",").each{|t|
          t.strip.capitalize
          self.songs.find_or_create_by(title: t, artist_id: self.artist.id) unless attributes["title"].empty?
        }
      end      
    end
  end

  def artist_name
    artist ? artist.name : nil
  end

  def total_spins
    user_albums.sum(:spins)
  end

  def last_spun
    user_albums.order(last_spun: :desc).first.try(:last_spun)
  end

  def last_user
    user_albums.order(last_spun: :desc).first.try(:user_id)
  end

  def recently_spun_albums
    user_albums.order(last_spun: :desc).first.try(:last_spun)
  end

  def import_songs
    agent=Mechanize.new
    search=agent.get("http://www.discogs.com").form(id: "site_search")
    search.q=self.search_q
    results=agent.submit(search)
    self.alb_url=results.search("div.card a")[0]["href"]
    alb_pg=agent.get(self.alb_url)
    t_names=alb_pg.search("tr.track").search("span.tracklist_track_title").collect{|t| t.text}
    t_names.each {|t| self.songs << Song.find_or_create_by(title: t, artist_id: self.artist_id)}
    self.save 
  end

### CLASS METHODS ### =
  def self.with_fans
    where("id IN (?)", UserAlbum.albums_with_fans)
  end

  def self.without_fans
    where.not("id IN (?)", UserAlbum.albums_with_fans)
  end


  def self.rankings
    UserAlbum.raw_rankings.collect{|a| [self.find(a[0]), a[1]]}
  end




end
