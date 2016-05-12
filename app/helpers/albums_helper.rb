module AlbumsHelper

  def display_album_artist(album)
    if album.artist_name 
      link_to album.artist_name, artist_path(album.artist)
    else
      button_to "Update", edit_album_path(album)
    end
  end

  def update_album_button(album)
    album.rel_date==nil || album.rel_date == 0 ? button_to("Update", edit_album_path(album)) : album.rel_date
  end

  def user_has(album)
    if user_signed_in? && current_user.albums.include?(album) 
       button_tag "Spin it!", {class: "spin-it", id: "album-#{album.id}", data: "#{album.id}"} #<--ID IS A STUB TO MAKE AJAX WORK
    elsif user_signed_in?
      button_to "Add", add_album_path(album), {class: "add-album", id: "album-#{album.id}", data: "#{album.id}"}
    else 
      button_to "Build your collection!", signin_path
    end 
  end

  def see_or_find_on_discogs(album)
    if album.alb_url
      link_to "See on Discogs", "http://www.discogs.com/#{album.alb_url}"
    else
      link_to "Find on Discogs", "http://www.discogs.com/search/?q=#{album.title}+#{album.rel_id}"
    end
  end

  def spin_options(album)

    if current_user.spins(album) == 0 
      button_tag "Spin it!", class: "spin-it", id: "album-#{album.id}", data: "#{album.id}"
    else
      content_tag(:h2, "Spin count: #{current_user.spins(album)}") + 
      content_tag(:h3, "Last Spun: #{album.last_spun.strftime("%A, %B %C")}") +
      button_tag("Spin it again!", {class: "spin-it", id: "album-#{album.id}", data: "#{album.id}"})
    end


  end
end
