# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def url_of_paypal_checkout
    configatron.paypal.post_url
  end

  def current_locale
    I18n.locale
  end

  # TODO support :scope
  def t_required(locale_name)
    "#{t(locale_name)}&nbsp;<span class='required'>(#{t(:required)})</span>"
  end

  def render_flashes
    if (flash_message = flash[:error])
      level = 'error'
    elsif (flash_message = flash[:warning])
      level = 'warning'
    elsif (flash_message = flash[:notice])
      level = 'notice'
    end
    if (flash_message)
      render :partial => "shared/flash", :locals => {
        :level => level, :flash_message => flash_message}
    end
  end

  def registration_opened?
    datetime = RubyKaigi.latest.registration_open_at
    !!datetime.try(:past?)
  end

  def rubykaigi_org_feed_url(locale)
    if locale.to_sym == :ja
      "http://pipes.yahoo.com/pipes/pipe.run?_id=d74f71afb8dfc68ec415b47f53ec52aa&_render=rss"
    else
      "http://pipes.yahoo.com/pipes/pipe.run?_id=494b7af263b25d814618521c7148107f&_render=rss"
    end
  end

  def noindex_nofollow
    '<meta name="robots" content="noindex,nofollow" />'
  end
end
