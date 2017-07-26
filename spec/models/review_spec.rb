require 'rails_helper'

describe Review do
  it { should belong_to :bakery }
  it { should belong_to :user }

  it { should have_valid(:rating).when(1, 5) }
  it { should_not have_valid(:rating).when(nil, '', 'five') }

  it { should have_valid(:total_votes).when(0, 20) }
  it { should_not have_valid(:total_votes).when(nil, '') }
end
