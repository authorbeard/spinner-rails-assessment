module AlbumsHelper

  def display_album_artist(album)
    if album.artist_name
      link_to album.artist_name, artist_path(album.artist)
    else
      button_to "Add", edit_album_path(album)
    end
  end

  def add_album_button(album)
    album.rel_date==nil || album.rel_date == 0 ? button_to("Add", edit_album_path(album)) : album.rel_date
  end

  def user_has(album)
    if user_signed_in? && current_user.albums.include?(album) 
       button_tag "Spin it!", {class: "spin-it", id: "#{album.id}"} #<--ID IS A STUB TO MAKE AJAX WORK
    else
      button_to "Add", user_add_album_path(album)
    end 
  end

  def see_or_find_on_discogs(album)
    if album.alb_url
      link_to "See album's Discogs page.", "http://www.discogs.com/#{album.alb_url}"
    else
      link_to "Search on Discogs.com", "http://www.discogs.com/search/?q=#{album.title}+#{album.rel_id}"
    end
  end
end
