class Professor < ActiveRecord::Base

  has_many :ratings, dependent: :destroy
  accepts_nested_attributes_for :ratings, reject_if: lambda { |attributes| attributes['course'].blank? || attributes['comment'].blank? || attributes['rating'].blank? }

  validates :first, presence: true
  validates :last, presence: true
  validates :university, presence: true

  def name
    first + ' ' + last
  end

end
