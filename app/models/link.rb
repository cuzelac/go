class Link < ActiveRecord::Base
  attr_accessible :shortcut, :target, :access_count

  validates :access_count, :presence => true, :default => 0
  #validates :access_count, :presence => true, :default => 0

  validates :shortcut,
            :presence => true,
            :format => {
              :with => /^[a-z\d]+(?:-[a-z\d]+)*[a-z\d]*$/,
              :message => "Only lower-case letters and numbers, with a dash as a word separator",
            }
  validates :target, :presence => true
end
