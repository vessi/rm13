# Kudos resource => /kudo
class KudosResource < Webmachine::Resource
  def trace?
    true
  end

  def allowed_methods
    %w(POST)
  end

  def content_types_accepted
    [
      ['application/json', :from_json]
    ]
  end

  def post_is_create?
    true
  end

  def create_path
    "/kudos/#{next_id}"
  end

  private

  def from_json
    new_kudo.save
    response.body = new_kudo.to_json
  end

  def next_id
    new_kudo.id
  end

  def new_kudo
    @new_kudo ||= Kudo.new(params)
  end

  def params
    JSON.parse(request.body.to_s)
  end
end
