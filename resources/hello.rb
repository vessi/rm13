# Hello world resource => /
class HelloResource < Webmachine::Resource
  def trace?
    true
  end

  def allowed_methods
    %w(GET OPTIONS)
  end

  def content_types_provided
    [
      ['application/json', :to_json]
    ]
  end

  def to_json
    '{"message":"hello world"}'
  end
end
