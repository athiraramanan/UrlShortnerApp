##
# This class represents all the users in the system
class TinyUrl < ActiveRecord::Base
  FIELDS_RENDERED = [:id,:full_url,:shortend_url]
  METHODS_RENDERED =[]
  validates_presence_of :full_url,:shortend_url
	def as_json(options={})
    super(
      :methods => TinyUrl::METHODS_RENDERED,
      :only => TinyUrl::FIELDS_RENDERED
      )
  end


  def self.get_full_url shortend_url_data
    TinyUrl.select('full_url').where('BINARY shortend_url=?', shortend_url_data).last
  end

  def self.generate_tiny_url tiny_url
    shortend_url=Digest::MD5.hexdigest(tiny_url).slice(0..6)
    return shortend_url
  end

end
