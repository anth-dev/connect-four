# frozen_string_literal: true

class Token
  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end
end
