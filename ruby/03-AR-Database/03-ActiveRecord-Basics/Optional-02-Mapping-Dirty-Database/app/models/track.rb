class Track < ActiveRecord::Base
  self.table_name = "TRACK"

  belongs_to :album
  belongs_to :media_type
  belongs_to :genre
  has_one :artist, through: :album

  def seconds
    milliseconds.fdiv(1000).round
  end
end
