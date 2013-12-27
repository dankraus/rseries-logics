require 'spec_helper'

describe Palette do
  subject do
    Palette.create(author_id: 1)
  end

  it { should respond_to(:author_id) }
end
