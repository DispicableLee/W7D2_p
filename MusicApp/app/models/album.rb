# == Schema Information
#
# Table name: albums
#
#  id                  :bigint           not null, primary key
#  band_id             :bigint           not null
#  title               :string           not null
#  year                :integer          not null
#  is_studio_recording :boolean          default(TRUE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Album < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :is_studio_recording, inclusion: [true, false]

    belongs_to :band, class_name: 'Band', foreign_key: :band_id, dependent: :destroy
end
