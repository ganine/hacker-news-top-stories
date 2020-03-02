require 'rails_helper'

describe Comment, type: :model do
  it { is_expected.to respond_to :item_id }
  it { is_expected.to respond_to :author }
  it { is_expected.to respond_to :content }
  it { is_expected.to respond_to :published_at }
  it { is_expected.to respond_to :url }
end
