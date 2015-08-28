require "dotenv"

class Homeostasis
  def self.call(target)
    new(target).call
  end

  def initialize(target)
    @target = target
  end

  def call
    result = load_dotenv
    bind_constants_to_target(result)
  end

  private

  attr_reader :target

  def bind_constants_to_target(result)
    result.each do |key, value|
      if not already_defined?(key)
        target.const_set(key, value)
      end
    end
  end

  def already_defined?(constant)
    if target.const_get(constant)
      true
    end
  rescue NameError
    false
  end

  def load_dotenv
    Dotenv.load
  end
end
