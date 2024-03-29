require 'rails_helper'

describe Story, type: :model do
  it { is_expected.to respond_to :item_id }
  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :author }
  it { is_expected.to respond_to :published_at }
  it { is_expected.to respond_to :url }
  it { is_expected.to respond_to :comments_count }
end
