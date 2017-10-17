# == Schema Information
#
# Table name: messages_v1
#
#  id              :integer          not null, primary key
#  content         :text
#  conversation_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  
  scope :for_display, -> (conversation) { where(conversation: conversation).order(:created_at).last(50) }
  
end
